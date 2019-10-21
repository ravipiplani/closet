import 'package:vastram/components/auth/home_button.dart';
import 'package:vastram/components/auth/social_button.dart';
import 'package:vastram/components/logo.dart';
import 'package:vastram/components/decorated_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Auth extends StatefulWidget {
  Auth({Key key}) : super(key: key);

  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedContainer(
        showImage: false,
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
                      SocialButton('Connect with Google', FontAwesomeIcons.google)
                    ],
                  ),
                  HomeButton(
                    text: 'or use your mobile number', 
                    handler: () { Navigator.of(context).pushNamed('mobile'); })
                ]
              )
            )
          ]
        )
      ),
    );
  }
}