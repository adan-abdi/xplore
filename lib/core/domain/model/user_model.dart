import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? userId;
  final String? userName;
  final String? userProfilePicUrl;
  final String? userEmail;
  final String? userPhoneNumber;
  final Timestamp? createdAt;

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
        'userProfilePicUr': userProfilePicUrl,
        'userEmail': userEmail,
        'userPhoneNumber': userPhoneNumber,
        'createdAt': createdAt
      };
}
