---
title: Типы данных
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_parameters_types.html
folder: react_reference
---

## Класс PositionAdd

```js
export type Writable =
    boolean | number | string |
    [boolean, number, string] |
    { [key: string]: boolean | number | string };
```

```js
export type WritableObject = { [key: string]: Writable };
```

```js
type Bundlable =
    PositionChange |
    SetExtra |
    SetPrintGroup |
    SetPrintExtra;
```

```js
export type JavaReadable = {
    __name__: string,
    __value__: Bundlable
};
```

```js
export type Bundle = { [key: string]: Writable | JavaReadable };
```

```js
export type PositionChange = PositionAdd | PositionEdit | PositionRemove;
```

```js
export type DeviceConnectionEventListener = (connected: boolean) => void;
```

```js
type BarcodeReceiveListener = (barcode: string) => void;
```

```js
export type ScannerEventListener = BarcodeReceiveListener;
```

```js
export type ActivityResultListener = (requestCode: number, resultCode: number, data: Intent) => void;
```

```js
export type NavigationEventListener = ActivityResultListener;
```

```js
type BeforePositionsEditedEventListener = (positionsChanges: PositionChange[]) => void
type ReceiptDiscountEventListener = (discount: number, receiptUuid: string) => void
type PaymentSelectedEventListener = (paymentSystem: PaymentSystem) => void
type PrintGroupRequiredEventListener = (paymentSystem: PaymentSystem) => void
type PrintExtraRequiredEventListener = () => void
export type IntegrationEventListener =
    BeforePositionsEditedEventListener |
    ReceiptDiscountEventListener |
    PaymentSelectedEventListener |
    PrintGroupRequiredEventListener |
    PrintExtraRequiredEventListener;
```

```js
export type IntegrationEventResult =
    BeforePositionsEditedEventResult |
    ReceiptDiscountEventResult |
    PaymentSelectedEventResult |
    PrintGroupRequiredEventResult |
    PrintExtraRequiredEventResult;
```

```js
export type BroadcastReceiverListener = (event: BroadcastEvent) => void;
```
