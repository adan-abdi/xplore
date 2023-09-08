// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VariationModel _$VariationModelFromJson(Map<String, dynamic> json) =>
    VariationModel(
      variationName: json['variationName'] as String?,
      variationPrice: json['variationPrice'] as int?,
      variationGroup: json['variationGroup'] as String?,
    )..variationAffectsPrice = json['variationAffectsPrice'] as bool?;

Map<String, dynamic> _$VariationModelToJson(VariationModel instance) =>
    <String, dynamic>{
      'variationName': instance.variationName,
      'variationPrice': instance.variationPrice,
      'variationGroup': instance.variationGroup,
      'variationAffectsPrice': instance.variationAffectsPrice,
    };
