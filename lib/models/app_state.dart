import 'package:flutter/cupertino.dart';
import 'package:vastram/models/auth_state.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_state.g.dart';

@JsonSerializable()
@immutable
class AppState {
  final bool isLoading;
  final AuthState authState;

  AppState({
    this.isLoading,
    this.authState
  });

  AppState copyWith({bool isLoading, bool isNewUser, AuthState authState}) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      authState: authState ?? this.authState
    );
  }

  static AppState fromJson(dynamic json) => _$AppStateFromJson(json);

  Map<String, dynamic> toJson() => _$AppStateToJson(this);

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, authState: $authState}';
  }
}