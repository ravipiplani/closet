import 'package:flutter/material.dart';
import 'package:closet/screens/auth.dart';

class AppRootWidget extends StatefulWidget {
  @override
  _AppRootWidgetState createState() => new _AppRootWidgetState();
}

class _AppRootWidgetState extends State<AppRootWidget> {
  ThemeData get _themeData => new ThemeData(
    primaryColor: Colors.cyan,
    accentColor: Colors.indigo,
    scaffoldBackgroundColor: Colors.grey[300],
    fontFamily: 'Avenir'
  );

  @override
  Widget build (BuildContext context) {
    return new MaterialApp(
      title: 'Closet',
      theme: _themeData,
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => Auth()
      },
    );
  }
}