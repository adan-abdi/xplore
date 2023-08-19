import 'package:json_annotation/json_annotation.dart';
import 'package:shamiri/features/feature_merchant_store/domain/model/product_model.dart';

/// flutter packages pub run build_runner build
part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  @JsonKey(name: 'buyerId')
  String? buyerId;

  @JsonKey(name: 'product')
  ProductModel? product;

  @JsonKey(name: 'itemsBought')
  int? itemsBought;

  @JsonKey(name: 'amountPaid')
  int? amountPaid;

  @JsonKey(name: 'transactionDate')
  String? transactionDate;

  @JsonKey(name: 'isFulfilled')
  bool? isFulfilled;

  @JsonKey(name: 'transactionType')
  String? transactionType;

  @JsonKey(name: 'transactionPaymentMethod')
  String? transactionPaymentMethod;

  TransactionModel(
      {this.buyerId,
      this.product,
      this.itemsBought,
      this.amountPaid,
      this.transactionDate,
      this.isFulfilled,
      this.transactionType,
      this.transactionPaymentMethod});

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}
