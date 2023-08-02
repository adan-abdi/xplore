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
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(6)
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
      ..write(obj.createdAt);
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
