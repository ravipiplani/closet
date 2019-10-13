import 'package:vastram/components/auth/home_button.dart';
import 'package:vastram/components/logo.dart';
import 'package:vastram/components/decorated_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Mobile extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedContainer(
        showImage: false,
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
                text: 'Get OTP',
                handler: () {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        title: Text('Enter OTP'),
                        content: TextField(
                          controller: _textFieldController,
                          decoration: InputDecoration(
                            helperText: "Enter OTP to verify mobile number!",
                            hintText: 'OTP'
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: new Text('VERIFY'),
                            onPressed: () {
                              Navigator.of(context).pushNamed('home');
                            },
                          ),
                          FlatButton(
                            child: new Text('CANCEL'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    }
                  );
                }
              )
            ],
          )
        )
      ),
    );
  }
}