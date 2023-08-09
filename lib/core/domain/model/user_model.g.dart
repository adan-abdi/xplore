// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      userId: fields[0] == null ? '' : fields[0] as String?,
      userName: fields[1] == null ? '' : fields[1] as String?,
      userProfilePicUrl: fields[2] == null ? '' : fields[2] as String?,
      userEmail: fields[3] == null ? '' : fields[3] as String?,
      userPhoneNumber: fields[4] == null ? '' : fields[4] as String?,
      createdAt: fields[5] == null ? '' : fields[5] as String?,
      storeLocation: fields[6] == null ? '' : fields[6] as String?,
      itemsInCart:
          fields[7] == null ? [] : (fields[7] as List?)?.cast<CartModel>(),
      transactions: fields[8] == null
          ? []
          : (fields[8] as List?)?.cast<TransactionModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.userName)
      ..writeByte(2)
      ..write(obj.userProfilePicUrl)
      ..writeByte(3)
      ..write(obj.userEmail)
      ..writeByte(4)
      ..write(obj.userPhoneNumber)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.storeLocation)
      ..writeByte(7)
      ..write(obj.itemsInCart)
      ..writeByte(8)
      ..write(obj.transactions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      userId: json['userId'] as String?,
      userName: json['userName'] as String?,
      userProfilePicUrl: json['userProfilePicUrl'] as String?,
      userEmail: json['userEmail'] as String?,
      userPhoneNumber: json['userPhoneNumber'] as String?,
      createdAt: json['createdAt'] as String?,
      storeLocation: json['storeLocation'] as String?,
      itemsInCart: (json['itemsInCart'] as List<dynamic>?)
          ?.map((e) => CartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => TransactionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'userProfilePicUrl': instance.userProfilePicUrl,
      'userEmail': instance.userEmail,
      'userPhoneNumber': instance.userPhoneNumber,
      'createdAt': instance.createdAt,
      'storeLocation': instance.storeLocation,
      'itemsInCart': instance.itemsInCart,
      'transactions': instance.transactions,
    };
