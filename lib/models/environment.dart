import 'package:json_annotation/json_annotation.dart';
part 'environment.g.dart';

@JsonSerializable()
class Environment extends Object {
  @JsonKey(name: 'BASE_URL')
  String baseUrl;

  Environment({
    this.baseUrl = '',
  });

  factory Environment.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentFromJson(json);

  Map<String, dynamic> toJson() => _$EnvironmentToJson(this);

  static Environment Function(Object?) get toObject =>
      (json) => Environment.fromJson(json as Map<String, dynamic>);
}
