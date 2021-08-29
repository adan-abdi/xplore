// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'core_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CoreState _$CoreStateFromJson(Map<String, dynamic> json) {
  return _CoreState.fromJson(json);
}

/// @nodoc
class _$CoreStateTearOff {
  const _$CoreStateTearOff();

  _CoreState call(
      {String? appInitialRoute,
      bool? init,
      bool? isActive,
      DateTime? activeSessionInitTime}) {
    return _CoreState(
      appInitialRoute: appInitialRoute,
      init: init,
      isActive: isActive,
      activeSessionInitTime: activeSessionInitTime,
    );
  }

  CoreState fromJson(Map<String, Object> json) {
    return CoreState.fromJson(json);
  }
}

/// @nodoc
const $CoreState = _$CoreStateTearOff();

/// @nodoc
mixin _$CoreState {
  String? get appInitialRoute => throw _privateConstructorUsedError;
  bool? get init => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  DateTime? get activeSessionInitTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CoreStateCopyWith<CoreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CoreStateCopyWith<$Res> {
  factory $CoreStateCopyWith(CoreState value, $Res Function(CoreState) then) =
      _$CoreStateCopyWithImpl<$Res>;
  $Res call(
      {String? appInitialRoute,
      bool? init,
      bool? isActive,
      DateTime? activeSessionInitTime});
}

/// @nodoc
class _$CoreStateCopyWithImpl<$Res> implements $CoreStateCopyWith<$Res> {
  _$CoreStateCopyWithImpl(this._value, this._then);

  final CoreState _value;
  // ignore: unused_field
  final $Res Function(CoreState) _then;

  @override
  $Res call({
    Object? appInitialRoute = freezed,
    Object? init = freezed,
    Object? isActive = freezed,
    Object? activeSessionInitTime = freezed,
  }) {
    return _then(_value.copyWith(
      appInitialRoute: appInitialRoute == freezed
          ? _value.appInitialRoute
          : appInitialRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      init: init == freezed
          ? _value.init
          : init // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      activeSessionInitTime: activeSessionInitTime == freezed
          ? _value.activeSessionInitTime
          : activeSessionInitTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$CoreStateCopyWith<$Res> implements $CoreStateCopyWith<$Res> {
  factory _$CoreStateCopyWith(
          _CoreState value, $Res Function(_CoreState) then) =
      __$CoreStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? appInitialRoute,
      bool? init,
      bool? isActive,
      DateTime? activeSessionInitTime});
}

/// @nodoc
class __$CoreStateCopyWithImpl<$Res> extends _$CoreStateCopyWithImpl<$Res>
    implements _$CoreStateCopyWith<$Res> {
  __$CoreStateCopyWithImpl(_CoreState _value, $Res Function(_CoreState) _then)
      : super(_value, (v) => _then(v as _CoreState));

  @override
  _CoreState get _value => super._value as _CoreState;

  @override
  $Res call({
    Object? appInitialRoute = freezed,
    Object? init = freezed,
    Object? isActive = freezed,
    Object? activeSessionInitTime = freezed,
  }) {
    return _then(_CoreState(
      appInitialRoute: appInitialRoute == freezed
          ? _value.appInitialRoute
          : appInitialRoute // ignore: cast_nullable_to_non_nullable
              as String?,
      init: init == freezed
          ? _value.init
          : init // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: isActive == freezed
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      activeSessionInitTime: activeSessionInitTime == freezed
          ? _value.activeSessionInitTime
          : activeSessionInitTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CoreState implements _CoreState {
  _$_CoreState(
      {this.appInitialRoute,
      this.init,
      this.isActive,
      this.activeSessionInitTime});

  factory _$_CoreState.fromJson(Map<String, dynamic> json) =>
      _$_$_CoreStateFromJson(json);

  @override
  final String? appInitialRoute;
  @override
  final bool? init;
  @override
  final bool? isActive;
  @override
  final DateTime? activeSessionInitTime;

  @override
  String toString() {
    return 'CoreState(appInitialRoute: $appInitialRoute, init: $init, isActive: $isActive, activeSessionInitTime: $activeSessionInitTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CoreState &&
            (identical(other.appInitialRoute, appInitialRoute) ||
                const DeepCollectionEquality()
                    .equals(other.appInitialRoute, appInitialRoute)) &&
            (identical(other.init, init) ||
                const DeepCollectionEquality().equals(other.init, init)) &&
            (identical(other.isActive, isActive) ||
                const DeepCollectionEquality()
                    .equals(other.isActive, isActive)) &&
            (identical(other.activeSessionInitTime, activeSessionInitTime) ||
                const DeepCollectionEquality().equals(
                    other.activeSessionInitTime, activeSessionInitTime)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(appInitialRoute) ^
      const DeepCollectionEquality().hash(init) ^
      const DeepCollectionEquality().hash(isActive) ^
      const DeepCollectionEquality().hash(activeSessionInitTime);

  @JsonKey(ignore: true)
  @override
  _$CoreStateCopyWith<_CoreState> get copyWith =>
      __$CoreStateCopyWithImpl<_CoreState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CoreStateToJson(this);
  }
}

abstract class _CoreState implements CoreState {
  factory _CoreState(
      {String? appInitialRoute,
      bool? init,
      bool? isActive,
      DateTime? activeSessionInitTime}) = _$_CoreState;

  factory _CoreState.fromJson(Map<String, dynamic> json) =
      _$_CoreState.fromJson;

  @override
  String? get appInitialRoute => throw _privateConstructorUsedError;
  @override
  bool? get init => throw _privateConstructorUsedError;
  @override
  bool? get isActive => throw _privateConstructorUsedError;
  @override
  DateTime? get activeSessionInitTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CoreStateCopyWith<_CoreState> get copyWith =>
      throw _privateConstructorUsedError;
}
