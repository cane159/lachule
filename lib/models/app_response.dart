import 'package:json_annotation/json_annotation.dart';

part 'app_response.g.dart';

@JsonSerializable(
    genericArgumentFactories: true, fieldRename: FieldRename.snake)
class AppResponse<T> {
  @JsonKey(name: 'status')
  final bool? status;

  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'data')
  final T? data;

  AppResponse(
    this.status,
    this.message,
    this.data,
  );

  factory AppResponse.fromJsonT(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$AppResponseFromJson(json, fromJsonT);

  factory AppResponse.fromJson(Map<String, dynamic> json) =>
      _$AppResponseFromJson(json, (json) => null as T);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$AppResponseToJson(this, toJsonT);
}
