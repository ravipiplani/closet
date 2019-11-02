import 'package:flutter/cupertino.dart';

@immutable
class AuthState {
  final bool isAuthenticated;
  final bool isNewUser;
  final bool isAlreadyRegistered;

  AuthState({
    this.isAuthenticated,
    this.isNewUser,
    this.isAlreadyRegistered
  });

  AuthState copyWith({bool isAuthenticated, bool isNewUser, bool isAlreadyRegistered}) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isNewUser: isNewUser ?? this.isNewUser,
      isAlreadyRegistered: isAlreadyRegistered ?? this.isAlreadyRegistered
    );
  }

  static AuthState fromJson(dynamic json) {
    return AuthState(isAuthenticated: json["isAuthenticated"], isNewUser: json["isNewUser"], isAlreadyRegistered: json["isAlreadyRegistered"]);
  }

  dynamic toJson() {
    return {'isAuthenticated': isAuthenticated, 'isNewUser': isNewUser, 'isAlreadyRegistered': isAlreadyRegistered};
  }

  @override
  String toString() {
    return 'AuthState{isAuthenticated: $isAuthenticated, isNewUser: $isNewUser, isAlreadyRegistered: $isAlreadyRegistered}';
  }
}