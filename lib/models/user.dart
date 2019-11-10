import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final bool isRegistered;
  final String mobile;
  final String name;
  final DateTime dob;

  User({
    this.isRegistered = false,
    this.mobile,
    this.name,
    this.dob
  });

  User copyWith({bool isRegistered, String mobile, String name, DateTime dob}) {
    return User(
      isRegistered: isRegistered ?? this.isRegistered,
      mobile: mobile ?? this.mobile,
      name: name ?? this.name,
      dob: dob ?? this.dob,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{isRegistered: $isRegistered, mobile: $mobile, name: $name, dob: $dob}';
  }
}