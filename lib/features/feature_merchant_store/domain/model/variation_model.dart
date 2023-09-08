import 'package:json_annotation/json_annotation.dart';

///  flutter packages pub run build_runner build
part 'variation_model.g.dart';

@JsonSerializable()
class VariationModel {
  @JsonKey(name: 'variationName')
  String? variationName;

  @JsonKey(name: 'variationPrice')
  int? variationPrice;

  @JsonKey(name: 'variationGroup')
  String? variationGroup;

  @JsonKey(name: 'variationAffectsPrice')
  bool? variationAffectsPrice;

  VariationModel(
      {this.variationName,
      this.variationPrice,
      this.variationGroup,
      this.variationAffectsPrice});

  factory VariationModel.fromJson(Map<String, dynamic> json) =>
      _$VariationModelFromJson(json);

  Map<String, dynamic> toJson() => _$VariationModelToJson(this);
}
