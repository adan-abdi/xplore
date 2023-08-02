import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

/// flutter packages pub run build_runner build
part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {

  @HiveField(0, defaultValue: '')
  String? userId;

  @HiveField(1, defaultValue: '')
  final String? userName;

  @HiveField(2, defaultValue: '')
  String? userProfilePicUrl;

  @HiveField(3, defaultValue: '')
  final String? userEmail;

  @HiveField(4, defaultValue: '')
  String? userPhoneNumber;

  @HiveField(5, defaultValue: '')
  String? createdAt;

  UserModel(
      {this.userId,
      this.userName,
      this.userProfilePicUrl,
      this.userEmail,
      this.userPhoneNumber,
      this.createdAt});

  //  From Map
  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
      userId: map['userId'] ?? '',
      userName: map['userName'] ?? '',
      userProfilePicUrl: map['userProfilePicUrl'] ?? '',
      userEmail: map['userEmail'] ?? '',
      userPhoneNumber: map['userPhoneNumber'] ?? '',
      createdAt: map['createdAt'] ?? '');
}

extension UserModelExtensions on UserModel {
  //  To Map
  Map<String, dynamic> toMap() => {
        'userId': userId,
        'userName': userName,
        'userProfilePicUrl': userProfilePicUrl,
        'userEmail': userEmail,
        'userPhoneNumber': userPhoneNumber,
        'createdAt': createdAt
      };
}
