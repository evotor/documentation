---
title: Печать внутри кассового чека
keywords: печать, чек
summary: "Раздел содержит инструкцию о том, как настроить в приложении печать внутри кассового чека."
sidebar: evotordoc_sidebar
permalink: doc_java_receipt_print.html
tags: [java, terminal, equipment]
folder: java_SDK
---

Смарт-терминал позволяет приложениям печатать свои данные внутри кассового чека: тексты, штрихкоды или изображения.

Следующие методы определяют, где печатаются переданные данные:

* `PrintExtraPlacePrintGroupTop` – данные печатаются после клише и до текста "Кассовый чек";
* `PrintExtraPlacePrintGroupHeader` – данные печатаются после текста "Кассовый чек", до имени пользователя;
* `PrintExtraPlacePrintGroupSummary` – данные печатаются после итога и списка оплат, до текста "всего оплачено";
* `PrintExtraPlacePositionFooter` – данные печатаются в позиции в чеке, до [подпозиций](./doc_java_receipt_interactions.html#Position);
* `PrintExtraPlacePositionAllSubpositionsFooter` – данные печатаются в позиции в чеке, после всех подпозиций.

## Печать данных внутри кассового чека

*Чтобы приложение печатало данные внутри кассового чека:*

1. В [манифесте приложения](./doc_java_app_manifest.html), укажите права приложения:

   ```xml
   <uses-permission android:name="ru.evotor.permission.receipt.printExtra.SET" />
   ```

2. Создайте службу, которая отвечает за передачу данных для печати.
3. Объявите службу в манифесте приложения и укажите `intent-filter`:

   ```xml
   <action android:name="<Событие>" />
   ```

   где необходимо указать событие, при которое определяет тип чека, в котором будут напечатаны данные. Возможны следующие события:
   * `evo.v2.receipt.sell.printExtra.REQUIRED` – печать внутри кассового чека продажи товара.
   * `evo.v2.receipt.buy.printExtra.REQUIRED`  – печать внутри кассового чека покупки товара.
   * `evo.v2.receipt.payback.printExtra.REQUIRED` – печать внутри кассового чека возврата проданного товара.
   * `evo.v2.receipt.buyback.printExtra.REQUIRED` – печать внутри кассового чека возврата купленного товара.

4. В службе, подпишите процессор `PrintExtraRequiredEventProcessor` на событие:

   ```java
   processorMap.put(
                   //NAME_SELL_RECEIPT – имя события, которое указывает тип чека, где будут напечатаны данные.
                   PrintExtraRequiredEvent.NAME_SELL_RECEIPT,
                   new PrintExtraRequiredEventProcessor() {
                   }
                   )
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
                   //Массив данных, которые требуется распечатать.
                   new IPrintable[]{
                           new PrintableText("<Текст>"),
                           new PrintableBarcode("<Штрихкод>", PrintableBarcode.BarcodeType.CODE39),
                           new PrintableImage(BitmapFactory.decodeFile("<путь к файлу изображения>"))
                   }
           ));
         }
       }
   ```

   {% include note.html content="Наполняйте массив `IPrintable` только теми элементами, которые требуется распечатать. Например, если на чеке необходимо распечатать только штрихкод, в массив следует добавить только элемент `new PrintableBarcode(\"<Штрихкод>\", PrintableBarcode.BarcodeType.CODE39)`. Пустые элементы в массиве `IPrintable` приведут к исключению." %}

### Пример

Печать внутри кассового [чека продажи](https://github.com/evotor/evotor-api-example/blob/master/app/src/main/java/ru/qualitylab/evotor/evotortest6/MyPrintService.java) и [возврата](https://github.com/evotor/evotor-api-example/blob/master/app/src/main/java/ru/qualitylab/evotor/evotortest6/MyPrintPaybackService.java) в демонстрационном приложении.

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
