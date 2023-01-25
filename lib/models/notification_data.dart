import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_data.g.dart';

@JsonSerializable()
class NotificationData extends Object {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'user')
  String? user;
  @JsonKey(name: 'requester')
  String? requester;
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'body')
  String? body;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'push_request')
  String? pushRequest;
  @JsonKey(name: 'create_date')
  String? createDate;
  @JsonKey(name: 'readed')
  bool? readed;

  NotificationData({
    this.id,
    this.user,
    this.requester,
    this.title,
    this.body,
    this.type,
    this.pushRequest,
    this.createDate,
    this.readed,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) =>
      _$NotificationDataFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDataToJson(this);

  static NotificationData Function(Object?) get toObject =>
      (json) => NotificationData.fromJson(json as Map<String, dynamic>);
}
