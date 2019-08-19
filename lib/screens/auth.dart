import 'package:closet/components/auth/home_button.dart';
import 'package:closet/components/auth/social_button.dart';
import 'package:closet/components/logo.dart';
import 'package:closet/components/master.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Auth extends StatelessWidget {

  void _navigate(context, routeName) {
    Navigator.of(context).pushNamed(routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Master(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Logo(position: 200),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SocialButton('Connect with Facebook', FontAwesomeIcons.facebookF),
                    SocialButton('Connect with Twitter', FontAwesomeIcons.twitter)
                  ],
                ),
                HomeButton(
                  text: 'or use your mobile number', 
                  handler: () {_navigate(context, 'mobile');})
              ]
            )
          )
        ]
      )
    );
  }
}