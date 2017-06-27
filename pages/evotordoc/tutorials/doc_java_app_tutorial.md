---
title: Разработка Java-приложения
keywords: sample
summary: Раздел содержит инструкцию по созданию простого java-приложения для смарт-терминала. На разных этапах приложение обладает разными функциями. Так, итоговое приложение сможет показывать интерфейс по нажатию на плитку на главном экране смарт-терминала, получать информацию о том, что в чек добавлен определённый товар, выводить экран с предложением добавить к этому товару ещё один, получать информацию о закрытии чека и записывать сообщение об этом в лог.
sidebar: evotordoc_sidebar
permalink: doc_java_app_tutorial.html
tags: [Java, Терминал, Чеки, Товары]
folder: tutorials
---

### Требования

Перед разработкой приложения убедитесь что:

* На смарт-терминале установлена прошивка версии 2.4.2 или выше.

* Для приложения включён [режим разработчика](./doc_developer_mode.html).

* Вы можете подключиться к смарт-терминалу с помощью adb для отладки приложения.
    <!-- {% include tip.html content="Разрабатывайте приложение в Android Studio, чтобы избежать возможных накладок." %} -->


### Подключение библиотеки integration-library.

В библиотеке integration-library хранятся зависимости, необходимые для разработки Java-приложения.

Подключите библиотеку к своему проекту:

1. В файле `build.gradle` проекта укажите:

   ```
   allprojects {
       repositories {
           jcenter()
           maven { url 'https://jitpack.io' }
       }
   }
   ```

2. В файле `build.gradle` приложения, добавьте библиотеку integration-library в зависимости:

   ```
        compile group: 'com.github.evotor', name: 'integration-library', version: 'v0.3.19', changing: true
   ```

   {% include note.html content="Убедитесь, что в зависимости указана [актуальная версия библиотеки](https://github.com/evotor/integration-library/)." %}

### Пример 1. Добавление плитки приложения на главный экран смарт-терминала

Используйте плитку, расположенную на главном экране смарт-терминала, чтобы вызвать своё приложение.

Чтобы добавить плитку приложения на главный экран:
1. Добавьте в приложение новую операцию (элемент `<activity>`).

   В Android Studio операцию можно добавить так: File>New>Activity.

2. В файле `AndroidManifest.xml`, в элементе `<activity>` укажите элементы `<meta-data>` и `<intent-filter>`.

   ```xml
        <activity
           android:name=".MainActivity"
           android:label="@string/title_activity_main"
           android:theme="@style/AppTheme.NoActionBar">
           <meta-data
               android:name="ru.evotor.launcher.BACKGROUND_COLOR"
               android:value="#133788" />

           <intent-filter>
               <action android:name="android.intent.action.MAIN" />

               <category android:name="android.intent.category.EVOTOR" />
           </intent-filter>
       </activity>
   ```

