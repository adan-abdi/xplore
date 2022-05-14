import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "uID")
  final String? uID;

  @JsonKey(name: "phoneNumber")
  final String? phoneNumber;

  @JsonKey(name: "referenceId")
  String? referenceId;

  User(this.uID, this.phoneNumber, this.referenceId);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
