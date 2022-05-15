// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'shamiri_user.g.dart';

@JsonSerializable()
class ShamiriUser {
  @JsonKey(name: "uid")
  final String? uid;

  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;

  ShamiriUser(this.uid, this.phoneNumber);

  factory ShamiriUser.fromJson(Map<String, dynamic> json) => _$ShamiriUserFromJson(json);

  Map<String, dynamic> toJson() => _$ShamiriUserToJson(this);
}
