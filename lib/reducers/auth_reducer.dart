import 'package:redux/redux.dart';
import 'package:vastram/actions/auth_actions.dart';
import 'package:vastram/models/auth_state.dart';

final authReducer = combineReducers<AuthState>([
  TypedReducer<AuthState, AlreadyRegistered>(_alreadyRegistered),
  TypedReducer<AuthState, NewUser>(_newUser),
  TypedReducer<AuthState, LogInSuccessful>(_logIn),
  TypedReducer<AuthState, LogOutSuccessful>(_logOut)
]);

AuthState _alreadyRegistered(AuthState authState, action) {
  return authState.copyWith(isAlreadyRegistered: true, isNewUser: false);
}

AuthState _newUser(AuthState authState, action) {
  return authState.copyWith(isAlreadyRegistered: false, isNewUser: true);
}

AuthState _logIn(AuthState authState, action) {
  return authState.copyWith(isAuthenticated: true);
}

AuthState _logOut(AuthState authState, action) {
  return authState.copyWith(isAuthenticated: false);
}