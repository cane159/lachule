// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pushgear_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushGearResponse _$PushGearResponseFromJson(Map<String, dynamic> json) =>
    PushGearResponse(
      uniqueId: json['unique_id'] as String?,
      account: json['account'] as String?,
      subscribeTopic: (json['subscribe_topic'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      device:
          (json['device'] as List<dynamic>?)?.map((e) => e as String).toList(),
      unreadCount: json['unread_count'] as int?,
      notiEnable: json['noti_enable'] as bool?,
    );

Map<String, dynamic> _$PushGearResponseToJson(PushGearResponse instance) =>
    <String, dynamic>{
      'unique_id': instance.uniqueId,
      'account': instance.account,
      'subscribe_topic': instance.subscribeTopic,
      'device': instance.device,
      'unread_count': instance.unreadCount,
      'noti_enable': instance.notiEnable,
    };
