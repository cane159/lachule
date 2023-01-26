// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationData _$NotificationDataFromJson(Map<String, dynamic> json) =>
    NotificationData(
      id: json['id'] as int?,
      user: json['user'] as String?,
      requester: json['requester'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      type: json['type'] as String?,
      pushRequest: json['push_request'] as String?,
      createDate: json['create_date'] as String?,
      readed: json['readed'] as bool?,
    );

Map<String, dynamic> _$NotificationDataToJson(NotificationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'requester': instance.requester,
      'title': instance.title,
      'body': instance.body,
      'type': instance.type,
      'push_request': instance.pushRequest,
      'create_date': instance.createDate,
      'readed': instance.readed,
    };
