import 'package:json_annotation/json_annotation.dart';

///  flutter packages pub run build_runner build
part 'variation_model.g.dart';

@JsonSerializable()
class VariationModel {
  @JsonKey(name: 'variationName')
  final String? variationName;

  @JsonKey(name: 'variationPrice')
  final String? variationPrice;

  @JsonKey(name: 'variationGroup')
  final String? variationGroup;

  VariationModel(
      {this.variationName, this.variationPrice, this.variationGroup});

  factory VariationModel.fromJson(Map<String, dynamic> json) =>
      _$VariationModelFromJson(json);

  Map<String, dynamic> toJson() => _$VariationModelToJson(this);
}
