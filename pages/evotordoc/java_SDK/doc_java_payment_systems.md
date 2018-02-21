---
title: Способы оплаты
keywords: чек, печатная, группа, платёжные, системы, манифест
summary:
sidebar: evotordoc_sidebar
permalink: doc_java_payment_systems.html
tags: [terminal, java]
folder: java_SDK
---

Пользователи Эвотор могут установить на смарт-терминал приложения для работы с различными платёжными системами. После установки приложения платёжной системы, на экране оплаты/возврата товара, помимо кнопок **Наличные** и **Банковская карта**, добавляется кнопка платёжной системы.

{: .center-image}
![](images/payment_system.png)

## Служба для взаимодействия со сторонними платёжными системами

*Чтобы добавить поддержку сторонней платёжной системы:*

1. В манифесте приложения, добавьте разрешение:

   ```xml
   <uses-permission android:name="ru.evotor.permission.PAYMENT_SYSTEM" />
   ```

2. Создайте службу и назовите её, например `.PaymentService`.

   Служба будет обрабатывать событие [`evo.v2.receipt.paymentSystem`](./doc_app_integration_points.html#Callbacks).

   Событие содержит поле `OperationType`, которое указывает тип операции:

      * `OperationType.SELL` – продажа;
      * `OperationType.SELL_CANCEL` – отмена продажи;
      * `OperationType.PAYBACK` – возврат;
      * `OperationType.PAYBACK_CANCEL` – отмена возврата.

   Каждому типу операции соответствует событие и метод, который его обрабатывает. Методы представлены в классе `PaymentSystemProcessor.kt`:

   ```kotlin
   abstract class PaymentSystemProcessor : ActionProcessor() {
       override fun process(action: String, bundle: Bundle?, callback: ActionProcessor.Callback) {
           val event = PaymentSystemEvent.create(bundle) ?: return

           when (event.operationType) {
               PaymentSystemEvent.OperationType.SELL -> sell(action, event as PaymentSystemSellEvent, callback)
               PaymentSystemEvent.OperationType.SELL_CANCEL -> sellCancel(action, event as PaymentSystemSellCancelEvent, callback)
               PaymentSystemEvent.OperationType.PAYBACK -> payback(action, event as PaymentSystemPaybackEvent, callback)
               PaymentSystemEvent.OperationType.PAYBACK_CANCEL -> paybackCancel(action, event as PaymentSystemPaybackCancelEvent, callback)
               else -> null
           }
       }
   ```

   Ваша служба должна реализовывать все методы, описанные в классе.

3. Измените раздел службы `.PaymentService` в манифесте приложения:

   ```xml
   <service
       android:name=".PaymentService"
       android:exported="true"
       android:icon="@android:drawable/ic_dialog_map"
       android:label="Текст на кнопке">
       <meta-data
           android:name="ru.evotor.sales_screen.BACKGROUND_COLOR"
           android:value="@android:color/holo_green_light" />
       <meta-data
           android:name="ru.evotor.paymentSystem.PAYMENT_SYSTEM_ID"
           android:value="ru.test.testapplication.paymentSystem.packageName" />

       <intent-filter>
           <action android:name="evo.v2.receipt.paymentSystem" />
       </intent-filter>
   </service>
   ```

   Где:

   * Элемент `ru.evotor.sales_screen.BACKGROUND_COLOR` задаёт цвет кнопки платёжной системы.
   * Элемент `ru.evotor.paymentSystem.PAYMENT_SYSTEM_ID` задаёт уникальный идентификатор приложения. Уникальность идентификатора необходима, чтобы смарт-терминал всегда мог определить с какой платёжной системой он взаимодействует. Идентификатор остаётся неизменным даже, если название службы изменилось при обновлении приложения.

   {% include tip.html content="Хорошей практикой является использование packageName приложения в идентификаторе." %}

   * В `intent-filter` подпишите службу на получение события `evo.v2.receipt.paymentSystem`.

4. После обработки события `evo.v2.receipt.paymentSystem`, служба `.PaymentService` должна возвращать соответствующий результат.

   В случае удачной обработки события служба возвращает результат [`PaymentSystemPaymentOkResult`](./doc_java_payment_systems.html#okResult).

   В случае неудачной обработки события служба возвращает результат [`PaymentSystemPaymentErrorResult`](./doc_java_payment_systems.html#error).

## События

В зависимости от операции на смарт-терминале в службу могут поступать четыре типа событий.

### Продажа

При продаже товара приходит событие `PaymentSystemSellEvent.kt`:

```kotlin
class PaymentSystemSellEvent(
        val receiptUuid: String,
        val accountId: String?,
        val sum: BigDecimal,
        val description: String?
)
```

Где:

* `receiptUuid` – идентификатор чека.
* `accountId` – счёт (учётная запись) в платёжной системе. Поле указывать необязательно.
* `sum` – сумма платежа.
* `description` – текстовое описание. Поле может быть указано любым приложением, например, при разделении чека. В приложении требуется предусмотреть возможность отображения этого поля.

### Отмена продажи

При отмене продажи приходит событие `PaymentSystemSellCancelEvent.kt`:

```kotlin
class PaymentSystemSellCancelEvent(
        val receiptUuid: String,
        val accountId: String?,
        val sum: BigDecimal,
        val rrn: String?,
        val description: String?
)
```

Где:

* `receiptUuid` – идентификатор чека.
* `accoundId` – счёт (учётная запись) в платёжной системе.
* `sum` – сумма платежа.
* `rrn` – уникальный идентификатор платежа, который будет отменён.
* `description` – текстовое описание. Поле может быть указано любым приложением, например, при разделении чека. В приложении требуется предусмотреть возможность отображения этого поля.

### Возврат

При возврате товара приходит событие `PaymentSystemPaybackEvent.kt`:

```kotlin
class PaymentSystemPaybackEvent(
        val receiptUuid: String,
        val accountId: String?,
        val sum: BigDecimal,
        val rrn: String?,
        val description: String?
)
```

Где:

* `receiptUuid` – идентификатор чека.
* `accoundId` – счёт (учётная запись) в платёжной системе.
* `sum` – сумма платежа.
* `rrn` – уникальный идентификатор платежа, по которому будет проведён возврат.
* `description` – текстовое описание. Поле может быть указано любым приложением, например, при разделении чека. В приложении требуется предусмотреть возможность отображения этого поля.

### Отмена возврата

При отмене возврата приходит событие `PaymentSystemPaybackCancelEvent.kt`:

```kotlin
class PaymentSystemPaybackCancelEvent(
        val receiptUuid: String,
        val accountId: String?,
        val sum: BigDecimal,
        val rrn: String?,
        val description: String?
)
```

Где:

* `receiptUuid` – идентификатор чека.
* `accoundId` – счёт (учётная запись) в платёжной системе.
* `sum` – сумма платежа.
* `rrn` – уникальный идентификатор платежа, который будет отменён.
* `description` – текстовое описание. Поле может быть указано любым приложением, например, при разделении чека. В приложении требуется предусмотреть возможность отображения этого поля.

## Результаты

### Успешная обработка события {#okResult}

В случае успешной обработки события служба должна возвращать результат `PaymentSystemPaymentOkResult`:

```kotlin
class PaymentSystemPaymentOkResult(
        val rrn: String,
        val slip: List<String>,
        val paymentInfo: String?,
        val paymentType: PaymentType = PaymentType.ELECTRON
)
```

Где:

* `rrn` – уникальный идентификатор платежа, который понадобится при отмене транзакции.
* `slip` – текст, который будет напечатан на чеке в двух экземплярах.
* `paymentInfo` – поле для хранения статистической информации. Приложение не заполняет это поле.
* `paymentType` – тип оплаты. По умолчанию `ELECTRON`.

### Ошибка обработки события {#error}

В случае ошибки служба должна возвращать результат `PaymentSystemPaymentErrorResult.kt`:

```kotlin
class PaymentSystemPaymentErrorResult(
        val errorDescription: String?
)
```

Где:

* `errorDescription` – описание ошибки.

## Пример службы `PaymentService`

Пример работы с PaymentSystem API в [демонстрационном приложении](https://github.com/evotor/evotor-api-example/blob/master/app/src/main/java/ru/qualitylab/evotor/evotortest6/PayApiActivity.java).

Пример службы `PaymentService`, которая поддерживает все методы класса `PaymentSystemProcessor.kt`:

```java
public class PaymentService extends IntegrationService {

    public static final String TAG = "PaymentService";

    @Nullable
    @Override
    protected Map<String, ActionProcessor> createProcessors() {
        Map<String, ActionProcessor> processorMap = new HashMap<>();

        processorMap.put(
                PaymentSystemEvent.NAME_ACTION,
                new PaymentSystemProcessor() {

                    @Override
                    public void sell(String s, PaymentSystemSellEvent paymentSystemSellEvent, Callback callback) {
                        Log.e(TAG, "sell " + paymentSystemSellEvent);
                        Intent intent = new Intent(PaymentService.this, PaymentActivity.class);
                        intent.putExtra(EXTRA_NAME_OPERATION, "sell");
                        try {
                            callback.startActivity(intent);
                        } catch (RemoteException exc) {
                            exc.printStackTrace();
                        }
                    }

                    @Override
                    public void sellCancel(String s, PaymentSystemSellCancelEvent paymentSystemSellCancelEvent, Callback callback) {
                        Log.e(TAG, "sellCancel " + paymentSystemSellCancelEvent);
                        Intent intent = new Intent(PaymentService.this, PaymentActivity.class);
                        intent.putExtra(EXTRA_NAME_OPERATION, "sellCancel");
                        try {
                            callback.startActivity(intent);
                        } catch (RemoteException exc) {
                            exc.printStackTrace();
                        }
                    }

                    @Override
                    public void payback(String s, PaymentSystemPaybackEvent paymentSystemPaybackEvent, Callback callback) {
                        Log.e(TAG, "payback " + paymentSystemPaybackEvent);
                        Intent intent = new Intent(PaymentService.this, PaymentActivity.class);
                        intent.putExtra(EXTRA_NAME_OPERATION, "payback");
                        try {
                            callback.startActivity(intent);
                        } catch (RemoteException exc) {
                            exc.printStackTrace();
                        }
                    }

                    @Override
                    public void paybackCancel(String s, PaymentSystemPaybackCancelEvent paymentSystemPaybackCancelEvent, Callback callback) {
                        Log.e(TAG, "paybackCancel " + paymentSystemPaybackCancelEvent);
                        Intent intent = new Intent(PaymentService.this, PaymentActivity.class);
                        intent.putExtra(EXTRA_NAME_OPERATION, "paybackCancel");
                        try {
                            callback.startActivity(intent);
                        } catch (RemoteException exc) {
                            exc.printStackTrace();
                        }
                    }
                }
            }
        );
}
```

## Пример операции PaymentActivity

```java
package ru.apptest.test.testapplication;

import android.os.Bundle;
import android.view.View;
import android.widget.TextView;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import ru.evotor.framework.core.IntegrationActivity;
import ru.evotor.framework.core.action.event.receipt.payment.system.result.PaymentSystemPaymentErrorResult;
import ru.evotor.framework.core.action.event.receipt.payment.system.result.PaymentSystemPaymentOkResult;
import ru.evotor.framework.payment.PaymentType;

public class PaymentActivity extends IntegrationActivity {

    public static final String EXTRA_NAME_OPERATION = "EXTRA_NAME_OPERATION";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_payment);

        findViewById(R.id.button_ok).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String rrn = "";
                Random random = new Random();
                for (int i = 0; i < 10; i++) {
                    rrn += random.nextInt(10);
                }
                List<String> slip = new ArrayList<String>();
                slip.add("SLIP START");
                slip.add("RRN:");
                slip.add(rrn);
                slip.add("SLIP EMD");
                setIntegrationResult(new PaymentSystemPaymentOkResult(rrn, slip, "123qwe", PaymentType.ELECTRON));
                finish();
            }
        });

        findViewById(R.id.button_error).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                setIntegrationResult(new PaymentSystemPaymentErrorResult("beda was happened"));
                finish();
            }
        });

        if (getIntent().hasExtra(EXTRA_NAME_OPERATION)) {
            ((TextView) findViewById(R.id.textView_operation)).setText(getIntent().getStringExtra(EXTRA_NAME_OPERATION));
        }

    }

    @Override
    public void onBackPressed() {
        setIntegrationResult(new PaymentSystemPaymentErrorResult("onBackPressed was happened"));
        finish();
    }
}
```
