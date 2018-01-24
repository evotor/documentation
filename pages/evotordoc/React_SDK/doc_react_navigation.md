---
title: Вызов окон смарт-терминала
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_navigation.html
tags: [terminal, react]
folder: react_SDK
published: true
---

Для вызова окон смарт-терминала используйте класс [`NavigationApi`](https://github.com/evotor/integration-library/blob/develop/app/src/main/java/ru/evotor/framework/navigation/NavigationApi.kt).

Ваше приложение может вызывать следующие окна смарт-терминала:

* окно редактирования клише чека (**Настройки** → **Кассовый чек**);

   {: .center-image}
   ![](images\receiptsettings.png)

* окно доступа к кассовым отчётам (**Отчёты** → **Кассовый отчёт**).

   {: .center-image}
   ![](images\CashRegisterReport.png)

## Вызов окон смарт-терминала

Для вызова окон смарт-терминала используйте метод:

```javascript
static startActivity(intent: Intent) {
    NavigationModule.startActivity(intent);
}
```

Где `Intent`:

```javascript
class Intent {
    constructor(action: string | IntentType) {
        if(typeof action === 'string') {
            this.action = action;
        } else {
            this.action = IntentType[action];
        }
    }
}
```

Где `IntentType`:

```javascript
var IntentType;
(function (IntentType) {
    IntentType[IntentType["CASH_RECEIPT_SETTING"] = 0] = "CASH_RECEIPT_SETTING";//Окно настройки клише.
    IntentType[IntentType["CASH_REGISTER_REPORT"] = 1] = "CASH_REGISTER_REPORT";//Окно доступа к кассовым отчётам.
})(IntentType || (IntentType = {}));
```


Для навигации и взаимодействия с приложениями смарт-терминала используйте класс [NavigationAPI](./react_reference_navigationapi.html).
