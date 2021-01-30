import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class UrlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("url"),
      ),
      body: WebView(
        initialUrl: "https://github.com/caojianfeng/webview_demo",
      ),
    );
  }
}
