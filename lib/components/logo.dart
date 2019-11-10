import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Logo extends StatelessWidget {
  final double position;
  final bool showLabel;
  final double size;
  final CrossAxisAlignment alignment;

  Logo({this.position, this.showLabel = true, this.size = 100, this.alignment = CrossAxisAlignment.center});

  @override
  Widget build (BuildContext context) {
    return Column (
      crossAxisAlignment: this.alignment,
      children: <Widget>[
        Container(
          width: this.size,
          height: this.size,
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
            'VASTRAM',
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