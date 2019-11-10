import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:vastram/actions/auth_actions.dart';
import 'package:vastram/components/auth/home_button.dart';
import 'package:vastram/components/decorated_container.dart';
import 'package:vastram/components/loader.dart';
import 'package:vastram/models/app_state.dart';

class Otp extends StatefulWidget {
  Otp({Key key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  FocusNode _focusNode = FocusNode();
  final TextEditingController _textFieldController = TextEditingController();
  String phoneNo;
  String otp;
  String verificationId;

  @override
  Widget build(BuildContext context) {
    PhoneCodeSent smsOTPSent = (String verId, [int forceCodeResend]) {
      verificationId = verId;
    };
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: StoreConnector<AppState, _OtpViewModel>(
          onInit: (store) {
            store.dispatch(SendOTP(
              phone: store.state.authState.user.mobile,
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
          converter: _OtpViewModel.fromStore,
          builder: (BuildContext context, _OtpViewModel viewModel) {
            return DecoratedContainer(
              showImage: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 80, left: 40, right: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                    child: Text('Verify', style: Theme.of(context).textTheme.display1.copyWith(color: Theme.of(context).accentColor))
                                  ),
                                ],
                              ),
                              Container(
                                child: viewModel.isLoading ? Loader(
                                  color: Theme.of(context).primaryColor,
                                ) : null
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 100),
                            child: TextField(
                              controller: _textFieldController,
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
                              onChanged: (value) {
                                this.otp = value;
                              },
                              style: Theme.of(context).textTheme.display2.copyWith(letterSpacing: 40),
                              keyboardType: TextInputType.number
                            )
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(top: 20),
                              child: Text('Please enter the OTP received on ' + viewModel.mobile + '.', style: Theme.of(context).textTheme.display4,),
                            )
                          )
                        ],
                      )
                    )
                  ),
                  HomeButton(
                    text: 'Verify',
                    handler: () {
                      viewModel.verifyOtp(verificationId, otp);
                    },
                  )
                ],
              ),
            );
          },
        )
      )
    );
  }
}

class _OtpViewModel {
  final bool isLoading;
  final String mobile;
  final Function(String, String) verifyOtp;

  _OtpViewModel({
    this.isLoading,
    this.mobile,
    this.verifyOtp
  });

  static _OtpViewModel fromStore(Store<AppState> store) {
    return _OtpViewModel(
      isLoading: store.state.isLoading,
      mobile: store.state.authState.user.mobile,
      verifyOtp: (verificationId, otp) {
        store.dispatch(VerifyOTP(
          otp: otp,
          verificationId: verificationId
        ));
      }
    );
  }
}