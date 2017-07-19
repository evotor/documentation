---
title: Печать внутри кассового чека
keywords: sample
summary: "Раздел содержит инструкцию о том, как настроить в приложении печать внутри кассового чека."
sidebar: evotordoc_sidebar
permalink: doc_receipt_print.html
tags: [Java, Терминал, Оборудование]
folder: evotordoc/smart_terminal_SDK
---

Смарт-терминал позволяет приложениям печатать свои данные внутри кассового чека: тексты, штрихкоды или изображения.

Следующие методы определяют, где печатаются переданные данные:

* `PrintExtraPlacePrintGroupTop` – данные печатаются после клише и до текста "Кассовый чек";
* `PrintExtraPlacePrintGroupHeader` – данные печатаются после текста "Кассовый чек", до имени пользователя;
* `PrintExtraPlacePrintGroupSummary` – данные печатаются после итога и списка оплат, до текста "всего оплачено";
* `PrintExtraPlacePositionFooter` – данные печатаются в позиции в чеке, до [подпозиций](./doc_receipt_interactions.html#Position);
* `PrintExtraPlacePositionAllSubpositionsFooter` – данные печатаются в позиции в чеке, после всех подпозиций.

### Печать данных внутри кассового чека

*Чтобы приложение печатало данные внутри кассового чека:*

1. В [манифесте приложения](./ссылка на java-манифест), наделите приложение необходимыми правами:

   ```xml
   <uses-permission android:name="ru.evotor.permission.receipt.printExtra.SET" />
   ```

2. Создайте службу, которая отвечает за передачу данных для печати.
3. Объявите службу в манифесте приложения и укажите intent-filter:

   ```xml
   <action android:name="evo.v2.receipt.sell.printExtra.REQUIRED" />
   ```

   Где:

   Событие `evo.v2.receipt.sell.printExtra.REQUIRED` – сообщает о возможности печати внутри кассового чека продажи. Для печати внутри кассового чека возврата подпишитесь на событие `evo.v2.receipt.payback.printExtra.REQUIRED`.

4. В службе, подпишите процессор `PrintExtraRequiredEventProcessor` на событие:

   ```java
   processorMap.put(
                   PrintExtraRequiredEvent.NAME_SELL_RECEIPT,
                   new PrintExtraRequiredEventProcessor() {
                   }
   ```

5. В службе, в методе `PrintExtraRequiredEventProcessor` укажите место и массив данных, которые требуется распечатать:

   ```java
   new PrintExtraRequiredEventProcessor() {
       @Override
       public void call(String s, PrintExtraRequiredEvent printExtraRequiredEvent, Callback callback) {
           List<SetPrintExtra> setPrintExtras = new ArrayList<SetPrintExtra>();
           setPrintExtras.add(new SetPrintExtra(
                   //Метод, который указывает место, где будут распечатаны данные.
                   new PrintExtraPlacePrintGroupTop(null),
                   //Массив данных, которые должны быть распечатаны.
                   new IPrintable[]{
                           new PrintableText("<Текст>"),
                           new PrintableBarcode("<Штрихкод>", PrintableBarcode.BarcodeType.CODE39),
                           new PrintableImage(BitmapFactory.decodeFile("<путь к файлу изображения>"))
                   }
           ));
   ```

### Пример

Ниже приведена служба, которая передаёт данные для печати с помощью всех доступных методов:

```java
processorMap.put(
                PrintExtraRequiredEvent.NAME_SELL_RECEIPT,
                new PrintExtraRequiredEventProcessor() {
                    @Override
                    public void call(String s, PrintExtraRequiredEvent printExtraRequiredEvent, Callback callback) {
                        List<SetPrintExtra> setPrintExtras = new ArrayList<SetPrintExtra>();
                        setPrintExtras.add(new SetPrintExtra(
                                new PrintExtraPlacePrintGroupTop(null),
                                new IPrintable[]{
                                        new PrintableText("<Текст>"),
                                        new PrintableBarcode("<Штрихкод>", PrintableBarcode.BarcodeType.CODE39),
                                        new PrintableImage(BitmapFactory.decodeFile("<путь к файлу изображения>"))
                                }
                        ));
                        setPrintExtras.add(new SetPrintExtra(
                                new PrintExtraPlacePrintGroupHeader(null),
                                new IPrintable[]{
                                        new PrintableBarcode("<Штрихкод>", PrintableBarcode.BarcodeType.CODE39),
                                        new PrintableText("<Текст>")
                                }
                        ));
                        setPrintExtras.add(new SetPrintExtra(
                                new PrintExtraPlacePrintGroupSummary(null),
                                new IPrintable[]{
                                        new PrintableText("<Текст>"),
                                        new PrintableImage(BitmapFactory.decodeFile("<путь к файлу изображения>")),
                                        new PrintableBarcode("<Штрихкод>", PrintableBarcode.BarcodeType.CODE39),
                                        new PrintableText("<Текст>")
                                }
                        ));
                        Receipt r = ReceiptApi.getReceipt(DiscountService.this, Receipt.Type.SELL);
                        if (r != null) {
                            for (Position p : r.getPositions()) {
                                setPrintExtras.add(new SetPrintExtra(
                                        new PrintExtraPlacePositionFooter(p.getUuid()),
                                        new IPrintable[]{
                                                new PrintableBarcode("<Штрихкод>", PrintableBarcode.BarcodeType.CODE39),
                                                new PrintableText("<Текст>\n" + p.getUuid() + "\n<Текст>")
                                        }
                                ));
                                setPrintExtras.add(new SetPrintExtra(
                                        new PrintExtraPlacePositionAllSubpositionsFooter(p.getUuid()),
                                        new IPrintable[]{
                                                new PrintableBarcode("<Штрихкод>", PrintableBarcode.BarcodeType.CODE39),
                                                new PrintableText("<Текст>\n" + p.getUuid() + "\n<Текст>")
                                        }
                                ));

                            }
                        }
                        try {
                            callback.onResult(new PrintExtraRequiredEventResult(setPrintExtras).toBundle());
                        } catch (RemoteException exc) {
                            exc.printStackTrace();
                        }
                    }
                }
        );
```
