В структуре каждого приложения должен быть манифест AndroidManifest.xml. 

В манифесте необходимо объявить все компоненты, которые использует приложение: операции, службы, приёмники. 
Ниже водятся примеры манифестов java и JS приложений. 
Подробнее о том, что такое манифест приложения[link]

#### Пример JS-манифеста
#### Пример Java-манифеста


````xml
-<manifest package="com.example.myapplication">


-<application android:theme="@style/AppTheme" android:icon="@mipmap/ic_launcher" android:allowBackup="true" xmlns:android="http://schemas.android.com/apk/res/android">

<meta-data android:name="app_uuid" android:value="ApllicationUUID"/>


-<service android:name=".UIPluginServiceImplementation" android:exported="true" android:enabled="true">


-<intent-filter>

<action android:name="android.intent.action.MAIN"/>

<category android:name="android.intent.category.DEFAULT"/>

<category android:name="android.intent.category.EVOTOR"/>

</intent-filter>

</service>


-<service android:name=".DaemonServiceImplementation" android:exported="true" android:enabled="true">


-<intent-filter>

<action android:name="android.intent.action.MAIN"/>

<category android:name="android.intent.category.DEFAULT"/>

<category android:name="android.intent.category.EVOTOR"/>

</intent-filter>

</service>


-<activity android:icon="@mipmap/hello_sales_view_icon" android:name=".HELLO_SALES_VIEW" android:label="Hello">


-<intent-filter android:priority="90">

<action android:name="android.intent.action.MAIN"/>

<category android:name="evo.v2.receipt.sell.receiptDiscount"/>

<category android:name="android.intent.category.DEFAULT"/>

</intent-filter>

<meta-data android:name="ru.evotor.sales_screen.BACKGROUND_COLOR" android:value="@color/hello_sales_view_launcher_color"/>

</activity>


-<service android:icon="@mipmap/hello_sales_view_icon" android:name=".HELLO_SALES_VIEW_SERVICE" android:exported="true" android:enabled="true" android:label="Hello">


-<intent-filter>

<action android:name="android.intent.action.MAIN"/>

<action android:name="evo.v2.receipt.sell.receiptDiscount"/>

<category android:name="android.intent.category.DEFAULT"/>

</intent-filter>

<meta-data android:name="ru.evotor.sales_screen.BACKGROUND_COLOR" android:value="@color/hello_sales_view_launcher_color"/>

</service>


-<activity android:icon="@mipmap/world_sales_view_icon" android:name=".WORLD_SALES_VIEW" android:label="World">


-<intent-filter android:priority="90">

<action android:name="android.intent.action.MAIN"/>

<category android:name="evo.v2.receipt.sell.receiptDiscount"/>

<category android:name="android.intent.category.DEFAULT"/>

</intent-filter>

<meta-data android:name="ru.evotor.sales_screen.BACKGROUND_COLOR" android:value="@color/world_sales_view_launcher_color"/>

</activity>


-<service android:icon="@mipmap/world_sales_view_icon" android:name=".WORLD_SALES_VIEW_SERVICE" android:exported="true" android:enabled="true" android:label="World">


-<intent-filter>

<action android:name="android.intent.action.MAIN"/>

<action android:name="evo.v2.receipt.sell.receiptDiscount"/>

<category android:name="android.intent.category.DEFAULT"/>

</intent-filter>

<meta-data android:name="ru.evotor.sales_screen.BACKGROUND_COLOR" android:value="@color/world_sales_view_launcher_color"/>

</service>

</application>

</manifest>
````


В блоке meta-data необходимо объявить ` android:name="app_uuid" ` и ` android:value="ApllicationUUID" `. 

При разработке драйвера для устройств нужно учитывать дополнительные параметры [ссылка на манифест для дров]
