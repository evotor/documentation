---
title: Работа с чеком
keywords: sample
summary: Раздел содержит инструкцию по созданию простого java-приложения для смарт-терминала. На разных этапах приложение обладает разными функциями. Так итоговое приложение сможет: показывать экран приложения по нажатию на плитку на главном экране смарт-терминала, получать информацию о том, что в чек добавлен определённый товар, выводить экран с предложением добавить к этому товару ещё один, получать информацию о закрытии чека и записывать сообщение об этом в лог.
sidebar: evotordoc_sidebar
permalink: doc_receipt_interactions.html
folder: smart_terminal_SDK
---

### Требования

Перед разработкой приложения убедитесь что:
* На смарт-терминале установлена прошивка версии 2.4.0 или выше.
* Версия приложения Evotor POS, установленного на смарт-терминале, 6.8.0 или выше.
* Для приложения указан соответствующий разработчик на сайте [developer.evotor.ru](https://developer.evotor.ru)
* Вы можете подключиться к смарт-терминалу с помощью adb для отладки приложения.


### Подключение библиотеки integration-library.

Все зависимости, необходимые для разработки Java-приложения, хранятся в библиотеке integration-library.

Для разработки приложения подключите библиотеку к своему проекту:

1. В файле `build.gradle` проекта укажите:

    ```1
    allprojects {
        repositories {
            jcenter()
            maven { url 'https://jitpack.io' }
        }
    }
   ```

2. В файле `build.gradle` приложения, в зависимости добавьте библиотеку integration-library:

    ```1
    dependencies {
    compile fileTree(dir: 'libs', include: ['*.jar'])
    androidTestCompile('com.android.support.test.espresso:espresso-core:2.2.2', {
        exclude group: 'com.android.support', module: 'support-annotations'
    })
    compile 'com.android.support:appcompat-v7:25.3.1'
    compile 'com.android.support.constraint:constraint-layout:1.0.2'
    compile 'com.android.support:design:25.3.1'
    compile group: 'com.github.evotor', name: 'integration-library', version: 'v0.3.15', changing: true
    testCompile 'junit:junit:4.12'
    }
    ```
    {% include note.html content="Убедитесь, что в зависимости указана [актуальная версия библиотеки](https://github.com/xcam/integration-library/)." %}

### Пример 1. Добавление плитки приложения на главный экран смарт-терминала

Вы можете вызывать интерфейс своего приложения по нажатию на плитку, расположенную на главном экране смарт-терминала.

Чтобы добавить плитку приложения на главный экран:
1. Добавьте в приложение новую операцию (элемент `<activity>`).
    Например,
2. В элементе `<activity>` укажите элементы `<meta-data>` и `<intent-filter>`.
    {% highlight xml %}
         <activity
            android:name=".MainActivity"
            android:label="@string/title_activity_main"
            android:theme="@style/AppTheme.NoActionBar">
            <meta-data
                android:name="ru.evotor.launcher.BACKGROUND_COLOR"
                android:value="#133788" />

            <intent-filter>
                <action android:name="android.intent.action.MAIN" />

                <category android:name="android.intent.category.EVOTOR" />
            </intent-filter>
        </activity>
    {% endhighlight %}
3. Соберите и установите приложение на смарт-терминал.

    Полученное приложение добавит на главный экран терминала плитку, по которой открывается экран MainActivity.

### Пример 2. Получение сообщений от терминала

Терминал рассылает сообщения двух типов:
* События, на которые требуется ответ приложения.
* Широковещательные сообщения, на которые ответ приложения не требуется.

Чтобы приложение получало события:
1. В вашем проекте создайте службу, например `MyIntegrationService`.
{}
    public class MyIntegrationService extends IntegrationService {


        @Nullable
        @Override
        protected Map<String, ActionProcessor> createProcessors() {
            Map<String, ActionProcessor> map = new HashMap<>();

            map.put(BeforePositionsEditedEvent.NAME_SELL_RECEIPT, new BeforePositionsEditedEventProcessor() {
                @Override
                public void call(@NonNull String action, @NonNull BeforePositionsEditedEvent beforePositionsEditedEvent, @NonNull Callback callback) {
                    Log.d("MyIntegrationService", "Handle event: " + action);
                    try {
                        callback.skip();
                    } catch (RemoteException e) {
                        e.printStackTrace();
                    }
                }
            });

            return map;
        }
    }
