import 'package:flutter/material.dart';
import 'package:webview_demo/menu.dart';
import 'package:webview_demo/url.dart';
import 'package:webview_demo/local.dart';
import 'package:webview_demo/js.dart';
import 'package:webview_demo/js2flutter.dart';
import 'package:webview_demo/flutter2js.dart';

class RouteGenerator {
  static final routes = {
    "/": (context, {arguments}) => Menu(),
    "/url": (context, {arguments}) => UrlPage(),
    "/local": (context, {arguments}) => LocalPage(),
    "/js": (context, {arguments}) => JsPage(),
    "/flutter2js": (context, {arguments}) => Flutter2JsPage(),
    "/js2flutter": (context, {arguments}) => Js2FlutterPage(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String name = settings.name;
    final Function pageContentBuilder = routes[name];
    if (pageContentBuilder != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      return _errorPage('找不到页面');
    }
  }

  static Route _errorPage(msg) {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
          appBar: AppBar(title: Text('未知页面')), body: Center(child: Text(msg)));
    });
  }
}
