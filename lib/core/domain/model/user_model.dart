import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'cart_model.dart';

/// flutter packages pub run build_runner build
part 'user_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 1)
class UserModel {

  @JsonKey(name: 'userId')
  @HiveField(0, defaultValue: '')
  String? userId;

  @JsonKey(name: 'userName')
  @HiveField(1, defaultValue: '')
  final String? userName;

  @JsonKey(name: 'userProfilePicUrl')
  @HiveField(2, defaultValue: '')
  String? userProfilePicUrl;

  @JsonKey(name: 'userEmail')
  @HiveField(3, defaultValue: '')
  final String? userEmail;

  @JsonKey(name: 'userPhoneNumber')
  @HiveField(4, defaultValue: '')
  String? userPhoneNumber;

  @JsonKey(name: 'createdAt')
  @HiveField(5, defaultValue: '')
  String? createdAt;

  @JsonKey(name: 'storeLocation')
  @HiveField(6, defaultValue: '')
  String? storeLocation;

  @JsonKey(name: 'itemsInCart')
  @HiveField(7, defaultValue: [])
  List<CartModel>? itemsInCart;

  UserModel(
      {this.userId,
      this.userName,
      this.userProfilePicUrl,
      this.userEmail,
      this.userPhoneNumber,
      this.createdAt,
      this.storeLocation,
      this.itemsInCart});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
