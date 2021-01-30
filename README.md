# 玩转flutter的webview

## 官方库：webview_flutter

添加库 webview_flutter

```yaml
#...
dependencies:
  flutter:
    sdk: flutter
  webview_flutter: ^1.0.0
#...
```
## 加载url

### 引入控件
url.dart
```dart
import 'package:webview_flutter/webview_flutter.dart';

class UrlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //...
      body: WebView(
        initialUrl: "https://github.com/caojianfeng/webview_demo",
      ),
    );
  }
}

```

### android增加权限

刚创建的flutter工程，android/app/src/profile/AndroidManifest.xml中默认会带有权限android.permission.INTERNET.

android/app/src/profile/AndroidManifest.xml:
```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.github.caojianfeng.webview_demo">
    <!-- ...  -->
    <uses-permission android:name="android.permission.INTERNET"/>
    <!-- ...  -->
</manifest>

```

但是如果你的url中使用了http或者重定向跳转到http，往往会遇到这样的错误：

```text
net::ERR_CLEARTEXT_NOT_PERMITTED
```

这时候，你需要打开application的usesCleartextTraffics开关

android/app/src/main/AndroidManifest.xml:
```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.github.caojianfeng.webview_demo">
    <application
        ...
        android:hardwareAccelerated="true"
        ...
        >
        <!-- ...  -->
    </application>
</manifest>

```


## 加载本地html

ua设置
注入js
交互js->flutter
交互flutter->js
是否弹出浏览器
处理back


