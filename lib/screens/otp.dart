import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vastram/components/auth/home_button.dart';
import 'package:vastram/components/decorated_container.dart';
import 'package:vastram/components/loader.dart';

class Otp extends StatefulWidget {
  Otp({Key key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  bool _isLoading = false;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: DecoratedContainer(
          showImage: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 80, left: 40, right: 40),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                child: Text('VASTRAM', style: Theme.of(context).textTheme.subhead.copyWith(color: Theme.of(context).primaryColor.withOpacity(0.7)))
                              ),
                              Container(
                                child: Text('Sign In', style: Theme.of(context).textTheme.display1.copyWith(color: Theme.of(context).accentColor))
                              ),
                            ],
                          ),
                          Container(
                            child: _isLoading ? Loader(
                              color: Theme.of(context).primaryColor,
                            ) : null
                          )
                        ],
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 100),
                          child: TextField(
                            focusNode: _focusNode,
                            maxLines: 1,
                            maxLength: 6,
                            decoration: InputDecoration(
                              counter: Offstage(),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              hintText: 'oooooo',
                              hintStyle: Theme.of(context).textTheme.display2.copyWith(color: Theme.of(context).primaryColor.withOpacity(0.3), letterSpacing: 40),
                            ),
                            style: Theme.of(context).textTheme.display2.copyWith(letterSpacing: 40),
                            keyboardType: TextInputType.number
                          )
                        )
                      )
                    ],
                  )
                )
              ),
              HomeButton(
                text: 'Verify',
                handler: () {
                  
                },
              )
            ],
          ),
        ),
      )
    );
  }
}