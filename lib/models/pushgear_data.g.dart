// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pushgear_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushgearsData _$PushgearsDataFromJson(Map<String, dynamic> json) =>
    PushgearsData(
      id: json['id'] as int?,
      user: json['user'] as String?,
      createDt: json['create_dt'] as String?,
      rawData: json['raw_data'] as String?,
      pushResult: json['push_result'] as String?,
      readed: json['readed'] as bool?,
    );

Map<String, dynamic> _$PushgearsDataToJson(PushgearsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'create_dt': instance.createDt,
      'raw_data': instance.rawData,
      'push_result': instance.pushResult,
      'readed': instance.readed,
    };
