import 'package:closet/components/customappbar.dart';
import 'package:closet/components/decorated_container.dart';
import 'package:closet/components/home/date_selector.dart';
import 'package:closet/components/home/today_outfit.dart';
import 'package:closet/components/home/weather_report.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      showImage: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomPadding: true,
        appBar: CustomAppBar(),
        floatingActionButton: FloatingActionButton(
          // label: Text('Add'),
          child: Icon(Icons.add),
          onPressed: _addOptions,
          isExtended: true,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
              padding: EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Text('Recent Looks', style: Theme.of(context).textTheme.title),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      singlePost(),
                      singlePost(date: '2019-08-19'),
                      singlePost(date: '2019-08-18')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          shape: AutomaticNotchedShape(
            RoundedRectangleBorder(),
            StadiumBorder(side: BorderSide())
          ),
          notchMargin: 4.0,
          color: Colors.white10,
          elevation: 1,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(icon: Icon(Icons.style, color: Theme.of(context).primaryColor), onPressed: () {},),
              IconButton(icon: Icon(Icons.whatshot, color: Theme.of(context).primaryColor), onPressed: () {},),
            ],
          ),
        ),
      )
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
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.only(bottom: 30),
      borderBottom: true,
      showGradient: false,
      showImage: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
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
          dateDisplay
        ],
      ),
    );
  }

  void _addOptions() {
    showDialog<Null>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(''),
          titlePadding: EdgeInsets.all(0),
          titleTextStyle: TextStyle(height: 0),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: FlatButton.icon(
                  icon: Icon(Icons.add, color: Theme.of(context).primaryColor,),
                  label: Text('Add Cloth', style: Theme.of(context).textTheme.subhead.copyWith(color: Theme.of(context).primaryColor),),
                  onPressed: () {
                    Navigator.of(context).pushNamed('new_item');
                  },
                ),
              ),
              Container(
                child: FlatButton.icon(
                  icon: Icon(Icons.mode_edit, color: Theme.of(context).primaryColor,),
                  label: Text('Create Outfit', style: Theme.of(context).textTheme.subhead.copyWith(color: Theme.of(context).primaryColor),),
                  onPressed: () {},
                ),
              ),
              Container(
                child: FlatButton.icon(
                  icon: Icon(Icons.whatshot, color: Theme.of(context).accentColor,),
                  label: Text('Post my Look', style: Theme.of(context).textTheme.subhead,),
                  onPressed: () {},
                ),
              )
            ],
          ),
          actions: null,
        );
      },
    );
  }
}