---
title: Users API
keywords: sample
summary: "Раздел содержит описание Users API смарт-терминала."
sidebar: evotordoc_sidebar
permalink: doc_smart_terminal_users_api.html
folder: smart_terminal_SDK
published: true
---

### Users API смарт-терминала

С помощью Users API вы можете узнать данные всех пользователей или пользователя, который авторизован на смарт-терминале в данный момент. Например, список прав авторизованного пользователя.



Users API смарт-терминала включает в себя:

* URI контента `BASE_URI = Uri.parse("content://ru.evotor.users")`:

    Данные хранятся локально и синхронизируются с облаком Эвотор сразу после внесения изменений в облаке.

* Таблицу пользователей `UsersTable`:

{% highlight java %}
object UsersTable {
val URI = Uri.withAppendedPath(UsersContentProviderContract.BASE_URI, "users")
val URI_AUTHENTICATED = Uri.withAppendedPath(URI, "authenticated")

val ROW_USER_UUID = "USER_UUID"
val ROW_USER_SECOND_NAME = "USER_SECOND_NAME"
val ROW_USER_FIRST_NAME = "USER_FIRST_NAME"
val ROW_USER_PHONE = "USER_PHONE"
val ROW_USER_PIN = "USER_PIN"
val ROW_ROLE_UUID = "ROLE_UUID"
val ROW_ROLE_TITLE = "ROLE_TITLE"
}
{% endhighlight %}

* Таблицу ролей `RolesTable`:

{% highlight java %}
object RolesTable {
URI = Uri.withAppendedPath(UsersContentProviderContract.BASE_URI, "roles")

val ROW_UUID = "UUID"
val ROW_TITLE = "TITLE"
}
{% endhighlight %}

* Таблицу прав `GrantsTable`:

{% highlight java %}
object GrantsTable {
val URI = Uri.withAppendedPath(UsersContentProviderContract.BASE_URI, "grants")
val URI_GRANTS_OF_AUTHENTICATED_USER = Uri.withAppendedPath(URI, "authenticated")

val ROW_ROLE_UUID = "ROLE_UUID"
val ROW_TITLE = "TITLE"
}
{% endhighlight %}


Схема отношения данных в таблицах.

![](images/UsersAPI.png "Диаграмма отношений данных")

### Примеры запросов к Users API

Работа с данными пользователей:

    {% highlight java %}
    fun createUser(cursor: Cursor): User {
            return User(
                    uuid = cursor.getString(cursor.getColumnIndex(UsersTable.ROW_USER_UUID)),
                    secondName = cursor.getString(cursor.getColumnIndex(UsersTable.ROW_USER_SECOND_NAME)),
                    firstName = cursor.getString(cursor.getColumnIndex(UsersTable.ROW_USER_FIRST_NAME)),
                    phone = cursor.getString(cursor.getColumnIndex(UsersTable.ROW_USER_PHONE)),
                    pin = cursor.getString(cursor.getColumnIndex(UsersTable.ROW_USER_PIN)),
                    roleUuid = cursor.getString(cursor.getColumnIndex(UsersTable.ROW_ROLE_UUID)),
                    roleTitle = cursor.getString(cursor.getColumnIndex(UsersTable.ROW_ROLE_TITLE))
            )
        }

    fun getAllUsers(context: Context): List<User>? { // Получить данные всех пользователей.
        context.contentResolver
                .query(UsersTable.URI, null, null, null, null)
                ?.let { cursor ->
                    val users = ArrayList<User>()
                    try {
                        while (cursor.moveToNext()) {
                            users.add(createUser(cursor))
                        }
                        return users
                    } catch (e: Exception) {
                        e.printStackTrace()
                    } finally {
                        cursor.close()
                    }
                }
        return null
    }

    fun getAuthenticatedUser(context: Context): User? { // Получить данные авторизованных пользователей.
            context.contentResolver
                    .query(UsersTable.URI_AUTHENTICATED, null, null, null, null)
                    ?.let { cursor ->
                        try {
                            if (cursor.moveToFirst()) {
                                return createUser(cursor)
                            }
                        } catch (e: Exception) {
                            e.printStackTrace()
                        } finally {
                            cursor.close()
                        }
                    }
            return null
        }

    {% endhighlight %}

Работа с правами:

     {% highlight java %}
    fun createGrant(cursor: Cursor): Grant {
         return Grant(
                title = cursor.getString(cursor.getColumnIndex(GrantsTable.ROW_TITLE)),
                roleUuid = cursor.getString(cursor.getColumnIndex(GrantsTable.ROW_ROLE_UUID))
        )
    }

    fun getAllGrants(context: Context): List<Grant>? {//Получить список всех доступных прав.
            context.contentResolver
                    .query(GrantsTable.URI, null, null, null, null)
                    ?.let { cursor ->
                        val grants = ArrayList<Grant>()
                        try {
                            while (cursor.moveToNext()) {
                                grants.add(createGrant(cursor))
                            }
                            return grants
                        } catch (e: Exception) {
                            e.printStackTrace()
                        } finally {
                            cursor.close()
                        }
                    }
            return null
    }

    fun getGrantsOfAuthenticatedUser(context: Context): List<Grant>? {//Получить список прав авторизованного пользователя.
            context.contentResolver
                    .query(GrantsTable.URI_GRANTS_OF_AUTHENTICATED_USER, null, null, null, null)
                    ?.let { cursor ->
                        val grants = ArrayList<Grant>()
                        try {
                            while (cursor.moveToNext()) {
                                grants.add(createGrant(cursor))
                            }
                            return grants
                        } catch (e: Exception) {
                            e.printStackTrace()
                        } finally {
                            cursor.close()
                        }
                    }
    }
    {% endhighlight %}
