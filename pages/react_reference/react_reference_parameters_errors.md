---
title: Ошибки
keywords: react
sidebar: react_reference_sidebar
toc: true
permalink: react_reference_parameters_user.html
folder: react_reference
---

## Класс IntegrationError {#IntegrationError}

```js
export class IntegrationError extends Error {
    constructor(message: string) {}
}
```

## Класс NavigationError {#NavigationError}

```js
export class NavigationError extends Error {
    constructor(message: NavigationErrorMessage) {}
}
```

## Класс DeviceError {#DeviceError}

```js
export class DeviceError extends Error {
    constructor(message: string) {}
}
```
