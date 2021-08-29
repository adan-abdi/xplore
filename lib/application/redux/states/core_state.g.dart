// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_CoreState _$_$_CoreStateFromJson(Map<String, dynamic> json) {
  return _$_CoreState(
    appInitialRoute: json['appInitialRoute'] as String?,
    init: json['init'] as bool?,
    isActive: json['isActive'] as bool?,
    activeSessionInitTime: json['activeSessionInitTime'] == null
        ? null
        : DateTime.parse(json['activeSessionInitTime'] as String),
  );
}

// ignore: non_constant_identifier_names
Map<String, dynamic> _$_$_CoreStateToJson(_$_CoreState instance) =>
    <String, dynamic>{
      'appInitialRoute': instance.appInitialRoute,
      'init': instance.init,
      'isActive': instance.isActive,
      'activeSessionInitTime':
          instance.activeSessionInitTime?.toIso8601String(),
    };
