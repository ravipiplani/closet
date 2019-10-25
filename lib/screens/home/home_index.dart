import 'package:firebase_auth/firebase_auth.dart';
import 'package:vastram/components/customappbar.dart';
import 'package:vastram/components/decorated_container.dart';
import 'package:vastram/components/home/date_selector.dart';
import 'package:vastram/components/home/today_outfit.dart';
import 'package:vastram/components/home/weather_report.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeIndex extends StatefulWidget {
  HomeIndex({Key key}) : super(key: key);

  _HomeIndexState createState() => _HomeIndexState();
}

class _HomeIndexState extends State<HomeIndex> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance
        .currentUser()
        .then((currentUser) => {
          print(currentUser)
        });
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Colors.transparent,
      body: ListView(
        children: <Widget>[
          DateSelector(),
          DecoratedContainer(
            showGradient: false,
            showImage: false,
            borderBottom: true,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TodayOutfit(),
                WeatherReport(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Text('Trending Stories', style: Theme.of(context).textTheme.title),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                singlePost(),
                singlePost(date: '2019-08-20'),
                singlePost(date: '2019-08-18'),
                singlePost(date: '2019-08-18')
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget singlePost({String date = ''}) {
    Widget dateDisplay;
    if (date == '') {
      dateDisplay = Text('YESTERDAY', style: Theme.of(context).textTheme.display4);
    }
    else {
      DateTime tempDate = DateTime.parse(date);
      dateDisplay = Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(tempDate.day.toString(), style: TextStyle(fontSize: 38),),
          Container(
            margin: EdgeInsets.only(left: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(DateFormat.MMM().format(tempDate).toUpperCase(), style: Theme.of(context).textTheme.body1,),
                Text(tempDate.year.toString(), style: Theme.of(context).textTheme.display4)
              ],
            ),
          )
        ],
      );
    }
    return DecoratedContainer(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.all(12),
      borderBottom: true,
      borderLeft: true,
      borderRight: true,
      borderTop: true,
      showGradient: true,
      showImage: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 60.0,
            height: 60.0,
            padding: EdgeInsets.all(8),
            color: Theme.of(context).primaryColorLight,
            child: Image(
              image: AssetImage("assets/images/icon.png"),
              color: Theme.of(context).accentColor,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 10),
              child: Text('This is dummy text. the title of article will be visible here.', style: Theme.of(context).textTheme.subhead.copyWith(color: Theme.of(context).primaryColor),), 
            )
          ),
          dateDisplay
        ],
      ),
    );
  }
}