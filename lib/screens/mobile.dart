import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:vastram/actions/auth_actions.dart';
import 'package:vastram/components/auth/home_button.dart';
import 'package:vastram/components/logo.dart';
import 'package:vastram/components/decorated_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vastram/models/app_state.dart';

class Mobile extends StatefulWidget {
  Mobile({Key key}) : super(key: key);

  _MobileState createState() => _MobileState();
}

class _MobileState extends State<Mobile> {
  final TextEditingController _textFieldController = TextEditingController();
  String phoneNo;
  String otp;
  String verificationId;
  String errorMessage = '';
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhone() async {    
    final PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
        this.verificationId = verId;
        smsOTPDialog(context).then((value) {
          print('sign in');
        });
    };
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: this.phoneNo, // PHONE NUMBER TO SEND OTP
        codeAutoRetrievalTimeout: (String verId) {
          this.verificationId = verId;
        },
      codeSent: smsOTPSent, // WHEN CODE SENT THEN WE OPEN DIALOG TO ENTER OTP.
      timeout: const Duration(seconds: 20),
      verificationCompleted: (AuthCredential phoneAuthCredential) {
        print(phoneAuthCredential);
      },
      verificationFailed: (AuthException exception) {
        print('${exception.message}');
      });
    } catch (e) {    
      handleError(e);
    }
  }

  Future<bool> smsOTPDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
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
            onChanged: (value) {
              this.otp = value;
            }
          ),
          actions: <Widget>[
            FlatButton(
              child: new Text('VERIFY'),
              onPressed: () {    
                _auth.currentUser().then((user) {    
                  if (user != null) {
                      Navigator.of(context).pop();    
                      Navigator.of(context).pushReplacementNamed('home');    
                  } else {    
                      signIn();    
                  }    
                });
              }
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
    
  signIn() async {    
    try {    
      final AuthCredential credential =   PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: otp,
      );
      final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('home');
    } catch (e) {
        handleError(e);
    }
  }    
    
  handleError(PlatformException error) {    
    print(error);
    switch (error.code) {
      case 'ERROR_INVALID_VERIFICATION_CODE':
        FocusScope.of(context).requestFocus(new FocusNode());
        setState(() {
            errorMessage = 'Invalid Code';
        });
        Navigator.of(context).pop();
        smsOTPDialog(context).then((value) {
            print('sign in');
        });
        break;
      default:
        setState(() {
            errorMessage = error.message;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      verificationId = verId;
      smsOTPDialog(context).then((value) {
        print('sign in');
      });
    };
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
                        ),
                        onChanged: (value) {
                          this.phoneNo = value;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              StoreConnector<AppState, VoidCallback>(
                converter: (store) {
                  return () => store.dispatch(LogIn(
                    phone: this.phoneNo,
                    codeSent: smsOTPSent,
                    codeAutoRetrievalTimeout: (String verId) {
                      this.verificationId = verId;
                    },
                    verificationCompleted: (AuthCredential phoneAuthCredential) {
                      print(phoneAuthCredential);
                    },
                    verificationFailed: (AuthException exception) {
                      print('${exception.message}');
                    }
                  ));
                },
                builder: (context, callback) => HomeButton(
                  text: 'Get OTP',
                  handler: callback
                ),
              ),
            ],
          )
        )
      ),
    );
  }
}