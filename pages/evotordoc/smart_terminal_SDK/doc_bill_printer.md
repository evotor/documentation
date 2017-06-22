---
title: Принтер чеков
keywords: sample
summary: "Раздел содержит информацию о том, как приложение может работать с принтером чеков."
sidebar: evotordoc_sidebar
permalink: doc_bill_printer.html
tags: [Java, Терминал, Оборудование, Чеки]
folder: smart_terminal_SDK
---

### Работа с принтером чеков

1. В колбэке `onCreate()` или при запуске операции (`activity`) инициализируйте класс `ru.evotor.devices.commons.DeviceServiceConnector`:

   ```java
   DeviceServiceConnector.startInitConnections(getApplicationContext());
   ```

   Класс инициализируется асинхронно, чтобы не препятствовать вызывающему потоку.

   {% include tip.html content="Воспользуйтесь методом `addConnectionWrapper`, чтобы получить событие об успешном подключении. <br/><br/>

   Используйте это событие, если необходимо выполнить какой-либо код сразу после установки соединения." %}

2. Вызовите метод `DeviceServiceConnector.getPrinterService()`.

    Метод не может быть `null` и в случае успеха возвращает объект `ru.evotor.devices.commons.IPrinterServiceWrapper`.

    Метод может вернуть следующие исключения (`exception`):

      * `ru.evotor.devices.commons.exception.ServiceNotConnectedException` возвращается в результате серии неудачных попыток подключиться к принтеру.
      * `ru.evotor.devices.commons.exception.DeviceServiceException` – наследованое исключение.

3. Вы можете вызвать следующие методы объекта `ru.evotor.devices.commons.IPrinterService`:

    * `int getAllowableSymbolsLineLength(int deviceId)` – возвращает количество символов, которые помещаются на одной строке чека.
    * `int getAllowablePixelLineLength(int deviceId)` – возвращает доступную для печати ширину бумаги в пикселях
    * `void printDocument(int deviceId, in PrinterDocument printerDocument)` – печатает указанный массив объектов: текст, штрихкоды, изображения.

        Аргумент `deviceId` указывает устройство, для которого вызывается метод.

        {% include important.html content="В настоящий момент печать возможна только на ККМ, встроенной в смарт-терминал, поэтому вместо номера устройства всегда следует передавать константу `ru.evotor.devices.commons.Constants.DEFAULT_DEVICE_INDEX`." %}

        Каждый из методов может вернуть наследованное исключение `ru.evotor.devices.commons.exception.DeviceServiceException`.

4. Передайте данные в печать с помощью метода `printDocument(int deviceId, in PrinterDocument printerDocument)`.

    Аргумент `PrinterDocument` содержит список элементов печати `IPrintable`:
    
    * Тексты – `ru.evotor.devices.commons.printer.printable.PrintableText`;
    * Штрихкоды – `ru.evotor.devices.commons.printer.printable.PrintableBarcode`;
    * Картинки – `ru.evotor.devices.commons.printer.printable.PrintableImage`.

{% include note.html content="Работа с удалённым сервисом может занимать длительное время, поэтому не вызывайте перечисленные методы в главном потоке приложения." %}

### Примеры

Код для печати сообщения на чеке:

```java
try {
  DeviceServiceConnector.getPrinterService().printDocument(
    DEFAULT_DEVICE_INDEX_UNSET,
    new PrinterDocument(
              new PrintableText("Первая строка"),
              new PrintableText("Довольно длинный текст, помещающийся лишь на несколько строк"),
              new PrintableBarcode("1234567890", PrintableBarcode.BarcodeType.CODE39),
              new PrintableImage(bitmap1)));
} catch (DeviceServiceException exc) {

}
```
