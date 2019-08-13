import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeButton extends StatelessWidget {
  final String text;

  HomeButton(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Color(0xff1e3b65).withOpacity(0.2)
          )
        )
      ),
      padding: EdgeInsets.symmetric(vertical: 27, horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Color(0xff1e3b65),
                fontWeight: FontWeight.w200
              ),
            ),
          ),
          Icon(Icons.chevron_right, size: 25, color: Color(0xff1e3b65).withOpacity(1))
        ],
      )
    );
  }
}