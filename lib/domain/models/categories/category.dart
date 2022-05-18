// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
class Category {
  Category({
    required this.name,
    this.businessUID,
  });

  final String? businessUID;
  final String? name;
  String? categoryRefId;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  factory Category.fromSnapshot(DocumentSnapshot snapshot) {
    final newTransaction =
        Category.fromJson(snapshot.data() as Map<String, dynamic>);
    newTransaction.categoryRefId = snapshot.reference.id;
    return newTransaction;
  }

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
