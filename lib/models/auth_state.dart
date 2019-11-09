import 'package:flutter/cupertino.dart';
import 'package:vastram/models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_state.g.dart';

@JsonSerializable()
@immutable
class AuthState {
  final bool isAuthenticated;
  final bool isNewUser;
  final User user;

  AuthState({
    this.isAuthenticated,
    this.isNewUser,
    this.user
  });

  AuthState copyWith({bool isAuthenticated, bool isNewUser, User user}) {
    return AuthState(
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isNewUser: isNewUser ?? this.isNewUser,
      user: user ?? this.user
    );
  }

  factory AuthState.fromJson(Map<String, dynamic> json) => _$AuthStateFromJson(json);

  Map<String, dynamic> toJson() => _$AuthStateToJson(this);

  @override
  String toString() {
    return 'AuthState{isAuthenticated: $isAuthenticated, isNewUser: $isNewUser, user: $user}';
  }
}