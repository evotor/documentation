---
title: Права приложения
keywords: sample
summary: "Раздел содержит информацию правах пользователей смарт терминала и примеры того, как получить данные о них."
sidebar: evotordoc_sidebar
permalink: doc_app_grants.html
tags: [Терминал, Java, JavaScript]
folder: smart_terminal_app_development
---

### О правах приложения

С помощью прав (grants), назначенных различным компонентам приложения, вы можете ограничить функциональность приложения для пользователей с определёнными ролями. Чтобы узнать список прав той или иной роли, используйте [Users API](doc_smart_terminal_users_api.html).

{% include note.html content="Чтобы приложение было доступно пользователю, список заданных прав приложения должен точно соответствовать списку прав роли пользователя. Пользователи создают и редактируют роли в [Личном  кабинете](https://lk.evotor.ru/web/login). Права предустановленных ролей \"Кассир\" и \"Администратор\" изменять нельзя." %}

![Добавление роли](images/Add_role.gif "Добавление роли")

Если оставить список прав пустым, приложение будет доступно любому пользоваетлю, независимо от роли.

### Java-приложение

Чтобы наделить java-приложение необходимыми правами, выполните следующие действия:

1. По адресу `res/values` создайте файл `<Название>_grants.xml`, где `<Название>` – имя требуемого плагина, демона или экрана.
2. В файле `<Название>_grants.xml` укажите массив строк с правами следующим образом:

   ```xml
   <resources>
   <string-array name="<Название>_grants">
       <item>CASH_OPERATIONS_SELL</item>
       <item>CASH_OPERATIONS_PAYBACK </item>
   </string-array>
   </resources>
   ```

3. В манифесте приложения, для соответствующей операции (`activity`), добавьте элемент `meta-data` со следующими атрибутами:

   ```xml
   <meta-data android:name="ru.evotor.launcher.GRANTS" android:resource="@array/<Название>_grants" />
   ```

### JS-приложение

Чтобы наделить плагин (plugin), демон (daemon) или экран (screen) JS-приложения необходимыми правами, выполните следующие действия:

1. В файле `client.yaml` добавьте список `grants` требуемых прав для соответствующего элемента (демона, плагина или экрана):

   ```yaml
   - name: <Название>
     header: "<Заголовок экрана>"
     launcher-label: "<Название плитики>"
     launcher-icon: client/views/example-loader/icon.png
     launcher-color: #133788
     source: client/views/example-loader/view.html
     scripts:
       - no-script
     styles:
       - "*.css"
     grants:
       - CASH_OPERATIONS_SELL
       - CASH_OPERATIONS_PAYBACK
   ```

2. По адресу `res/values` создайте файл `<Название>_grants.xml`, который содержит массив строк с правами, перечисленными в списке `grants`:

   ```xml
   <resources>
   <string-array name="<Название>_grants">
       <item>CASH_OPERATIONS_SELL</item>
       <item>CASH_OPERATIONS_PAYBACK </item>
   </string-array>
   </resources>
   ```


  Где `<Название>` – значение параметра `name` в файле `client.yaml`.

3. Убедитесь, что в созданном манифесте приложения, для соответствующей операции (`activity`) добавлен элемент `meta-data` со следующими атрибутами:

   ```xml
   <meta-data android:name="ru.evotor.launcher.GRANTS" android:resource="@array/<Название>_grants" />
   ```

### Примеры

Манифест приложения:

```xml
<activity android:name=".app.SomeJSWrappedActivity" android:theme="@style/JSWrappedTheme" android:icon="@drawable/icon" android:label="<Название плитки>">
    <intent-filter>
        <action android:name="android.intent.action.MAIN" />
        <category android:name="android.intent.category.EVOTOR" />
    </intent-filter>
    <meta-data android:name="ru.evotor.launcher.BACKGROUND_COLOR" android:value="#133788" />
    <meta-data android:name="ru.evotor.launcher.GRANTS" android:resource="@array/<Название>_grants" />
</activity>
```

Список прав в файле `res/values/<Название>_grants.xml`:

```xml
<resources>
<string-array name="<Название>_grants">
    <item>CASH_OPERATIONS_SELL</item>
    <item>CASH_OPERATIONS_PAYBACK </item>
</string-array>
</resources>
```




### Список прав

В таблице ниже представлены права, которыми вы можете наделить компоненты приложения.

CASH_OPERATIONS_SELL
: {{site.data.grants.CASH_OPERATIONS_SELL}}

CASH_OPERATIONS_SELL_ADDITIONAL_CHANGE_ZERO_PRICE
: {{site.data.grants.CASH_OPERATIONS_SELL_ADDITIONAL_CHANGE_ZERO_PRICE}}

