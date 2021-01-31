import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';

class Js2FlutterPage extends StatefulWidget {
  @override
  _Js2FlutterPageState createState() => _Js2FlutterPageState();
}

class _Js2FlutterPageState extends State<Js2FlutterPage> {
  String _message = '';

  void _setMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text('js -> flutter'),
    );
    final top = MediaQuery.of(context).padding.top;
    final bottom = MediaQuery.of(context).padding.bottom;
    final screenHeightAll = MediaQuery.of(context).size.height;
    final screenHeight =
        screenHeightAll - top - bottom - appBar.preferredSize.height;
    print('screenHeight:$screenHeight');
    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          SizedBox(
              child: WebView(
                initialUrl: "",
                javascriptMode: JavascriptMode.unrestricted,
                onWebViewCreated: (WebViewController webViewController) {
                  _loadHtmlFromAssets(webViewController);
                },
                javascriptChannels:
                    <JavascriptChannel>[_alertJavascriptChannel()].toSet(),
              ),
              height: screenHeight - 100),
          SizedBox(child: Center(child: Text("$_message")), height: 100)
        ],
      ),
    );
  }

  _alertJavascriptChannel() {
    return JavascriptChannel(
        name: 'WebViewReceiver',
        onMessageReceived: (JavascriptMessage message) {
          print('onMessageReceived:${message.message}');
          this._setMessage(message.message);
        });
  }

  _loadHtmlFromAssets(webViewController) async {
    String fileText = await rootBundle.loadString('html/js2flutter.html');
    String content = Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString();
    print(content);
    webViewController.loadUrl(content);
  }
}
