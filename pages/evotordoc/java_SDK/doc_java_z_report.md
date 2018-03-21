---
title: Печать Z-отчёта
keywords: печать, отчёт, z-отчёт
summary:
sidebar: evotordoc_sidebar
permalink: doc_java_z_report.html
tags: [terminal, java]
folder: java_SDK
---

*Чтобы напечатать z-отчёт:*

1. В [манифесте](./doc_java_app_manifest.html) укажите права приложения:

   ```xml
   <uses-permission android:name="ru.evotor.permission.PRINT_Z_REPORT" />
   ```

2. Создайте команду для снятия  чека и вызовите метод `.process`:

   ```java
   new PrintZReportCommand().process(context, callback);
   ```

   Результатом выполнения команды будет печать z-отчёта.
