import 'package:redux_logging/redux_logging.dart';
import 'package:vastram/middleware/auth_middleware.dart';
import 'package:vastram/models/app_state.dart';
import 'package:vastram/reducers/app_reducer.dart';
import 'package:vastram/screens/home.dart';
import 'package:vastram/screens/items/new_item.dart';
import 'package:vastram/screens/mobile.dart';
import 'package:vastram/screens/walkthrough.dart';
import 'package:flutter/material.dart';
import 'package:vastram/screens/auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class AppRootWidget extends StatefulWidget {
  @override
  _AppRootWidgetState createState() => new _AppRootWidgetState();
}

class _AppRootWidgetState extends State<AppRootWidget> {
  int primaryColor = 0xff1e3b65;
  int accentColor = 0xFFEE4DB9;

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  ThemeData get _themeData => new ThemeData(
    brightness: Brightness.dark,
    primaryColor: Color(primaryColor),
    primaryColorLight: Color(primaryColor).withOpacity(0.9),
    indicatorColor: Color(primaryColor).withOpacity(0.6),
    accentColor: Color(accentColor),
    scaffoldBackgroundColor: Colors.white,
    // Define the default font family.
    fontFamily: 'Avenir',

    // text styling for headlines, titles, bodies of text, and more.
    textTheme: TextTheme(
      display1: TextStyle(fontSize: 42.0, fontWeight: FontWeight.w400, fontFamily: 'Diavlo'),
      display2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w200, color: Color(primaryColor)),
      display3: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
      display4: TextStyle(fontSize: 12.0, color: Color(primaryColor).withOpacity(0.3)),
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold, color: Color(primaryColor)),
      title: TextStyle(fontSize: 24.0, color: Color(accentColor)),
      body2: TextStyle(fontSize: 18.0, color: Color(primaryColor)),
      body1: TextStyle(fontSize: 14.0, color: Color(primaryColor)),
      subhead: TextStyle(color: Color(accentColor).withOpacity(0.9))
    ).apply(
      displayColor: Color(primaryColor),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(
        color: Color(primaryColor).withOpacity(0.9)
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(primaryColor).withOpacity(0.9)
        )
      ),
      helperStyle: TextStyle(
        color: Color(primaryColor).withOpacity(0.9)
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Color(primaryColor).withOpacity(0.9)
        )
      ),
      hintStyle: TextStyle(
        color: Color(primaryColor).withOpacity(0.3)
      ),
    ),
    buttonTheme: ButtonThemeData(
      splashColor: Theme.of(context).primaryColor.withOpacity(0.2)
    ),
  );

  final store = Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: []
      ..addAll(createAuthMiddleware())
      ..add(LoggingMiddleware.printer()),
  );

  @override
  Widget build (BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Vastram',
        theme: _themeData,
        navigatorObservers: <NavigatorObserver>[observer],
        initialRoute: 'mobile',
        routes: {
          '/': (BuildContext context) => Walkthrough(),
          'auth': (BuildContext context) => Auth(),
          'mobile': (BuildContext context) => Mobile(),
          'home': (BuildContext context) => Home(),
          'new_item': (BuildContext context) => NewItem(),
        },
      ),
    );
  }
}