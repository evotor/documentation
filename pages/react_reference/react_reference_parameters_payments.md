---
title: Платежи
keywords: react
sidebar: react_reference_sidebar
toc: true
permalink: react_reference_parameters_payments.html
folder: react_reference
---

## Класс PaymentPurpose

```js
export class PaymentPurpose {
    constructor(identifier: string | null,
                paymentSystemId: string | null,
                total: number | null,
                accountId: string | null,
                userMessage: string | null) {}
}
```

## Класс PaymentSystem

```js
export class PaymentSystem {
    constructor(paymentType: PaymentType, userDescription: string, paymentSystemId: string) {}
}
```
