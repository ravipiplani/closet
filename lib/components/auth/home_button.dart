import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeButton extends StatelessWidget {
  final String text;
  final bool whiteTheme;
  final bool icon;
  final bool leftBorder;
  final VoidCallback handler;

  HomeButton({this.text, this.whiteTheme = false, this.icon = true, this.leftBorder = false, this.handler});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: this.handler,
        splashColor: Theme.of(context).primaryColor.withOpacity(0.2),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1,
                color: whiteTheme ? Colors.white24 : Theme.of(context).primaryColor.withOpacity(0.2)
              ),
              left: leftBorder ? BorderSide(
                width: 1,
                color: whiteTheme ? Colors.white24 : Theme.of(context).primaryColor.withOpacity(0.2)
              ) : BorderSide(width: 0)
            ),
            color: Colors.transparent,
          ),
          padding: EdgeInsets.symmetric(vertical: 26),
          child: buildButton(context)
        )
      )
    );
  }

  Widget buildButton(BuildContext context) {
    if (icon) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: whiteTheme ? Colors.white : Theme.of(context).primaryColor,
              fontWeight: FontWeight.w200
            ),
          ),
          Icon(Icons.chevron_right, size: 25, color: whiteTheme ? Colors.white : Theme.of(context).primaryColor)
        ],
      );
    }
    else {
      return Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: whiteTheme ? Colors.white : Theme.of(context).primaryColor,
          fontWeight: FontWeight.w200
        ),
      );
    }
  }
}