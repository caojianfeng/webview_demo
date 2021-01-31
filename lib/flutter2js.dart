import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';

// https://github.com/flutter/plugins/tree/master/packages/webview_flutter
class Flutter2JsPage extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text('flutter -> js'),
    );
    final top = MediaQuery.of(context).padding.top;
    final bottom = MediaQuery.of(context).padding.bottom;
    final screenHeightAll = MediaQuery.of(context).size.height;
    final screenHeight =
        screenHeightAll - top - bottom - appBar.preferredSize.height;
    print('screenHeight:$screenHeight');
    return Scaffold(
      appBar: AppBar(
        title: Text("JavaScript"),
      ),
      body: Column(children: [
        SizedBox(
            child: WebView(
              initialUrl: "",
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _loadHtmlFromAssets(webViewController);
                _controller.complete(webViewController);
              },
            ),
            height: screenHeight - 100),
        SizedBox(
            child: Center(
                child: FlatButton(
                    color: Colors.orange[200],
                    onPressed: () {
                      _sendMessage();
                    },
                    child: Text("发送数据给JS"))),
            height: 100)
      ]),
    );
  }

  _sendMessage() {
    print('_sendMessage');
    _controller.future.then((controller) {
      print('eva');
      controller
          // .evaluateJavascript("alert('hi');")
          .evaluateJavascript("alert('hi');")
          .then((result) {
        print("result: $result ");
      }).catchError((error) => {print("error:$error")});
    });
  }

  _loadHtmlFromAssets(webViewController) async {
    String fileText = await rootBundle.loadString('html/flutter2js.html');
    String content = Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString();
    print(content);
    webViewController.loadUrl(content);
  }
}
