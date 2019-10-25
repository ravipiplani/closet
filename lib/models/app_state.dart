import 'package:flutter/cupertino.dart';

@immutable
class AppState {
  final bool isLoading;
  final bool isLoggedIn;

  AppState({
    this.isLoading = false,
    this.isLoggedIn = false,
  });

  AppState copyWith({bool isLoading, bool isLoggedIn}) {
    return AppState(
      isLoading: isLoading ?? this.isLoading,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }

  static AppState fromJson(dynamic json) {
    return AppState(isLoggedIn: json["isLoggedIn"]);
  }

  dynamic toJson() {
    return {'isLoggedIn': isLoggedIn};
  }

  @override
  String toString() {
    return 'AppState{isLoading: $isLoading, isLoggedIn: $isLoggedIn}';
  }
}