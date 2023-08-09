import 'package:json_annotation/json_annotation.dart';

/// flutter packages pub run build_runner build
part 'transaction_model.g.dart';

@JsonSerializable()
class TransactionModel {

  @JsonKey(name: 'buyerId')
  String? buyerId;

  @JsonKey(name: 'productId')
  String? productId;

  @JsonKey(name: 'transactionDate')
  String? transactionDate;

  @JsonKey(name: 'isFulfilled')
  bool? isFulfilled;

  TransactionModel({this.buyerId, this.productId, this.transactionDate, this.isFulfilled});

  factory TransactionModel.fromJson(Map<String, dynamic> json) =>
      _$TransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionModelToJson(this);
}