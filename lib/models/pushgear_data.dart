import 'package:json_annotation/json_annotation.dart';

part 'pushgear_data.g.dart';

@JsonSerializable()
class PushgearsData extends Object {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'user')
  String? user;
  @JsonKey(name: 'create_dt')
  String? createDt;
  @JsonKey(name: 'raw_data')
  String? rawData;
  @JsonKey(name: 'push_result')
  String? pushResult;
  @JsonKey(name: 'readed')
  bool? readed;
  PushgearsData({
    this.id,
    this.user,
    this.createDt,
    this.rawData,
    this.pushResult,
    this.readed,
  });

  factory PushgearsData.fromJson(Map<String, dynamic> json) =>
      _$PushgearsDataFromJson(json);

  Map<String, dynamic> toJson() => _$PushgearsDataToJson(this);

  static PushgearsData Function(Object?) get toObject =>
      (json) => PushgearsData.fromJson(json as Map<String, dynamic>);
}
