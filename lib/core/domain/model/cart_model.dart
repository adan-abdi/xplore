import 'package:json_annotation/json_annotation.dart';

// flutter packages pub run build_runner build
part 'cart_model.g.dart';

@JsonSerializable()
class CartModel {
  @JsonKey(name: 'cartProductId')
  final String? cartProductId;

  @JsonKey(name: 'cartProductCount')
  final int? cartProductCount;

  CartModel({required this.cartProductId, required this.cartProductCount});

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartModelToJson(this);
}
