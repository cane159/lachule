// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pushgear_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PushgearsHistory _$PushgearsHistoryFromJson(Map<String, dynamic> json) =>
    PushgearsHistory(
      count: json['count'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => PushgearsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PushgearsHistoryToJson(PushgearsHistory instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
