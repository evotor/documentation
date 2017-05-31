---
title: Работа с чеком
keywords: sample
summary:
sidebar: evotordoc_sidebar
permalink: doc_receipt_interactions.html
folder: smart_terminal_SDK
---

### Добавление, изменение, удаление позиций в чеке

Вы можете взаимодействовать с чеком: добавлять, изменять или удалять позиции. Для этого необходимо подписаться на события:
* добавления;
* замены;
* редактирования;
* удаления.


*Чтобы подписаться на события:*

1. Создайте службу, например `MyIntegrationService`, которая наследует классу `IntegrationService`. В колбэке `onCreate` службы, зарегистрируйте процессор `BeforePositionsEditedEventProcessor` (процессор наследует классу `ActionProcessor`).
    ~~~ java
    public class MyIntegrationService extends IntegrationService {
        @Override
        public void onCreate() {
            registerProcessor(new BeforePositionsEditedEventProcessor() {
                @Override
                public void call(BeforePositionsEditedEvent beforePositionsEditedEvent, Callback callback) {
                       });
                    }
                }
    ~~~
2. Объявите службу в манифесте приложения:
    ~~~ xml
    <service
            android:name=".MyIntegrationService"
            android:enabled="true"
            android:exported="true">
            <intent-filter>
                <category android:name="android.intent.category.DEFAULT" />
                <action android:name="evo.v2.receipt.sell.beforePositionsEdited" />
            </intent-filter>
    </service>
    ~~~

В метод `call` процессора приходит событие `beforePositionsEditedEvent` и объект для возврата результата `callback`.

Событие `beforePositionsEditedEvent` сообщает об изменении чека и содержит список изменений:

~~~ java
public class BeforePositionsEditedEvent {
    private static final String TAG = "PositionsEditedEvent";

    public static final String NAME = "evo.v2.receipt.sell.beforePositionsEdited";
    private static final String KEY_CHANGES = "changes";

    public static BeforePositionsEditedEvent create(Bundle bundle) {
        Parcelable[] changesParcelable = bundle.getParcelableArray(KEY_CHANGES);
        return new BeforePositionsEditedEvent(
                Utils.filterByClass(
                        ChangesMapper.INSTANCE.create(changesParcelable),
                        IPositionChange.class
                )
        );
    }

    private List<IPositionChange> changes;

    public BeforePositionsEditedEvent(List<IPositionChange> changes) {
        this.changes = changes;
    }

    public Bundle toBundle() {
        Bundle result = new Bundle();
        Parcelable[] changesParcelable = new Parcelable[changes.size()];
        for (int i = 0; i < changesParcelable.length; i++) {
            IChange change = changes.get(i);
            changesParcelable[i] = ChangesMapper.INSTANCE.toBundle(change);
        }
        result.putParcelableArray(KEY_CHANGES, changesParcelable);
        return result;
    }

    public List<IPositionChange> getChanges() {
        return changes;
    }
}
~~~

**Я не знаю куда и в каком виде воткнуть эти изменения:** возможные изменения:
https://github.com/xcam/integration-library/tree/extra_api/app/src/main/java/ru/evotor/framework/core/action/event/receipt/changes/position

В ответ изменения могут вернуть результат со списком дополнительных изменений:

~~~ java
public class BeforePositionsEditedEventResult {

    private static final String KEY_RESULT = "result";
    private static final String KEY_CHANGES = "changes";

    public static BeforePositionsEditedEventResult create(Bundle bundle) {
        String resultName = bundle.getString(KEY_RESULT);
        Parcelable[] changesParcelable = bundle.getParcelableArray(KEY_CHANGES);
        List<IChange> changes = ChangesMapper.INSTANCE.create(changesParcelable);
        List<IPositionChange> positionChanges = new ArrayList<>();
        for (IChange change : changes) {
            if (change instanceof IPositionChange) {
                positionChanges.add((IPositionChange) change);
            }
        }
        return new BeforePositionsEditedEventResult(
                Utils.safeValueOf(Result.class, resultName, Result.UNKNOWN),
                positionChanges
        );
    }

    private final Result result;
    private final List<IPositionChange> changes;

    public BeforePositionsEditedEventResult(Result result, List<IPositionChange> changes) {
        this.result = result;
        this.changes = changes;
    }

    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        bundle.putString(KEY_RESULT, result.name());
        Parcelable[] changesParcelable = new Parcelable[changes.size()];
        for (int i = 0; i < changesParcelable.length; i++) {
            IChange change = changes.get(i);
            changesParcelable[i] = ChangesMapper.INSTANCE.toBundle(change);
        }
        bundle.putParcelableArray(KEY_CHANGES, changesParcelable);
        return bundle;
    }

    public Result getResult() {
        return result;
    }

    public List<IPositionChange> getChanges() {
        return changes;
    }

    public enum Result {
        OK,
        UNKNOWN;
    }
}
~~~

Чтобы вернуть результат, используйте метод:
~~~ java
callback.onResult(beforePositionsEditedEventResult.toBundle())
~~~


Если приложению для возврата результата необходимо взаимодействие с пользователем, запустите операцию (`Activity`), которая наследует класс `BeforePositionsEditedEventActivity`:
~~~ java
callback.startActivity(new Intent(MyIntegrationService.this, MainActivity.class));
~~~

Ваша операция должна вызвать метод
`setIntegrationResult`.

Например, так:
~~~ java
setIntegrationResult(new BeforePositionsEditedEventResult(BeforePositionsEditedEventResult.Result.OK, changes));
~~~

Класс `BeforePositionsEditedEventActivity` задан так:
~~~ java
public class BeforePositionsEditedEventActivity extends IntegrationActivity {
    public void setIntegrationResult(BeforePositionsEditedEventResult result) {
        setIntegrationResult(result == null ? null : result.toBundle());
    }

    public BeforePositionsEditedEvent getEvent() {
        return BeforePositionsEditedEvent.create(getSourceBundle());
    }
}
~~~
