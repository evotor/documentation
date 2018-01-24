---
title: Навигация
keywords: react
sidebar: evotordoc_sidebar
toc: true
permalink: react_reference_parameters_navigation.html
folder: react_reference
---

## Класс AbstractJavaReadable

```js
export class AbstractJavaReadable {

    constructor(name) {}

    toJavaReadable(): JavaReadable

}
```

## Класс Intent

```js
export class Intent {

    static ACTION_AIRPLANE_MODE_CHANGED = "android.intent.action.AIRPLANE_MODE";
    static ACTION_ALL_APPS = "android.intent.action.ALL_APPS";
    static ACTION_ANSWER = "android.intent.action.ANSWER";
    static ACTION_APPLICATION_PREFERENCES = "android.intent.action.APPLICATION_PREFERENCES";
    static ACTION_APPLICATION_RESTRICTIONS_CHANGED = "android.intent.action.APPLICATION_RESTRICTIONS_CHANGED";
    static ACTION_APP_ERROR = "android.intent.action.APP_ERROR";
    static ACTION_ASSIST = "android.intent.action.ASSIST";
    static ACTION_ATTACH_DATA = "android.intent.action.ATTACH_DATA";
    static ACTION_BATTERY_CHANGED = "android.intent.action.BATTERY_CHANGED";
    static ACTION_BATTERY_LOW = "android.intent.action.BATTERY_LOW";
    static ACTION_BATTERY_OKAY = "android.intent.action.BATTERY_OKAY";
    static ACTION_BOOT_COMPLETED = "android.intent.action.BOOT_COMPLETED";
    static ACTION_BUG_REPORT = "android.intent.action.BUG_REPORT";
    static ACTION_CALL = "android.intent.action.CALL";
    static ACTION_CALL_BUTTON = "android.intent.action.CALL_BUTTON";
    static ACTION_CAMERA_BUTTON = "android.intent.action.CAMERA_BUTTON";
    static ACTION_CARRIER_SETUP = "android.intent.action.CARRIER_SETUP";
    static ACTION_CHOOSER = "android.intent.action.CHOOSER";
    static ACTION_CLOSE_SYSTEM_DIALOGS = "android.intent.action.CLOSE_SYSTEM_DIALOGS";
    static ACTION_CONFIGURATION_CHANGED = "android.intent.action.CONFIGURATION_CHANGED";
    static ACTION_CREATE_DOCUMENT = "android.intent.action.CREATE_DOCUMENT";
    static ACTION_CREATE_SHORTCUT = "android.intent.action.CREATE_SHORTCUT";
    static ACTION_DATE_CHANGED = "android.intent.action.DATE_CHANGED";
    static ACTION_DEFAULT = "android.intent.action.VIEW";
    static ACTION_DELETE = "android.intent.action.DELETE";
    static ACTION_DIAL = "android.intent.action.DIAL";
    static ACTION_DOCK_EVENT = "android.intent.action.DOCK_EVENT";
    static ACTION_DREAMING_STARTED = "android.intent.action.DREAMING_STARTED";
    static ACTION_DREAMING_STOPPED = "android.intent.action.DREAMING_STOPPED";
    static ACTION_EDIT = "android.intent.action.EDIT";
    static ACTION_EXTERNAL_APPLICATIONS_AVAILABLE = "android.intent.action.EXTERNAL_APPLICATIONS_AVAILABLE";
    static ACTION_EXTERNAL_APPLICATIONS_UNAVAILABLE = "android.intent.action.EXTERNAL_APPLICATIONS_UNAVAILABLE";
    static ACTION_FACTORY_TEST = "android.intent.action.FACTORY_TEST";
    static ACTION_GET_CONTENT = "android.intent.action.GET_CONTENT";
    static ACTION_GET_RESTRICTION_ENTRIES = "android.intent.action.GET_RESTRICTION_ENTRIES";
    static ACTION_GTALK_SERVICE_CONNECTED = "android.intent.action.GTALK_CONNECTED";
    static ACTION_GTALK_SERVICE_DISCONNECTED = "android.intent.action.GTALK_DISCONNECTED";
    static ACTION_HEADSET_PLUG = "android.intent.action.HEADSET_PLUG";
    static ACTION_INPUT_METHOD_CHANGED = "android.intent.action.INPUT_METHOD_CHANGED";
    static ACTION_INSERT = "android.intent.action.INSERT";
    static ACTION_INSERT_OR_EDIT = "android.intent.action.INSERT_OR_EDIT";
    static ACTION_INSTALL_FAILURE = "android.intent.action.INSTALL_FAILURE";
    static ACTION_INSTALL_PACKAGE = "android.intent.action.INSTALL_PACKAGE";
    static ACTION_LOCALE_CHANGED = "android.intent.action.LOCALE_CHANGED";
    static ACTION_LOCKED_BOOT_COMPLETED = "android.intent.action.LOCKED_BOOT_COMPLETED";
    static ACTION_MAIN = "android.intent.action.MAIN";
    static ACTION_MANAGED_PROFILE_ADDED = "android.intent.action.MANAGED_PROFILE_ADDED";
    static ACTION_MANAGED_PROFILE_AVAILABLE = "android.intent.action.MANAGED_PROFILE_AVAILABLE";
    static ACTION_MANAGED_PROFILE_REMOVED = "android.intent.action.MANAGED_PROFILE_REMOVED";
    static ACTION_MANAGED_PROFILE_UNAVAILABLE = "android.intent.action.MANAGED_PROFILE_UNAVAILABLE";
    static ACTION_MANAGED_PROFILE_UNLOCKED = "android.intent.action.MANAGED_PROFILE_UNLOCKED";
    static ACTION_MANAGE_NETWORK_USAGE = "android.intent.action.MANAGE_NETWORK_USAGE";
    static ACTION_MANAGE_PACKAGE_STORAGE = "android.intent.action.MANAGE_PACKAGE_STORAGE";
    static ACTION_MEDIA_BAD_REMOVAL = "android.intent.action.MEDIA_BAD_REMOVAL";
    static ACTION_MEDIA_BUTTON = "android.intent.action.MEDIA_BUTTON";
    static ACTION_MEDIA_CHECKING = "android.intent.action.MEDIA_CHECKING";
    static ACTION_MEDIA_EJECT = "android.intent.action.MEDIA_EJECT";
    static ACTION_MEDIA_MOUNTED = "android.intent.action.MEDIA_MOUNTED";
    static ACTION_MEDIA_NOFS = "android.intent.action.MEDIA_NOFS";
    static ACTION_MEDIA_REMOVED = "android.intent.action.MEDIA_REMOVED";
    static ACTION_MEDIA_SCANNER_FINISHED = "android.intent.action.MEDIA_SCANNER_FINISHED";
    static ACTION_MEDIA_SCANNER_SCAN_FILE = "android.intent.action.MEDIA_SCANNER_SCAN_FILE";
    static ACTION_MEDIA_SCANNER_STARTED = "android.intent.action.MEDIA_SCANNER_STARTED";
    static ACTION_MEDIA_SHARED = "android.intent.action.MEDIA_SHARED";
    static ACTION_MEDIA_UNMOUNTABLE = "android.intent.action.MEDIA_UNMOUNTABLE";
    static ACTION_MEDIA_UNMOUNTED = "android.intent.action.MEDIA_UNMOUNTED";
    static ACTION_MY_PACKAGE_REPLACED = "android.intent.action.MY_PACKAGE_REPLACED";
    static ACTION_NEW_OUTGOING_CALL = "android.intent.action.NEW_OUTGOING_CALL";
    static ACTION_OPEN_DOCUMENT = "android.intent.action.OPEN_DOCUMENT";
    static ACTION_OPEN_DOCUMENT_TREE = "android.intent.action.OPEN_DOCUMENT_TREE";
    static ACTION_PACKAGES_SUSPENDED = "android.intent.action.PACKAGES_SUSPENDED";
    static ACTION_PACKAGES_UNSUSPENDED = "android.intent.action.PACKAGES_UNSUSPENDED";
    static ACTION_PACKAGE_ADDED = "android.intent.action.PACKAGE_ADDED";
    static ACTION_PACKAGE_CHANGED = "android.intent.action.PACKAGE_CHANGED";
    static ACTION_PACKAGE_DATA_CLEARED = "android.intent.action.PACKAGE_DATA_CLEARED";
    static ACTION_PACKAGE_FIRST_LAUNCH = "android.intent.action.PACKAGE_FIRST_LAUNCH";
    static ACTION_PACKAGE_FULLY_REMOVED = "android.intent.action.PACKAGE_FULLY_REMOVED";
    static ACTION_PACKAGE_NEEDS_VERIFICATION = "android.intent.action.PACKAGE_NEEDS_VERIFICATION";
    static ACTION_PACKAGE_REMOVED = "android.intent.action.PACKAGE_REMOVED";
    static ACTION_PACKAGE_REPLACED = "android.intent.action.PACKAGE_REPLACED";
    static ACTION_PACKAGE_RESTARTED = "android.intent.action.PACKAGE_RESTARTED";
    static ACTION_PACKAGE_VERIFIED = "android.intent.action.PACKAGE_VERIFIED";
    static ACTION_PASTE = "android.intent.action.PASTE";
    static ACTION_PICK = "android.intent.action.PICK";
    static ACTION_PICK_ACTIVITY = "android.intent.action.PICK_ACTIVITY";
    static ACTION_POWER_CONNECTED = "android.intent.action.ACTION_POWER_CONNECTED";
    static ACTION_POWER_DISCONNECTED = "android.intent.action.ACTION_POWER_DISCONNECTED";
    static ACTION_POWER_USAGE_SUMMARY = "android.intent.action.POWER_USAGE_SUMMARY";
    static ACTION_PROCESS_TEXT = "android.intent.action.PROCESS_TEXT";
    static ACTION_PROVIDER_CHANGED = "android.intent.action.PROVIDER_CHANGED";
    static ACTION_QUICK_CLOCK = "android.intent.action.QUICK_CLOCK";
    static ACTION_QUICK_VIEW = "android.intent.action.QUICK_VIEW";
    static ACTION_REBOOT = "android.intent.action.REBOOT";
    static ACTION_RUN = "android.intent.action.RUN";
    static ACTION_SCREEN_OFF = "android.intent.action.SCREEN_OFF";
    static ACTION_SCREEN_ON = "android.intent.action.SCREEN_ON";
    static ACTION_SEARCH = "android.intent.action.SEARCH";
    static ACTION_SEARCH_LONG_PRESS = "android.intent.action.SEARCH_LONG_PRESS";
    static ACTION_SEND = "android.intent.action.SEND";
    static ACTION_SENDTO = "android.intent.action.SENDTO";
    static ACTION_SEND_MULTIPLE = "android.intent.action.SEND_MULTIPLE";
    static ACTION_SET_WALLPAPER = "android.intent.action.SET_WALLPAPER";
    static ACTION_SHOW_APP_INFO = "android.intent.action.SHOW_APP_INFO";
    static ACTION_SHUTDOWN = "android.intent.action.ACTION_SHUTDOWN";
    static ACTION_SYNC = "android.intent.action.SYNC";
    static ACTION_SYSTEM_TUTORIAL = "android.intent.action.SYSTEM_TUTORIAL";
    static ACTION_TIMEZONE_CHANGED = "android.intent.action.TIMEZONE_CHANGED";
    static ACTION_TIME_CHANGED = "android.intent.action.TIME_SET";
    static ACTION_TIME_TICK = "android.intent.action.TIME_TICK";
    static ACTION_UID_REMOVED = "android.intent.action.UID_REMOVED";
    static ACTION_UNINSTALL_PACKAGE = "android.intent.action.UNINSTALL_PACKAGE";
    static ACTION_USER_BACKGROUND = "android.intent.action.USER_BACKGROUND";
    static ACTION_USER_FOREGROUND = "android.intent.action.USER_FOREGROUND";
    static ACTION_USER_INITIALIZE = "android.intent.action.USER_INITIALIZE";
    static ACTION_USER_PRESENT = "android.intent.action.USER_PRESENT";
    static ACTION_USER_UNLOCKED = "android.intent.action.USER_UNLOCKED";
    static ACTION_VIEW = "android.intent.action.VIEW";
    static ACTION_VOICE_COMMAND = "android.intent.action.VOICE_COMMAND";
    static ACTION_WEB_SEARCH = "android.intent.action.WEB_SEARCH";

    static CATEGORY_ALTERNATIVE = 'android.intent.category.ALTERNATIVE';
    static CATEGORY_APP_BROWSER = 'android.intent.category.APP_BROWSER';
    static CATEGORY_APP_CALCULATOR = 'android.intent.category.APP_CALCULATOR';
    static CATEGORY_APP_CALENDAR = 'android.intent.category.APP_CALENDAR';
    static CATEGORY_APP_CONTACTS = 'android.intent.category.APP_CONTACTS';
    static CATEGORY_APP_EMAIL = 'android.intent.category.APP_EMAIL';
    static CATEGORY_APP_GALLERY = 'android.intent.category.APP_GALLERY';
    static CATEGORY_APP_MAPS = 'android.intent.category.APP_MAPS';
    static CATEGORY_APP_MARKET = 'android.intent.category.APP_MARKET';
    static CATEGORY_APP_MESSAGING = 'android.intent.category.APP_MESSAGING';
    static CATEGORY_APP_MUSIC = 'android.intent.category.APP_MUSIC';
    static CATEGORY_BROWSABLE = 'android.intent.category.BROWSABLE';
    static CATEGORY_CAR_DOCK = 'android.intent.category.CAR_DOCK';
    static CATEGORY_CAR_MODE = 'android.intent.category.CAR_MODE';
    static CATEGORY_DEFAULT = 'android.intent.category.DEFAULT';
    static CATEGORY_DESK_DOCK = 'android.intent.category.DESK_DOCK';
    static CATEGORY_DEVELOPMENT_PREFERENCE = 'android.intent.category.DEVELOPMENT_PREFERENCE';
    static CATEGORY_EMBED = 'android.intent.category.EMBED';
    static CATEGORY_FRAMEWORK_INSTRUMENTATION_TEST = 'android.intent.category.FRAMEWORK_INSTRUMENTATION_TEST';
    static CATEGORY_HE_DESK_DOCK = 'android.intent.category.HE_DESK_DOCK';
    static CATEGORY_HOME = 'android.intent.category.HOME';
    static CATEGORY_INFO = 'android.intent.category.INFO';
    static CATEGORY_LAUNCHER = 'android.intent.category.LAUNCHER';
    static CATEGORY_LEANBACK_LAUNCHER = 'android.intent.category.LEANBACK_LAUNCHER';
    static CATEGORY_LE_DESK_DOCK = 'android.intent.category.LE_DESK_DOCK';
    static CATEGORY_MONKEY = 'android.intent.category.MONKEY';
    static CATEGORY_OPENABLE = 'android.intent.category.OPENABLE';
    static CATEGORY_PREFERENCE = 'android.intent.category.PREFERENCE';
    static CATEGORY_SAMPLE_CODE = 'android.intent.category.SAMPLE_CODE';
    static CATEGORY_SELECTED_ALTERNATIVE = 'android.intent.category.SELECTED_ALTERNATIVE';
    static CATEGORY_TAB = 'android.intent.category.TAB';
    static CATEGORY_TEST = 'android.intent.category.TEST';
    static CATEGORY_TYPED_OPENABLE = 'android.intent.category.TYPED_OPENABLE';
    static CATEGORY_UNIT_TEST = 'android.intent.category.UNIT_TEST';
    static CATEGORY_VOICE = 'android.intent.category.VOICE';
    static CATEGORY_VR_HOME = 'android.intent.category.VR_HOME';

    static FLAG_ACTIVITY_BROUGHT_TO_FRONT = 4194304;
    static FLAG_ACTIVITY_CLEAR_TASK = 32768;
    static FLAG_ACTIVITY_CLEAR_TOP = 67108864;
    static FLAG_ACTIVITY_EXCLUDE_FROM_RECENTS = 8388608;
    static FLAG_ACTIVITY_FORWARD_RESULT = 33554432;
    static FLAG_ACTIVITY_LAUNCHED_FROM_HISTORY = 1048576;
    static FLAG_ACTIVITY_LAUNCH_ADJACENT = 4096;
    static FLAG_ACTIVITY_MULTIPLE_TASK = 134217728;
    static FLAG_ACTIVITY_NEW_DOCUMENT = 524288;
    static FLAG_ACTIVITY_NEW_TASK = 268435456;
    static FLAG_ACTIVITY_NO_HISTORY = 1073741824;
    static FLAG_ACTIVITY_NO_USER_ACTION = 262144;
    static FLAG_ACTIVITY_PREVIOUS_IS_TOP = 16777216;
    static FLAG_ACTIVITY_REORDER_TO_FRONT = 131072;
    static FLAG_ACTIVITY_RESET_TASK_IF_NEEDED = 2097152;
    static FLAG_ACTIVITY_RETAIN_IN_RECENTS = 8192;
    static FLAG_ACTIVITY_SINGLE_TOP = 536870912;
    static FLAG_ACTIVITY_TASK_ON_HOME = 16384;
    static FLAG_DEBUG_LOG_RESOLUTION = 8;
    static FLAG_EXCLUDE_STOPPED_PACKAGES = 16;
    static FLAG_FROM_BACKGROUND = 4;
    static FLAG_GRANT_PERSISTABLE_URI_PERMISSION = 64;
    static FLAG_GRANT_PREFIX_URI_PERMISSION = 128;
    static FLAG_GRANT_READ_URI_PERMISSION = 1;
    static FLAG_GRANT_WRITE_URI_PERMISSION = 2;
    static FLAG_INCLUDE_STOPPED_PACKAGES = 32;
    static FLAG_RECEIVER_FOREGROUND = 268435456;
    static FLAG_RECEIVER_NO_ABORT = 134217728;
    static FLAG_RECEIVER_REGISTERED_ONLY = 1073741824;
    static FLAG_RECEIVER_REPLACE_PENDING = 536870912;
    static FLAG_RECEIVER_VISIBLE_TO_INSTANT_APPS = 2097152;

    constructor() {
        this._extras = {};
        this._categories = [];
        this._flags = [];
    }

    setAction(action: string): void {
        this._action = action;
    }

    getAction(): string {
        return this._action;
    }

    setClassName(className: string): void {
        this._className = className;
    }

    getClassName(): string {
        return this._className;
    }

    setPackage(packageName: string): void {
        this._package = packageName;
    }

    getPackage(): string {
        return this._package;
    }

    putExtra(key: string, extra: Writable | JavaReadable): void {
        this._extras[key] = extra;
    }

    putExtras(extras: Bundle): void {
        this._extras = Object.assign(this._extras, extras);
    }

    removeExtra(key: string): void {
        delete this._extras[key];
    }

    replaceExtras(extras: Bundle): void {
        this._extras = extras;
    }

    getExtra(key: string): Writable | JavaReadable {
        return this._extras[key];
    }

    getExtras(): Bundle {
        return this._extras;
    }

    hasExtra(key: string): boolean {
        return this._extras.hasOwnProperty(key);
    }

    addCategory(category: string): void {
        this._categories.push(category);
    }

    removeCategory(category: string): void {
        this._categories.filter(e => e !== category);
    }

    getCategories(): string[] {
        return this._categories;
    }

    hasCategory(category: string): boolean {
        return this._categories.includes(category);
    }

    addFlags(flags: number): void {
        this._flags.push(flags);
    }

    setFlags(flags: number): void {
        this._flags = [flags];
    }

    getFlags(): number {
        return this._flags;
    }

    removeFlags(flags: number): void {
        this._flags.filter(e => e !== flags);
    }

}
```
