import 'package:firebase_auth/firebase_auth.dart';
import 'package:redux/redux.dart';
import 'package:vastram/actions/auth_actions.dart';
import 'package:vastram/models/app_state.dart';

List<Middleware<AppState>> createAuthMiddleware() {
  final logIn = _createLogInMiddleware();
  final logOut = _createLogOutMiddleware();

  return [
    TypedMiddleware<AppState, LogIn>(logIn),
    TypedMiddleware<AppState, LogOut>(logOut)
  ];
}

Middleware<AppState> _createLogInMiddleware() {
  return (Store store, action, NextDispatcher next) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;

    if (action is LogIn) {
      try {
        await _auth.verifyPhoneNumber(
          phoneNumber: action.phone,
          codeAutoRetrievalTimeout: action.codeAutoRetrievalTimeout,
          codeSent: action.codeSent,
          timeout: const Duration(seconds: 20),
          verificationCompleted: action.verificationCompleted,
          verificationFailed: action.verificationFailed
        );
        print("otp sent");
      }
      catch (error) {
        print(error);
      }
    }
    next(action);
  };
}

Middleware<AppState> _createLogOutMiddleware() {
  return (Store store, action, NextDispatcher next) async {
    next(action);
  };
}