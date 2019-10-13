import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Logo extends StatelessWidget {
  final double position;
  final bool showLabel;
  final bool smallLogo;

  Logo({this.position, this.showLabel = true, this.smallLogo = false});

  @override
  Widget build (BuildContext context) {
    return Column (
      children: <Widget>[
        Container(
          width: this.smallLogo ? 70 : 100,
          height: this.smallLogo ? 70 : 100,
          margin: EdgeInsets.only(top: this.position),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/icon.png"),
              fit: BoxFit.fill,
            )
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          child: this.showLabel ? Text(
            'vastram',
            style: TextStyle(
              color: Theme.of(context).primaryColor.withOpacity(0.8),
              fontSize: 42,
              fontWeight: FontWeight.w400,
              fontFamily: 'Diavlo'
            ),
          ) : null
        ),
      ],
    );
  }
}