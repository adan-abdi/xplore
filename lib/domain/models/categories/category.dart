// Package imports:
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable(explicitToJson: true)
class Category {
  Category({
    required this.businessUID,
    required this.name,
    required this.referenceId,
  });

  final String? businessUID;
  final String? name;
  String? referenceId;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  factory Category.fromSnapshot(DocumentSnapshot snapshot) {
    final newProduct =
        Category.fromJson(snapshot.data() as Map<String, dynamic>);
    newProduct.referenceId = snapshot.reference.id;
    return newProduct;
  }

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
