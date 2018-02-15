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

Вы можете отслеживать ошибки в методах, которые возвращают обещание (`Promise`).

Пример кода для отслеживания ошибок:

```js
NavigationAPI.startActivity(intent).catch((e)=>{console.log(e.message)});
```

## Ошибки

### IntegrationError {#integrationerror}

```js
export class IntegrationError extends Error {
    constructor(message: string) {}
}
```

**Описание**

Может возникнуть при работе с интеграционной службой, интеграционной операцией, а также при при открытии чека и отправке электронного чека.

### NavigationError {#navigationerror}

```js
export class NavigationError extends Error {
    constructor(message: NavigationErrorMessage) {}
}
```

**Описание**

Возникает если при навигации, если вы указали неверные данные.

#### Тип NavigationErrorMessage

```js
export enum NavigationErrorMessage {
    TARGET_CLASS_NOT_FOUND = "TARGET_CLASS_NOT_FOUND",
    TARGET_PACKAGE_NOT_FOUND = "TARGET_PACKAGE_NOT_FOUND",
    TARGET_CLASS_NOT_EXPORTED = "TARGET_CLASS_NOT_EXPORTED"
}
```

### NoActivityError {#noactivityerror}

```js
export class NoActivityError extends Error {
    constructor(message: string) {}
}
```

**Описание**

Возникает при обращении к операции закрытого приложения.

### DeviceError {#DeviceError}

```js
export class DeviceError extends Error {
    constructor(message: string) {}
}
```

**Описание**

Возникает при обращении к неподключённому устройству.
