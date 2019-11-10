import 'package:redux/redux.dart';
import 'package:vastram/actions/auth_actions.dart';
import 'package:vastram/keys.dart';
import 'package:vastram/models/auth_state.dart';
import 'package:vastram/models/user.dart';
import 'package:vastram/routes.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, AlreadyExists>(_alreadyExists),
  TypedReducer<AuthState, NewUser>(_newUser),
  TypedReducer<AuthState, UpdateUser>(_updateUser),
  TypedReducer<AuthState, UserRegistered>(_userRegistered),
  TypedReducer<AuthState, LogInSuccessful>(_logIn),
  TypedReducer<AuthState, LogOutSuccessful>(_logOut)
]);

AuthState _alreadyExists(AuthState authState, AlreadyExists action) {
  return authState.copyWith(user: action.user, isNewUser: !action.user.isRegistered);
}

AuthState _newUser(AuthState authState, NewUser action) {
  return authState.copyWith(isNewUser: true);
}

AuthState _updateUser(AuthState authState, UpdateUser action) {
  Map<String, dynamic> user = authState.user != null ? authState.user.toJson() : {};
  user.addAll(action.keyValues);
  return authState.copyWith(user: User.fromJson(user));
}

AuthState _userRegistered(AuthState authState, UserRegistered action) {
  Keys.navigatorKey.currentState.pushNamed(Routes.otpScreen);
  return authState;
}

AuthState _logIn(AuthState authState, action) {
  return authState.copyWith(isAuthenticated: true);
}

AuthState _logOut(AuthState authState, action) {
  return authState.copyWith(isAuthenticated: false, user: null);
}