// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DashboardState _$DashboardStateFromJson(Map<String, dynamic> json) {
  return _DashboardState.fromJson(json);
}

/// @nodoc
mixin _$DashboardState {
  int? get activeTransactionTab => throw _privateConstructorUsedError;
  int? get activeOrderTab => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DashboardStateCopyWith<DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardStateCopyWith<$Res> {
  factory $DashboardStateCopyWith(
          DashboardState value, $Res Function(DashboardState) then) =
      _$DashboardStateCopyWithImpl<$Res, DashboardState>;
  @useResult
  $Res call({int? activeTransactionTab, int? activeOrderTab});
}

/// @nodoc
class _$DashboardStateCopyWithImpl<$Res, $Val extends DashboardState>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeTransactionTab = freezed,
    Object? activeOrderTab = freezed,
  }) {
    return _then(_value.copyWith(
      activeTransactionTab: freezed == activeTransactionTab
          ? _value.activeTransactionTab
          : activeTransactionTab // ignore: cast_nullable_to_non_nullable
              as int?,
      activeOrderTab: freezed == activeOrderTab
          ? _value.activeOrderTab
          : activeOrderTab // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DashboardStateCopyWith<$Res>
    implements $DashboardStateCopyWith<$Res> {
  factory _$$_DashboardStateCopyWith(
          _$_DashboardState value, $Res Function(_$_DashboardState) then) =
      __$$_DashboardStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? activeTransactionTab, int? activeOrderTab});
}

/// @nodoc
class __$$_DashboardStateCopyWithImpl<$Res>
    extends _$DashboardStateCopyWithImpl<$Res, _$_DashboardState>
    implements _$$_DashboardStateCopyWith<$Res> {
  __$$_DashboardStateCopyWithImpl(
      _$_DashboardState _value, $Res Function(_$_DashboardState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeTransactionTab = freezed,
    Object? activeOrderTab = freezed,
  }) {
    return _then(_$_DashboardState(
      activeTransactionTab: freezed == activeTransactionTab
          ? _value.activeTransactionTab
          : activeTransactionTab // ignore: cast_nullable_to_non_nullable
              as int?,
      activeOrderTab: freezed == activeOrderTab
          ? _value.activeOrderTab
          : activeOrderTab // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DashboardState implements _DashboardState {
  _$_DashboardState({this.activeTransactionTab, this.activeOrderTab});

  factory _$_DashboardState.fromJson(Map<String, dynamic> json) =>
      _$$_DashboardStateFromJson(json);

  @override
  final int? activeTransactionTab;
  @override
  final int? activeOrderTab;

  @override
  String toString() {
    return 'DashboardState(activeTransactionTab: $activeTransactionTab, activeOrderTab: $activeOrderTab)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DashboardState &&
            (identical(other.activeTransactionTab, activeTransactionTab) ||
                other.activeTransactionTab == activeTransactionTab) &&
            (identical(other.activeOrderTab, activeOrderTab) ||
                other.activeOrderTab == activeOrderTab));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, activeTransactionTab, activeOrderTab);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DashboardStateCopyWith<_$_DashboardState> get copyWith =>
      __$$_DashboardStateCopyWithImpl<_$_DashboardState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DashboardStateToJson(
      this,
    );
  }
}

abstract class _DashboardState implements DashboardState {
  factory _DashboardState(
      {final int? activeTransactionTab,
      final int? activeOrderTab}) = _$_DashboardState;

  factory _DashboardState.fromJson(Map<String, dynamic> json) =
      _$_DashboardState.fromJson;

  @override
  int? get activeTransactionTab;
  @override
  int? get activeOrderTab;
  @override
  @JsonKey(ignore: true)
  _$$_DashboardStateCopyWith<_$_DashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}
