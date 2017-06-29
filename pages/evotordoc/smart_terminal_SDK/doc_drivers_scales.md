---
title: SDK для весов
keywords: sample
summary:
sidebar: evotordoc_sidebar
permalink: doc_drivers_scales.html
tags: [Java, Терминал, Оборудование]
folder: smart_terminal_SDK
---

### Определение внешнего сервиса в AndroidManifest.xml

Укажите хотя бы один `Intent filter`: `INTENT_FILTER_DRIVER_MANAGER` или `INTENT_FILTER_VIRTUAL_DRIVER_MANAGER`.

Пример объявленного сервиса:

```xml
<service
    android:name="ru.mycompany.drivers.MyDeviceService"
    android:enabled="true"
    android:exported="true"
    android:icon="@drawable/logo"
    android:label="@string/service_name">
    <intent-filter>
        <action android:name="ru.evotor.devices.drivers.DriverManager" />
        <action android:name="ru.evotor.devices.drivers.ScalesService" />
    </intent-filter>
    <meta-data
        android:name="vendor_name"
        android:value="CAS" />
    <meta-data
        android:name="model_name"
        android:value="AD" />
    <meta-data
        android:name="usb_device"
        android:value="VID_1659PID_8963" />
    <meta-data
        android:name="settings_activity"
        android:value="" />
    <meta-data
        android:name="device_categories"
        android:value="SCALES" />
</service>
```

Где:

`vendor_name` – наименование производителя, которое будет отображаться при подключении устройства.

`model_name` – наименование модели устройства.

`INTENT_FILTER_DRIVER_MANAGER` – используется для драйверов, требующих подключения USB-оборудования. Помимо `Intent filter` в `meta-data` необходимо указать характеристики `VendorID` и `ProductID` целевого устройства (десятичными числами):

```xml
<meta-data
    android:name="usb_device"
    android:value="VID_1659PID_8963" />
```

Можно указать несколько устройств: ``VID_1659PID_8963|VID_123PID_456|VID_1659PID_8964``.

Экземпляр драйвера будет автоматически создан/удалён при подключении/отключении указанного оборудования к смарт-терминалу. При наличии нескольких подходящих драйверов, пользователю будет предложен выбор.

`INTENT_FILTER_VIRTUAL_DRIVER_MANAGER` – используется для драйверов, не требующих подключения USB-оборудования (сетевое, bluetooth и др.). В `meta-data` необходимо указать, что драйвер является виртуальным:

```xml
<meta-data
    android:name="virtual_device"
    android:value="true" />
```

Экземпляр такого драйвера пользователь может создать исключительно вручную через настройки оборудования. В этом случае, все работы по подключению к нужному устройству берёт на себя производитель драйвера.


### Определение роли и категории устройства

Чтобы устройство было распознано как весы, используйте `Intent filter`:

```xml
INTENT_FILTER_SCALES
```

Вместе с этим необходимо указать в meta-data категорию устройства:

```xml
<meta-data
    android:name="device_categories"
    android:value="SCALES" />
```

{% include tip.html content="Можно указать сразу несколько ролей устройству: `SCALES|PRICEPRINTER|CASHDRAWER|OTHER`(весы | принтер чеков | денежный ящик | другое оборудование)." %}


### Присвоение картинки для драйвера

Укажите в манифесте приложения у сервиса:

`android:icon` – картинка устройства, которая будет отображаться пользователю при инициализации устройства;

`android:label` – имя драйвера, которое будет отображаться пользователю при инициализации устройства
Пример отображения иконки и имени драйвера

![picture_1](images/scales.png)

Можно задать `activity` настроек:

```xml
<meta-data
    android:name="settings_activity"
    android:value="ru.mycompany.drivers.MySettingsActivity" />
```

Указанная `activity` должна находиться в текущем `package` и будет вызвана при первом подключении устройства или при выборе устройства в меню настроек оборудования.

Версия драйвера (`versionCode` и `versionName`) берётся из `build.gradle`:

```java
defaultConfig {
    applicationId "ru.mycompany.drivers.myscales"
    minSdkVersion 22
    targetSdkVersion 24
    versionCode 2
    versionName "1.0.1"
}
```

