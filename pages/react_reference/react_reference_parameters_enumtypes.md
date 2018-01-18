---
title: Перечисляемые типы даных
keywords: react
sidebar: react_reference_sidebar
toc: true
permalink: react_reference_parameters_enumtypes.html
folder: react_reference
---


## Типы событий


```js
export enum DeviceConnectionEventType {
    PRINTER_CONNECTION_CHANGED = "PRINTER_CONNECTION_CHANGED",
    SCALES_CONNECTION_CHANGED = "SCALES_CONNECTION_CHANGED"
}
```
```js
export enum ScannerEventType {
    BARCODE_RECEIVED = "BARCODE_RECEIVED"
}
```

```js
export enum NavigationEventType {
    ACTIVITY_RESULT = "ACTIVITY_RESULT"
}
```

```js
export enum BroadcastReceiverEventType {
    EVENT_RECEIVED = "EVENT_RECEIVED"
}
```

```js
export enum IntegrationEventType {
    BEFORE_POSITIONS_EDITED = "BEFORE_POSITIONS_EDITED",
    RECEIPT_DISCOUNT = "RECEIPT_DISCOUNT",
    PAYMENT_SELECTED = "PAYMENT_SELECTED",
    PRINT_GROUP_REQUIRED = "PRINT_GROUP_REQUIRED",
    PRINT_EXTRA_REQUIRED = "PRINT_EXTRA_REQUIRED"
}
```

## Навигация

```js
export enum NavigationErrorMessage {
    CURRENT_ACTIVITY_IS_NULL = "CURRENT_ACTIVITY_IS_NULL",
    MISSED_NECESSARY_INTENT_DATA = "MISSED_NECESSARY_INTENT_DATA",
    TARGET_CLASS_NOT_FOUND = "TARGET_CLASS_NOT_FOUND",
    TARGET_PACKAGE_NOT_FOUND = "TARGET_PACKAGE_NOT_FOUND",
    TARGET_CLASS_NOT_EXPORTED = "TARGET_CLASS_NOT_EXPORTED"
}
```

## Товары

```js
export enum ProductType {
    NORMAL = "NORMAL",
    ALCOHOL_MARKED = "ALCOHOL_MARKED",
    ALCOHOL_NOT_MARKED = "ALCOHOL_NOT_MARKED",
    SERVICE = "SERVICE"
}
```

## Чеки

```js
export enum ReceiptType {
    SELL = "SELL",
    PAYBACK = "PAYBACK"
}
```

```js
export enum TaxNumber {
    VAT_18 = "VAT_18",
    VAT_10 = "VAT_10",
    NO_VAT = "NO_VAT",
    VAT_18_118 = "VAT_18_118",
    VAT_10_110 = "VAT_10_110",
    VAT_0 = "VAT_0"
}
```

```js
export enum TaxationSystem {
    COMMON = "COMMON",
    SIMPLIFIED_INCOME = "SIMPLIFIED_INCOME",
    SIMPLIFIELD_INCOME_OUTCOME = "SIMPLIFIELD_INCOME_OUTCOME",
    SINGLE_IMPUTED_INCOME = "SINGLE_IMPUTED_INCOME",
    SINGLE_AGRICULTURE = "SINGLE_AGRICULTURE",
    PATENT = "PATENT"
}
```

```js
export enum PrintGroupType {
    CASH_RECEIPT = "CASH_RECEIPT",
    INVOICE = "INVOICE",
    string_UTII = "string_UTII"
}
```

```js
export enum PrintExtraPlace {
    PrintExtraPlacePrintGroupTop = "PrintExtraPlacePrintGroupTop",
    PrintExtraPlacePrintGroupHeader = "PrintExtraPlacePrintGroupHeader",
    PrintExtraPlacePrintGroupSummary = "PrintExtraPlacePrintGroupSummary",
    PrintExtraPlacePositionFooter = "PrintExtraPlacePositionFooter",
    PrintExtraPlacePositionAllSubpositionsFooter = "PrintExtraPlacePositionAllSubpositionsFooter"
}
```

## Платежи

```js
export enum PaymentType {
    UNKNOWN = "UNKNOWN",
    CASH = "CASH",
    ELECTRON = "ELECTRON"
}
```

## Печать

```js
export enum BarcodeType {
    EAN8,
    UPCA,
    EAN13,
    CODE39
}
```
