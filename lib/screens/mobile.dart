import 'package:closet/components/auth/home_button.dart';
import 'package:closet/components/logo.dart';
import 'package:closet/components/master.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mobile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Master(
      child :Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 32.0),
                children: <Widget>[
                  Logo(
                    position: 100,
                    showLabel: false,
                    smallLogo: true,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text('Get Started', style: Theme.of(context).textTheme.display3,),
                    alignment: Alignment.center,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        helperText: "Enter mobile number to get started!",
                        hintText: 'Mobile Number'
                      )
                    ),
                  ),
                ],
              ),
            ),
            HomeButton(
              text: 'Verify Now',
              handler: () {
                Navigator.of(context).pushNamed('home');
              }
            )
          ],
        )
      )
    );
  }
}