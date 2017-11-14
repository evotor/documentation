---
title: Работа со сканером штрихкодов
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_react_inventoryAPI.html
tags: [terminal, react]
folder: react_SDK
published: false
---

Приведённые ниже методы, соответствуют методам описанным в разделе [Java SDK](./doc_java_inventory.html)

## Методы

### Получить все штрихкоды товара

```javascript
static mount() {
    ScannerModule.register();
    const OnBarcodeReceiveListener = new NativeEventEmitter(ScannerModule);
    this.subscription = OnBarcodeReceiveListener.addListener(
        'OnBarcodeReceiveListener', (barcode: String) => {
            this.OnBarcodeReceiveListener(barcode);
        }
    );
}

static setOnBarcodeReceiveListener(listener: Function) {
    this.OnBarcodeReceiveListener = listener;
}

static unmount() {
    ScannerModule.unregister();
    this.subscription.remove();
}
```


## Пример

В примере представлены все методы, доступные в API.

```javascript

```
