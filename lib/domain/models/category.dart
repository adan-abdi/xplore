// Package imports:
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: "businessUID")
  String? businessUID;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "referenceId")
  String? referenceId;

  Category(this.businessUID, this.name, this.referenceId);

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
