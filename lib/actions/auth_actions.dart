import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class LogIn {
  final String phone;
  final PhoneCodeSent codeSent;
  final PhoneVerificationCompleted verificationCompleted;
  final PhoneVerificationFailed verificationFailed;
  final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout;

  LogIn({@required this.phone, @required this.codeSent, @required this.verificationCompleted, @required this.verificationFailed, @required this.codeAutoRetrievalTimeout });

  @override
  String toString() {
    return 'LogIn{phone: $phone, codeSent: $codeSent, verificationCompleted: $verificationCompleted, verificationFailed: $verificationFailed, codeAutoRetrievalTimeout: $codeAutoRetrievalTimeout}';
  }
}

class OtpSent {}

class LogInSuccessful {
  final FirebaseUser user;

  LogInSuccessful({ @required this.user });

  @override
  String toString() {
    return 'LogIn{user: $user}';
  }
}

class LogInFail {
  final dynamic error;
  LogInFail({this.error});
  @override
  String toString() {
    return 'LogIn{There was an error loggin in: $error}';
  }
}

class LogOut {}

class LogOutSuccessful {
  LogOutSuccessful();
  @override
  String toString() {
    return 'LogOut{user: null}';
  }
}