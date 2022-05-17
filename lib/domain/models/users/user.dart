// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class ShamiriUser {
  ShamiriUser({required this.uid, required this.name, required this.phoneNumber, this.email = 'shamiri.unknown@.com'});
  final String? uid;
  final String? name;
  final String? phoneNumber;
  final String? email;

  factory ShamiriUser.fromJson(Map<String, dynamic> json) => _$ShamiriUserFromJson(json);

  Map<String, dynamic> toJson() => _$ShamiriUserToJson(this);
}