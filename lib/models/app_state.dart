import 'package:flutter/cupertino.dart';
import 'package:vastram/models/auth_state.dart';

@immutable
class AppState {
  final bool isLoading;
  final AuthState authState;

  AppState({
    this.isLoading,
    this.authState
  });

  AppState copyWith({bool isLoading, AuthState authState}) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      authState: authState ?? this.authState
    );
  }

  static AppState fromJson(dynamic json) {
    return AppState(authState: json["authState"]);
  }

  dynamic toJson() {
    return {'authState': authState};
  }

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, authState: $authState}';
  }
}