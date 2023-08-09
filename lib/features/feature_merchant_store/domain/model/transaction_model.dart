import 'package:json_annotation/json_annotation.dart';

/// flutter packages pub run build_runner build
part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {
  @JsonKey(name: 'buyerId')
  String? buyerId;

  @JsonKey(name: 'productId')
  String? productId;

  @JsonKey(name: 'itemsBought')
  int? itemsBought;

  @JsonKey(name: 'amountPaid')
  int? amountPaid;

  @JsonKey(name: 'transactionDate')
  String? transactionDate;

  @JsonKey(name: 'isFulfilled')
  bool? isFulfilled;

  TransactionModel(
      {this.buyerId,
      this.productId,
      this.itemsBought,
      this.amountPaid,
      this.transactionDate,
      this.isFulfilled});

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}
