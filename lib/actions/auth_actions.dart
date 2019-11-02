import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class CheckIfAlreadyRegistered {
  final String phone;

  CheckIfAlreadyRegistered({this.phone});

  @override
  String toString() {
    return 'CheckIfAlreadyRegistered{phone: $phone}';
  }
}

class AlreadyRegistered {}

class NewUser {}

class SendOTP {
  final String phone;
  final PhoneCodeSent codeSent;
  final PhoneVerificationCompleted verificationCompleted;
  final PhoneVerificationFailed verificationFailed;
  final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout;

  SendOTP({@required this.phone, @required this.codeSent, @required this.verificationCompleted, @required this.verificationFailed, @required this.codeAutoRetrievalTimeout });

  @override
  String toString() {
    return 'SendOTP{phone: $phone, codeSent: $codeSent, verificationCompleted: $verificationCompleted, verificationFailed: $verificationFailed, codeAutoRetrievalTimeout: $codeAutoRetrievalTimeout}';
  }
}

class VerifyOTP {
  final String verificationId;
  final String otp;

  VerifyOTP({@required this.verificationId, @required this.otp});

  @override
  String toString() {
    return 'VerifyOTP{verificationId: $verificationId, otp: $otp}';
  }
}

class LogInSuccessful {
  final FirebaseUser user;

  LogInSuccessful({ @required this.user });

  @override
  String toString() {
    return 'LogInSuccessful{user: $user}';
  }
}

class LogInFail {
  final dynamic error;

  LogInFail({this.error});

  @override
  String toString() {
    return 'LogInFail{There was an error loggin in: $error}';
  }
}

class LogOut {}

class LogOutSuccessful {
  LogOutSuccessful();
  @override
  String toString() {
    return 'LogOutSuccessful{user: null}';
  }
}