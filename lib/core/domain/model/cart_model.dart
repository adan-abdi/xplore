import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

// flutter packages pub run build_runner build
part 'cart_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 2)
class CartModel {
  @JsonKey(name: 'cartProductId')
  @HiveField(0)
  final String? cartProductId;

  @JsonKey(name: 'cartProductCount')
  @HiveField(1)
  int? cartProductCount;

  @JsonKey(name: 'cartProductTotal')
  @HiveField(2)
  int? cartProductTotal;

  CartModel(
      {required this.cartProductId,
      required this.cartProductCount,
      required this.cartProductTotal});

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
