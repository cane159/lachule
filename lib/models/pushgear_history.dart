import 'package:json_annotation/json_annotation.dart';
import 'package:lachule/models/pushgear_data.dart';

part 'pushgear_history.g.dart';

@JsonSerializable()
class PushgearsHistory extends Object {
  @JsonKey(name: 'count')
  int? count;
  @JsonKey(name: 'next')
  String? next;
  @JsonKey(name: 'previous')
  String? previous;
  @JsonKey(name: 'results')
  List<PushgearsData>? results;

  PushgearsHistory({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PushgearsHistory.fromJson(Map<String, dynamic> json) =>
      _$PushgearsHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$PushgearsHistoryToJson(this);

  static PushgearsHistory Function(Object?) get toObject =>
      (json) => PushgearsHistory.fromJson(json as Map<String, dynamic>);

  pushgearGetHistory() {}
}
