import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodayOutfit extends StatefulWidget {
  TodayOutfit({Key key}) : super(key: key);

  _TodayOutfitState createState() => _TodayOutfitState();
}

class _TodayOutfitState extends State<TodayOutfit> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("assets/images/icon.png"),
              width: 100,
              height: 100,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text('WORN TODAY',
                style: Theme.of(context).textTheme.display4
              )
            )
          ],
        ),
      )
    );
  }
}