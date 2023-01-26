import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'raw_data_notification.g.dart';

@JsonSerializable()
class RawDataNotification extends Object {
  @JsonKey(name: 'title')
  String? title;
  @JsonKey(name: 'body')
  String? body;

  RawDataNotification({
    this.title,
    this.body,
  });

  factory RawDataNotification.fromJson(Map<String, dynamic> json) =>
      _$RawDataNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$RawDataNotificationToJson(this);

  static RawDataNotification Function(Object?) get toObject =>
      (json) => RawDataNotification.fromJson(json as Map<String, dynamic>);
}
