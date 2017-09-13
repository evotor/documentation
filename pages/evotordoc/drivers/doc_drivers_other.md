---
title: SDK для подключаемого USB-оборудования
keywords:
summary:
sidebar: evotordoc_sidebar
permalink: doc_drivers_other.html
tags: [Java, Terminal, Equipment]
folder: evotordoc/drivers
---

### Определение внешнего сервиса в AndroidManifest.xml

Укажите фильтр `Intent filter`: `INTENT_FILTER_DRIVER_MANAGER`.

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
    </intent-filter>
    <meta-data
        android:name="vendor_name"
        android:value="SHTRIH-M" />
    <meta-data
        android:name="model_name"
        android:value="SHTRIH-T" />
    <meta-data
        android:name="usb_device"
        android:value="VID_1659PID_8963" />
    <meta-data
        android:name="settings_activity"
        android:value="" />
    <meta-data
        android:name="device_categories"
        android:value="OTHER" />
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

Можно указать несколько устройств: `VID_1659PID_8963|VID_123PID_456|VID_1659PID_8964`.

Экземпляр драйвера будет автоматически создан/удалён при подключении/отключении указанного оборудования к смарт-терминалу. При наличии нескольких подходящих драйверов, пользователю будет предложен выбор.

### Определение роли и категории устройства

Если ваше устройство не относится к заданным категориям, используйте `Intent filter`:

```xml
INTENT_FILTER_OTHER
```

Вместе с этим необходимо указать в meta-data категорию устройства:

```xml
<meta-data
    android:name="device_categories"
    android:value="OTHER" />
```

Только ваше приложение получит разрешение (`permission`) для работы с подключённым оборудованием.

{% include tip.html content="Можно указать сразу несколько ролей устройству: `SCALES|PRICEPRINTER|CASHDRAWER|OTHER`(весы | принтер чеков | денежный ящик | другое оборудование)." %}

### Присвоение картинки для драйвера

Укажите в манифесте приложения у сервиса:

`android:icon` – картинка устройства, которая будет отображаться пользователю при инициализации устройства;

`android:label` – имя драйвера, которое будет отображаться пользователю при инициализации устройства

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
    applicationId "ru.mycompany.drivers.mydevice"
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


### Описание указанных Binder'ов

Если нельзя выполнить действие, используйте исключение (`Exception`) одного из следующих типов:

* [`BadParcelableException`](https://developer.android.com/reference/android/os/BadParcelableException.html);
* [`IllegalArgumentException`](https://developer.android.com/reference/java/lang/IllegalArgumentException.html);
* [`IllegalStateException`](https://developer.android.com/reference/java/lang/IllegalStateException.html);
* [`NullPointerException`](https://developer.android.com/reference/java/lang/NullPointerException.html);
* [`SecurityException`](https://developer.android.com/reference/java/lang/SecurityException.html);
* [`NetworkOnMainThreadException`](https://developer.android.com/reference/android/os/NetworkOnMainThreadException.html).

Пример:
```java
throw new IllegalStateException();
```

`IUsbDriverManagerService.Stub` – класс для управления драйверами usb-устройств: подключение и отключение устройств происходят здесь. Требуется реализовать методы `addUsbDevice` и `destroy`.

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


### Завершение работы

Загрузите приложение на смарт-терминал, чтобы работать с драйвером.
