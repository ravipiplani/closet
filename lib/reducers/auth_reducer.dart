import 'package:redux/redux.dart';
import 'package:vastram/actions/auth_actions.dart';

final authReducer = combineReducers<bool>([
  TypedReducer<bool, LogInSuccessful>(_logIn),
  TypedReducer<bool, LogOut>(_logOut)
]);

bool _logIn(bool isLoggedIn, action) {
  return true;
}

bool _logOut(bool isLoggedIn, action) {
  return false;
}