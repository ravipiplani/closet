import 'package:json_annotation/json_annotation.dart';

part 'color.g.dart';

@JsonSerializable()
class Color {
  final String name;
  final String value;

  Color({
    this.name,
    this.value
  });

  Color copyWith({String name, String value}) {
    return Color(
      name: name ?? this.name,
      value: value ?? this.value
    );
  }

  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);

  Map<String, dynamic> toJson() => _$ColorToJson(this);

  @override
  String toString() {
    return 'Color{name: $name, value: $value}';
  }

  bool operator ==(c) => c is Color && c.name == name && c.value == value;

  int get hashCode => name.hashCode + value.hashCode;
}