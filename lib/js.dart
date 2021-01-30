import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';

// https://github.com/flutter/plugins/tree/master/packages/webview_flutter
class JsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JavaScript"),
      ),
      body: WebView(
        initialUrl: "",
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _loadHtmlFromAssets(webViewController);
        },
      ),
    );
  }

  _loadHtmlFromAssets(webViewController) async {
    String fileText = await rootBundle.loadString('html/hellojs.html');
    String content = Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString();
    print(content);
    webViewController.loadUrl(content);
  }
}
