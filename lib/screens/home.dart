import 'package:closet/components/customappbar.dart';
import 'package:closet/components/decorated_container.dart';
import 'package:closet/components/home/date_selector.dart';
import 'package:closet/components/home/today_outfit.dart';
import 'package:closet/components/home/weather_report.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      showImage: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomPadding: true,
        appBar: CustomAppBar(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: null,
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
                  WeatherReport()
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 4.0,
          color: Color(0xFF1D1D26).withOpacity(0.1),
          elevation: 0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(icon: Icon(Icons.style,), onPressed: () {},),
              IconButton(icon: Icon(Icons.whatshot), onPressed: () {},),
            ],
          ),
        ),
      )
    );
  }
}