3. Соберите и установите приложение на смарт-терминал.

   Скачать пример приложения вы можете из [нашего репозитория](https://github.com/evotor/documentation/blob/master/_examples/MyFirstJavaApp-1.0.zip).

### Пример 2. Получение сообщений от терминала и изменение чека

Терминал рассылает сообщения двух типов:

* События, на которые требуется ответ приложения.
* Широковещательные сообщения, на которые ответ приложения не требуется.

Чтобы получить события, на которые требуется ответ приложения, например, при добавлении товара в чек:

1. Cоздайте службу, например `MyIntegrationService`.

   ```java
   public class MyIntegrationService extends IntegrationService {

       @Nullable
       @Override
       protected Map<String, ActionProcessor> createProcessors() {
           Map<String, ActionProcessor> map = new HashMap<>();

           map.put(BeforePositionsEditedEvent.NAME_SELL_RECEIPT, new BeforePositionsEditedEventProcessor() {
               @Override
               public void call(@NonNull String action, @NonNull BeforePositionsEditedEvent beforePositionsEditedEvent, @NonNull Callback callback) {
                   Log.d("MyIntegrationService", "Handle event: " + action);
                   try {
                       callback.skip();
                   } catch (RemoteException e) {
                       e.printStackTrace();
                   }
               }
           });

           return map;
       }
   }
   ```

2. Объявите службу в манифесте приложения:

   ```xml
       <service
           android:name=".MyIntegrationService"
           android:enabled="true"
           android:exported="true">
           <intent-filter>
               <category android:name="android.intent.category.DEFAULT" />

               <action android:name="evo.v2.receipt.sell.beforePositionsEdited" />
           </intent-filter>
       </service>
   ```

   Скачать пример приложения вы можете из [нашего репозитория](https://github.com/evotor/documentation/blob/master/_examples/MyFirstJavaApp-2.0.zip).

### Пример 3. Изменение чека

Если приложение подписано на события, оно может взаимодействовать с чеком: добавлять, изменять или удалять позиции.

Изменим приложение таким образом, чтобы при добавлении в чек кофе, открывался экран, с предложением сотруднику добавить в чек сахар:

1. В приложение из второго примера, добавим следующую операцию :

   ```java
   public class SugarSuggestionActivity extends IntegrationAppCompatActivity {

   @Override
   protected void onCreate(Bundle savedInstanceState) {
       super.onCreate(savedInstanceState);
       setContentView(R.layout.activity_sugar_suggestion);

       findViewById(R.id.buttonYes).setOnClickListener(new View.OnClickListener() {
           @Override
           public void onClick(View v) {
               List<IPositionChange> changes = new ArrayList<>();
               changes.add(new PositionAdd(
                       Position.Builder.newInstance(
                               UUID.randomUUID().toString(),
                               null,
                               "Сахар",
                               "шт",
                               0,
                               new BigDecimal(3),
                               BigDecimal.ONE
                       ).build()
               ));

               setIntegrationResult(new BeforePositionsEditedEventResult(changes, null));
               finish();
           }
       });

       findViewById(R.id.buttonNo).setOnClickListener(new View.OnClickListener() {
           @Override
           public void onClick(View v) {
               finish();
              }
          });
      }
   }
   ```

   Операция  открывает диалоговое окно, с помощью которого кассир может добавить сахар в чек. В качестве примера, можете использовать следующий код диалогового окна:

   ```xml
   <?xml version="1.0" encoding="utf-8"?>
   <LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
       xmlns:app="http://schemas.android.com/apk/res-auto"
       xmlns:tools="http://schemas.android.com/tools"
       android:layout_width="match_parent"
       android:layout_height="match_parent"
       android:orientation="vertical"
       tools:context="<Id пакета вашего приложения>.SugarSuggestionActivity">

       <TextView
           android:id="@+id/textView"
           android:layout_width="wrap_content"
           android:layout_height="wrap_content"
           android:text="Добавить сахарку?" />

       <Button
           android:id="@+id/buttonYes"
           android:layout_width="wrap_content"
           android:layout_height="wrap_content"
           android:text="Да, конечно" />

       <Button
           android:id="@+id/buttonNo"
           android:layout_width="wrap_content"
           android:layout_height="wrap_content"
           android:text="Нет, спасибо" />


   </LinearLayout>
   ```

2. Объявим операцию в манифесте приложения:

   ```xml
   <activity android:name=".SugarSuggestionActivity"></activity>
   ```

3. Изменим службу `MyIntegrationService` следующим образом:

   ```java
       public class MyIntegrationService extends IntegrationService {


       @Nullable
       @Override
       protected Map<String, ActionProcessor> createProcessors() {
           Map<String, ActionProcessor> map = new HashMap<>();

           map.put(BeforePositionsEditedEvent.NAME_SELL_RECEIPT, new BeforePositionsEditedEventProcessor() {
               @Override
               public void call(@NonNull String action, @NonNull BeforePositionsEditedEvent beforePositionsEditedEvent, @NonNull Callback callback) {
                  boolean hasCoffee = false;
                   for (IPositionChange change : beforePositionsEditedEvent.getChanges()) {
                       if (change instanceof PositionAdd) {
                           Position position = ((PositionAdd) change).getPosition();
                           if (position.getName().equals("Кофе")) {
                               hasCoffee = true;
                               break;
                           }
                       }
                   }

                   try {
                       if (!hasCoffee) {
                           callback.skip();
                       } else {
                           callback.startActivity(new Intent(getApplicationContext(), SugarSuggestionActivity.class));
                       }
                   } catch (RemoteException e) {
                       e.printStackTrace();
                   }
               }
           });

           return map;
       }
   }
   ```

   Скачать пример приложения вы можете из [нашего репозитория](https://github.com/evotor/documentation/blob/master/_examples/MyFirstJavaApp-2.2.zip).

### Пример 4. Логирование

Смарт-терминал не требует ответа на широковещательные сообщения, поэтому вы можете использовать приёмники сообщений (`BroadcastReceiver`) для логирования в приложении.

Изменим приложение из третьего примера так, чтобы оно логировало сообщение о добавлении позиции в чек:

1. Добавим `BroadcastReceiver`:

   ```java
   public class MyIntegrationReceiver extends BroadcastReceiver {

   @Override
   public void onReceive(Context context, Intent intent) {
       Log.d("MyIntegrationReceiver", intent.getAction());
       }
   }
   ```

2. Объявим `BroadcastReceiver` в манифесте приложения :

   ```xml
   <receiver
       android:name=".MyIntegrationReceiver"
       android:enabled="true"
       android:exported="true">
       <intent-filter>
           <action android:name="evotor.intent.action.receipt.sell.POSITION_ADDED" />
           <category android:name="android.intent.category.DEFAULT" />
       </intent-filter>
   </receiver>
   ```

   Скачать пример приложения вы можете из [нашего репозитория](https://github.com/evotor/documentation/blob/master/_examples/MyFirstJavaApp-2.3.zip)
