---
title: Обработка ошибок
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_errorshandling.html
tags: [terminal, react]
folder: react_SDK
published: true
---

Вы можете отслеживать ошибки во всех методах, которые возвращают обещание (`promise`).

Пример кода для отслеживания ошибок:

```js
NavigationAPI.startActivity(intent).catch((e)=>{console.log(e.message)});
```

<!-- Методы, которые возвращают обещание (`promise`):

* [Методы для работы с весами](./react_reference_devicescales.html);
* [Методы для работы с принтером](./react_reference_devicesprinter.html);
* [IntegrationCallback и IntegrationServices](./react_reference_integrationapi.html);
* [Navigation API](./react_reference_navigationapi.html);
* [Receipt API](./react_reference_receiptapi.html). -->
