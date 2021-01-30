import 'package:flutter/material.dart';

class Flutter2JsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("flutter -> js"),
      ),
      body: Center(
        child: Text("flutter2js"),
      ),
    );
  }
}
