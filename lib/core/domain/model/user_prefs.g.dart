// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_prefs.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserPrefsAdapter extends TypeAdapter<UserPrefs> {
  @override
  final int typeId = 0;

  @override
  UserPrefs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserPrefs(
      isLoggedIn: fields[0] == null ? false : fields[0] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, UserPrefs obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isLoggedIn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserPrefsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