{% include important.html content="MinSdkVersion должна быть не выше версии 22." %}


### Подключение к сервису всех action

В реализации метода подключения к сервису для всех `action`, указанных в интент-фильтрах укажите соответствующие Binder'ы:

для `INTENT_FILTER_DRIVER_MANAGER` - класс наследник `ru.evotor.devices.drivers.IUsbDriverManagerService.Stub`;

для `INTENT_FILTER_VIRTUAL_DRIVER_MANAGER` - класс наследник `ru.evotor.devices.drivers.IVirtualDriverManagerService.Stub`;

для `INTENT_FILTER_SCALES` - класс наследник `ru.evotor.devices.drivers.IScalesDriverService.Stub`;

Пример:

```java
public class MyDeviceService extends Service {

    private final Map<Integer, MyDevice> instances = new HashMap<>();
    private volatile AtomicInteger newDeviceIndex = new AtomicInteger(0);

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        String action = intent.getAction();
        switch (action) {
            case Constants.INTENT_FILTER_DRIVER_MANAGER:
                return new MyDriverManagerStub(MyDeviceService.this);
            case Constants.INTENT_FILTER_SCALES:
                return new MyScalesStub(MyDeviceService.this);
            default:
                return null;
        }
    }

    public int createNewDevice(UsbDevice usbDevice) {
        int currentIndex = newDeviceIndex.getAndIncrement();
        instances.put(currentIndex, new MyDevice(getApplicationContext(), usbDevice));
        return currentIndex;
    }

    public MyDevice getMyDevice(int instanceId) {
        return instances.get(instanceId);
    }

    public void destroy(int instanceId) {
		getMyDevice(instanceId).destroy();
        instances.remove(instanceId);
    }
}
```

В этом же сервисе можно определить `Map` для хранения списка нескольких активных экземпляров драйверов, т.к. обращаться к нему придётся из всех указанных Stub'ов.


### Описание указанных Binder'ов

Если нельзя выполнить действие, например, взвесить для метода getWeight, используйте один из типов `Exception` с легкочитаемым описанием для всех методов.

Поддерживаемые типы `Exception`:

- `BadParcelableException`;
- `IllegalArgumentException`;
- `IllegalStateException`;
- `NullPointerException`;
- `SecurityException`;
- `NetworkOnMainThreadException`.

Подробное описание типов `Exception` на портале [developer.android.com](developer.android.com)

` IUsbDriverManagerService.Stub` – класс для управления драйверами usb-устройств: подключение и отключение устройств происходят здесь. Требуется реализовать методы `addUsbDevice` и `destroy`.

```java
import ru.evotor.devices.drivers.IUsbDriverManagerService;

public class MyDriverManagerStub extends IUsbDriverManagerService.Stub {

    private MyDeviceService myDeviceService;

    public MyDriverManagerStub(MyDeviceService myDeviceService) {
        this.myDeviceService = myDeviceService;
    }

    @Override
    public int addUsbDevice(UsbDevice usbDevice, String usbPortPath) throws RemoteException {
        return myDeviceService.createNewDevice(usbDevice);
    }

    @Override
    public void destroy(int instanceId) throws RemoteException {
        myDeviceService.destroy(instanceId);
    }
}
```

Метод `addUsbDevice` в `IUsbDriverManagerService` принимает на вход:

- `UsbDevice`, для которого он создан;

- некоторый строковый идентификатор номера физического usb-порта для сохранения настроек оборудования и восстановления их после перезагрузки терминала. В этот момент у приложения-драйвера уже есть `permission` для работы с этим устройством.

Метод `addUsbDevice` возвращает номер экземпляра драйвера внутри приложения. По этому номеру будет происходить обращение к конкретному драйверу.

Метод `destroy` в `IUsbDriverManagerService` принимает на вход номер экземпляра драйвера. Вызов этого метода уведомляет об отключении от устройства. В этот момент у приложения-драйвера уже нет `permission` для работы с этим устройством, само устройство уже может быть удалено из смарт-терминала.

`IVirtualDriverManagerService.Stub` - класс для управления драйверами виртуальных устройств:

