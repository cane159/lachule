import 'package:json_annotation/json_annotation.dart';

part 'pushgear_response.g.dart';

@JsonSerializable()
class PushGearResponse extends Object {
  @JsonKey(name: 'unique_id')
  String? uniqueId;

  @JsonKey(name: 'account')
  String? account;

  @JsonKey(name: 'subscribe_topic')
  List<String>? subscribeTopic;

  @JsonKey(name: 'device')
  List<String>? device;

  @JsonKey(name: 'unread_count')
  int? unreadCount;

  @JsonKey(name: 'noti_enable')
  bool? notiEnable;

  PushGearResponse({
    this.uniqueId,
    this.account,
    this.subscribeTopic,
    this.device,
    this.unreadCount,
    this.notiEnable,
  });

  factory PushGearResponse.fromJson(Map<String, dynamic> json) =>
      _$PushGearResponseFromJson(json);

  get results => null;

  Map<String, dynamic> toJson() => _$PushGearResponseToJson(this);

  static PushGearResponse Function(Object?) get toObject =>
      (json) => PushGearResponse.fromJson(json as Map<String, dynamic>);
}
