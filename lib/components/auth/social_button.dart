import 'package:closet/components/decorated_container.dart';
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String label;
  final IconData icon;

  SocialButton(this.label, this.icon);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Color(0xff1e3b65).withOpacity(0.2),
          onTap: () {
            print('click');
          },
          child: DecoratedContainer(
            borderTop: true,
            borderRight: true,
            padding: EdgeInsets.symmetric(vertical: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(this.icon, color: Theme.of(context).primaryColor, size: 30,),
                Container(
                  width: 120,
                  margin: EdgeInsets.only(top: 20),
                  child: Text(this.label, style: Theme.of(context).textTheme.display3, textAlign: TextAlign.center),
                )
              ],
            )
          )
        )
      )
    );
  }
}