подключение и отключение устройств происходят здесь. Требуется реализовать методы `addNewVirtualDevice`, `recreateNewVirtualDevice` и `destroy`.

```java
import ru.evotor.devices.drivers.IVirtualDriverManagerService;

public class MyDriverManagerStub extends IVirtualDriverManagerService.Stub {

    private MyDeviceService myDeviceService;

    public MyDriverManagerStub(MyDeviceService myDeviceService) {
        this.myDeviceService = myDeviceService;
    }

    @Override
    public int addNewVirtualDevice() throws RemoteException {

            return myDeviceService.createNewDevice(usbDevice);
    }

    @Override
    public void recreateNewVirtualDevice(int instanceId) throws RemoteException {
        myDeviceService.recreateNewVirtualDevice(instanceId);
    }

    @Override
    public void destroy(int i) throws RemoteException {
        myDeviceService.destroy(instanceId);
    }
}
```

`addNewVirtualDevice` возвращает номер экземпляра драйвера внутри приложения. По этому номеру будет происходить обращение к конкретному драйверу.

Метод `recreateNewVirtualDevice` принимает на вход номер экземпляра драйвера внутри приложения.

Метод `destroy` принимает на вход номер экземпляра драйвера. Вызов этого метода уведомляет приложение об отключении от устройства.

Для вновь созданного экземпляра драйвера (а виртуальные устройства могут создаваться только вручную пользователем через меню настроек оборудования) будет вызван метод `addNewVirtualDevice`.

Метод `recreateNewVirtualDevice` будет вызван для тех устройств, которые уже создавались пользователем ранее, но в данный момент подключения к таким драйверам нет. Например, после перезагрузки смарт-терминала, перезапуска сервиса работы с оборудованием или обновления приложения-драйвера.

Метод `destroy` будет вызван для устройства, которое пользователь вручную удалил из списка оборудования.

`IScalesDriverService.Stub` – класс для работы с конкретными экземплярами весов. Требуется реализовать метод `getWeight`.

```java
import ru.evotor.devices.drivers.IScalesDriverService;
import ru.evotor.devices.drivers.scales.Weight;

public class MyScalesStub extends IScalesDriverService.Stub {

    private MyDeviceService myDeviceService;

    public MyScalesStub(MyDeviceService myDeviceService) {
        this.myDeviceService = myDeviceService;
    }

    @Override
    public Weight getWeight(int instanceId) throws RemoteException {
        return myDeviceService.getMyDevice(instanceId).getWeight();
    }
}
```

Метод `getWeight` принимает на вход номер экземпляра драйвера (тот, который вернул addUsbDevice на прошлом шаге).

Метод `getWeight` возвращает объект класса `ru.evotor.devices.drivers.scales.Weight`.

В конструкторе требуется указать:

- `originalWeight` – вес, в единицах измерения весов;

- `multiplierToGrams` – коэффициент для приведения веса в граммы;

- `supportStable` – поддерживают ли весы флаг стабильности;

- `stable` – флаг стабильности взвешивания, если поддерживается. Иначе - любое значение.

Все методы принимают на вход номер экземпляра драйвера.




### Описание класса для работы с оборудованием

Пример для USB-весов:

```java
import ru.evotor.devices.drivers.scales.IScales;
import ru.evotor.devices.drivers.scales.Weight;

public class MyDevice implements IScales {

    private Context context;
    private UsbDevice usbDevice;

    public MyDevice(Context context, UsbDevice usbDevice) {
        super();
        this.context = context;
        this.usbDevice = usbDevice;
    }

	public void destroy(){
	}

    @Override
    public Weight getWeight() {
        //TODO Ваш код запроса веса
    }
}
```

Для устройств других категорий реализуйте соответствующие интерфейсы:

Денежный ящик – `ru.evotor.devices.drivers.cashdrawer.ICashDrawer`;

Принтер ценников – `ru.evotor.devices.drivers.priceprinter.IPricePrinter`;

Банковский терминал – `ru.evotor.devices.drivers.paysystem.IPaySystem`.

### Завершение работы

Загрузите приложение на смарт-терминал, чтобы работать с драйвером.
