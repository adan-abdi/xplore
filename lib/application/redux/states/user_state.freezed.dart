// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserState _$UserStateFromJson(Map<String, dynamic> json) {
  return _UserState.fromJson(json);
}

/// @nodoc
mixin _$UserState {
  String? get uid => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError; //local
  bool? get isSignedIn => throw _privateConstructorUsedError;
  bool? get hasDoneTour => throw _privateConstructorUsedError;
  String? get pinCodeVerificationID => throw _privateConstructorUsedError;
  DateTime? get isLastSessionActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res>;
  $Res call(
      {String? uid,
      String? name,
      String? phoneNumber,
      String? email,
      bool? isSignedIn,
      bool? hasDoneTour,
      String? pinCodeVerificationID,
      DateTime? isLastSessionActive});
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res> implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  final UserState _value;
  // ignore: unused_field
  final $Res Function(UserState) _then;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? isSignedIn = freezed,
    Object? hasDoneTour = freezed,
    Object? pinCodeVerificationID = freezed,
    Object? isLastSessionActive = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      isSignedIn: isSignedIn == freezed
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasDoneTour: hasDoneTour == freezed
          ? _value.hasDoneTour
          : hasDoneTour // ignore: cast_nullable_to_non_nullable
              as bool?,
      pinCodeVerificationID: pinCodeVerificationID == freezed
          ? _value.pinCodeVerificationID
          : pinCodeVerificationID // ignore: cast_nullable_to_non_nullable
              as String?,
      isLastSessionActive: isLastSessionActive == freezed
          ? _value.isLastSessionActive
          : isLastSessionActive // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_UserStateCopyWith<$Res> implements $UserStateCopyWith<$Res> {
  factory _$$_UserStateCopyWith(
          _$_UserState value, $Res Function(_$_UserState) then) =
      __$$_UserStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? uid,
      String? name,
      String? phoneNumber,
      String? email,
      bool? isSignedIn,
      bool? hasDoneTour,
      String? pinCodeVerificationID,
      DateTime? isLastSessionActive});
}

/// @nodoc
class __$$_UserStateCopyWithImpl<$Res> extends _$UserStateCopyWithImpl<$Res>
    implements _$$_UserStateCopyWith<$Res> {
  __$$_UserStateCopyWithImpl(
      _$_UserState _value, $Res Function(_$_UserState) _then)
      : super(_value, (v) => _then(v as _$_UserState));

  @override
  _$_UserState get _value => super._value as _$_UserState;

  @override
  $Res call({
    Object? uid = freezed,
    Object? name = freezed,
    Object? phoneNumber = freezed,
    Object? email = freezed,
    Object? isSignedIn = freezed,
    Object? hasDoneTour = freezed,
    Object? pinCodeVerificationID = freezed,
    Object? isLastSessionActive = freezed,
  }) {
    return _then(_$_UserState(
      uid: uid == freezed
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      isSignedIn: isSignedIn == freezed
          ? _value.isSignedIn
          : isSignedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasDoneTour: hasDoneTour == freezed
          ? _value.hasDoneTour
          : hasDoneTour // ignore: cast_nullable_to_non_nullable
              as bool?,
      pinCodeVerificationID: pinCodeVerificationID == freezed
          ? _value.pinCodeVerificationID
          : pinCodeVerificationID // ignore: cast_nullable_to_non_nullable
              as String?,
      isLastSessionActive: isLastSessionActive == freezed
          ? _value.isLastSessionActive
          : isLastSessionActive // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserState implements _UserState {
  _$_UserState(
      {this.uid,
      this.name,
      this.phoneNumber,
      this.email,
      this.isSignedIn,
      this.hasDoneTour,
      this.pinCodeVerificationID,
      this.isLastSessionActive});

  factory _$_UserState.fromJson(Map<String, dynamic> json) =>
      _$$_UserStateFromJson(json);

  @override
  final String? uid;
  @override
  final String? name;
  @override
  final String? phoneNumber;
  @override
  final String? email;
//local
  @override
  final bool? isSignedIn;
  @override
  final bool? hasDoneTour;
  @override
  final String? pinCodeVerificationID;
  @override
  final DateTime? isLastSessionActive;

  @override
  String toString() {
    return 'UserState(uid: $uid, name: $name, phoneNumber: $phoneNumber, email: $email, isSignedIn: $isSignedIn, hasDoneTour: $hasDoneTour, pinCodeVerificationID: $pinCodeVerificationID, isLastSessionActive: $isLastSessionActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserState &&
            const DeepCollectionEquality().equals(other.uid, uid) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.isSignedIn, isSignedIn) &&
            const DeepCollectionEquality()
                .equals(other.hasDoneTour, hasDoneTour) &&
            const DeepCollectionEquality()
                .equals(other.pinCodeVerificationID, pinCodeVerificationID) &&
            const DeepCollectionEquality()
                .equals(other.isLastSessionActive, isLastSessionActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(uid),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(isSignedIn),
      const DeepCollectionEquality().hash(hasDoneTour),
      const DeepCollectionEquality().hash(pinCodeVerificationID),
      const DeepCollectionEquality().hash(isLastSessionActive));

  @JsonKey(ignore: true)
  @override
  _$$_UserStateCopyWith<_$_UserState> get copyWith =>
      __$$_UserStateCopyWithImpl<_$_UserState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserStateToJson(this);
  }
}

abstract class _UserState implements UserState {
  factory _UserState(
      {final String? uid,
      final String? name,
      final String? phoneNumber,
      final String? email,
      final bool? isSignedIn,
      final bool? hasDoneTour,
      final String? pinCodeVerificationID,
      final DateTime? isLastSessionActive}) = _$_UserState;

  factory _UserState.fromJson(Map<String, dynamic> json) =
      _$_UserState.fromJson;

  @override
  String? get uid => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override //local
  bool? get isSignedIn => throw _privateConstructorUsedError;
  @override
  bool? get hasDoneTour => throw _privateConstructorUsedError;
  @override
  String? get pinCodeVerificationID => throw _privateConstructorUsedError;
  @override
  DateTime? get isLastSessionActive => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserStateCopyWith<_$_UserState> get copyWith =>
      throw _privateConstructorUsedError;
}
