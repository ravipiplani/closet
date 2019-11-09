import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final bool isRegistered;
  final String mobile;
  final String name;
  final DateTime dob;

  User({
    this.isRegistered,
    this.mobile,
    this.name,
    this.dob
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User{isRegistered: $isRegistered, mobile: $mobile, name: $name, dob: $dob}';
  }
}