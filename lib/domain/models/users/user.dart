// Package imports:
import 'package:cloud_firestore_odm/annotation.dart';
import 'package:shamiri/domain/models/users/email_validator.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class ShamiriUser {
  ShamiriUser({required this.uid, required this.name, required this.phoneNumber, this.email = '@.com'}) {
    _$assertShamiriUser(this);
  }

  final String uid;
  final String name;
  final String phoneNumber;

  @EmailAddressValidator()
  final String email;

  factory ShamiriUser.fromJson(Map<String, dynamic> json) => _$ShamiriUserFromJson(json);

  Map<String, dynamic> toJson() => _$ShamiriUserToJson(this);
}

@Collection<ShamiriUser>('users')
final usersRef = ShamiriUserCollectionReference();
