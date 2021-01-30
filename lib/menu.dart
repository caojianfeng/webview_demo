import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  final menu = [
    {'title': 'url', 'route': '/url'},
    {'title': 'local', 'route': '/local'},
    {'title': 'using js', 'route': '/js'},
    {'title': 'js->flutter', 'route': '/js2flutter'},
    {'title': 'flutter->js', 'route': '/flutter2js'},
  ];

  Widget _buildItem(context, index) {
    var menuItem = menu[index];
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, menuItem['route']);
        },
        child: ListTile(title: Text(menuItem['title'])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Demo:webview_flutter"),
        ),
        body: ListView.builder(
          itemBuilder: _buildItem,
          itemCount: menu.length,
        ));
  }
}
