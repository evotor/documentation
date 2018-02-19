---
title: Вызов окон смарт-терминала
keywords: интерфейс, окно, методы, навигация
summary: Раздел содержит описание методов класса NavigationApi, а так же пример вызова окон смарт-терминала.
sidebar: evotordoc_sidebar
permalink: doc_java_navigation.html
tags: [terminal, java]
folder: java_SDK
---

## Описание

С помощью методов класса [`NavigationApi`](https://github.com/evotor/integration-library/blob/develop/src/main/java/ru/evotor/framework/navigation/NavigationApi.kt) приложения вызывают различные окна смарт-терминала.

## Методы

### createIntentForSellReceiptEdit

```
fun createIntentForSellReceiptEdit(): Intent
```

**Описание**

Открывает окно редактирования чека продажи.

**Возвращает**

* `Intent`

### createIntentForPaybackReceiptEdit

```
fun createIntentForPaybackReceiptEdit(): Intent
```

**Описание**

Открывает окно редактирования чека возврата.

**Возвращает**

* `Intent`

### createIntentForSellReceiptPayment

```
fun createIntentForSellReceiptPayment(): Intent
```

**Описание**

Открывает окно оплаты чека продажи.

**Возвращает**

* `Intent`

### createIntentForCashReceiptSettings

```
fun createIntentForCashReceiptSettings(): Intent
```

**Описание**

Открывает окно редактирования клише чека (**Настройки** → **Кассовый чек**).

{: .center-image}
![](images\receiptsettings.png)

**Возвращает**

* `Intent`

### createIntentForCashRegisterReport

```
fun createIntentForCashRegisterReport(): Intent
```

**Описание**

Открывает окно доступа к кассовым отчётам (**Отчёты** → **Кассовый отчёт**).

{: .center-image}
![](images\CashRegisterReport.png)

**Возвращает**

* `Intent`

### createIntentForChangeUser

```
fun createIntentForChangeUser(): Intent
```

**Описание**

Открывает окно смены пользователей.

**Возвращает**

* `Intent`

### createIntentForNewProduct

```
fun createIntentForNewProduct(productBuilder: NewProductIntentBuilder): Intent

```

**Описание**

Открывает окно создания нового товара.

**Параметры**

* `productBuilder`

```
   class NewProductIntentBuilder {
       private var barcode: String? = null

       fun setBarcode(barcode: String?): NewProductIntentBuilder {
           this.barcode = barcode
           return this
       }

       @JvmSynthetic
       internal fun build() = Intent(ACTION_EDIT_PRODUCT).apply {
           barcode?.let {
               putExtra(EXTRA_BARCODE, it)
           }
       }
   }
```

**Возвращает**

* `Intent`

### createIntentForEditProduct

```
fun createIntentForEditProduct(productBuilder: EditProductIntentBuilder): Intent
```

**Описание**

Открывает окно редактирования товара.

**Параметры**

* `productBuilder`

```
   class EditProductIntentBuilder {
       private lateinit var uuid: String

       fun setUuid(uuid: String): EditProductIntentBuilder {
           this.uuid = uuid
           return this
       }

       @JvmSynthetic
       internal fun build() = Intent(ACTION_EDIT_PRODUCT).apply {
           putExtra(EXTRA_PRODUCT_UUID, uuid)
       }
   }
```

**Возвращает**

* `Intent`

### getProductUuid

```
fun getProductUuid(intent: Intent): String?
```

**Описание**

Получает идентификатор товара при успешном добавлении.

**Параметры**

* `intent`

**Возвращает**

* `String`


## Пример

Пример вызова окон добавления и редактирования товара.

```java
public class PushSampleActivity extends IntegrationAppCompatActivity {

    public static final int REQUEST_CODE_FOR_NEW_PRODUCT = 10;
    public static final int REQUEST_CODE_FOR_EDIT_PRODUCT = 11;
    @Override

    public void onCreate(@Nullable Bundle savedInstanceState) {
        // вызов суперкласса onCreate, создающего операцию.
        super.onCreate(savedInstanceState);
        // NavigationApi.createIntentForNewProduct() открывает окно создания товара с указанным штрихкодом.
        startActivityForResult(NavigationApi.createIntentForNewProduct(
                new NavigationApi.NewProductIntentBuilder().setBarcode("111")), REQUEST_CODE_FOR_NEW_PRODUCT);
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == REQUEST_CODE_FOR_NEW_PRODUCT && resultCode == RESULT_OK) {
            //Toast.makeText() выводит на экран смарт-терминала сообщение
            //с идентификатором нового товара.
            //data.getStringExtra(NavigationApi.EXTRA_ADDED_PRODUCT_UUID) получает идентификатор
            //нового товара.
            Toast.makeText(this, "UUID : " + data.getStringExtra(NavigationApi.EXTRA_ADDED_PRODUCT_UUID)
                    , Toast.LENGTH_SHORT).show();

            //NavigationApi.createIntentForEditProduct() открывает окно редактирования товара.
            //.setUuid(data.getStringExtra(NavigationApi.EXTRA_ADDED_PRODUCT_UUID)) задаёт идентификатор
            //редактируемого товара.
            startActivityForResult(NavigationApi.createIntentForEditProduct(
                    new NavigationApi.EditProductIntentBuilder()
                            .setUuid(data.getStringExtra(NavigationApi.EXTRA_ADDED_PRODUCT_UUID))), REQUEST_CODE_FOR_EDIT_PRODUCT);

        } else if (resultCode == RESULT_CANCELED) {
            //Toast.makeText() выводит на экран смарт-терминала сообщение
            //об отмене создания нового товара.
            Toast.makeText(this, "CANCELED"
                    , Toast.LENGTH_SHORT).show();
        }
        if (requestCode == 11 && resultCode == RESULT_OK) {
            //Toast.makeText() выводит на экран смарт-терминала сообщение
            //об удачном создании и редактировании товара.
            Toast.makeText(this, "GG WP", Toast.LENGTH_SHORT).show();
        }
        super.onActivityResult(requestCode, resultCode, data);
    }

    @Override
    protected void onDestroy() {
        Toast.makeText(this, "OnDestroy", Toast.LENGTH_SHORT).show();
        super.onDestroy();
    }

}
```