CASH_OPERATIONS_SELL_ADDITIONAL_POSITION_DISCOUNT
: {{site.data.grants.CASH_OPERATIONS_SELL_ADDITIONAL_POSITION_DISCOUNT}}

CASH_OPERATIONS_SELL_ADDITIONAL_DOCUMENT_DISCOUNT
: {{site.data.grants.CASH_OPERATIONS_SELL_ADDITIONAL_DOCUMENT_DISCOUNT}}

CASH_OPERATIONS_SELL_ADDITIONAL_REGISTER_POSITION_FREE
: {{site.data.grants.CASH_OPERATIONS_SELL_ADDITIONAL_REGISTER_POSITION_FREE}}

CASH_OPERATIONS_PAYBACK
: {{site.data.grants.CASH_OPERATIONS_PAYBACK}}

CASH_OPERATIONS_PAYBACK_BY_SUM
: {{site.data.grants.CASH_OPERATIONS_PAYBACK_BY_SUM}}

CASH_OPERATIONS_PAYBACK_BY_SUM_ADDITIONAL_CHANGE_PRICE
: {{site.data.grants.CASH_OPERATIONS_PAYBACK_BY_SUM_ADDITIONAL_CHANGE_PRICE}}

CASH_OPERATIONS_PAYBACK_BY_SUM_ADDITIONAL_CHANGE_ZERO_PRICE
: {{site.data.grants.CASH_OPERATIONS_PAYBACK_BY_SUM_ADDITIONAL_CHANGE_ZERO_PRICE}}

CASH_OPERATIONS_PAYBACK_BY_SUM_ADDITIONAL_POSITION_DISCOUNT
: {{site.data.grants.CASH_OPERATIONS_PAYBACK_BY_SUM_ADDITIONAL_POSITION_DISCOUNT}}

CASH_OPERATIONS_PAYBACK_BY_SUM_ADDITIONAL_DOCUMENT_DISCOUNT
: {{site.data.grants.CASH_OPERATIONS_PAYBACK_BY_SUM_ADDITIONAL_DOCUMENT_DISCOUNT}}

CASH_OPERATIONS_PAYBACK_BY_SUM_ADDITIONAL_REGISTER_POSITION_FREE
: {{site.data.grants.CASH_OPERATIONS_PAYBACK_BY_SUM_ADDITIONAL_REGISTER_POSITION_FREE}}

CASH_OPERATIONS_CASH_DRAWER_CASH_INCOME
: {{site.data.grants.CASH_OPERATIONS_CASH_DRAWER_CASH_INCOME}}

CASH_OPERATIONS_CASH_DRAWER_CASH_OUTCOME
: {{site.data.grants.CASH_OPERATIONS_CASH_DRAWER_CASH_OUTCOME}}

CASH_REPORTS_X_REPORT
: {{site.data.grants.CASH_REPORTS_X_REPORT}}

CASH_REPORTS_Z_REPORT
: {{site.data.grants.CASH_REPORTS_Z_REPORT}}

MANAGEMENT_REPORTS_STOCK_REPORT
: {{site.data.grants.MANAGEMENT_REPORTS_STOCK_REPORT}}

MANAGEMENT_REPORTS_PROCUREMENT_REPORT
: {{site.data.grants.MANAGEMENT_REPORTS_PROCUREMENT_REPORT}}

MANAGEMENT_REPORTS_SALES_REPORT
: {{site.data.grants.MANAGEMENT_REPORTS_SALES_REPORT}}

MANAGEMENT_REPORTS_CONSOLIDATED_SALES_REPORT
: {{site.data.grants.MANAGEMENT_REPORTS_CONSOLIDATED_SALES_REPORT}}

MANAGEMENT_REPORTS_GROSS_PROFIT_REPORT
: {{site.data.grants.MANAGEMENT_REPORTS_GROSS_PROFIT_REPORT}}

MANAGEMENT_REPORTS_COMMODITIES_MOVEMENTS_REPORT
: {{site.data.grants.MANAGEMENT_REPORTS_COMMODITIES_MOVEMENTS_REPORT}}

MANAGEMENT_REPORTS_ALCOHOL_REPORT
: {{site.data.grants.MANAGEMENT_REPORTS_ALCOHOL_REPORT}}

DOCUMENTS_JOURNAL
: {{site.data.grants.DOCUMENTS_JOURNAL}}

OPERATIONS_JOURNAL
: {{site.data.grants.OPERATIONS_JOURNAL}}

SERVICE_EXCHANGE
: {{site.data.grants.SERVICE_EXCHANGE}}

SETTINGS_MENU
: {{site.data.grants.SETTINGS_MENU}}

APPLICATIONS_MERCHANDISER
: {{site.data.grants.APPLICATIONS_MERCHANDISER}}
