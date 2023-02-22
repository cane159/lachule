import 'package:json_annotation/json_annotation.dart';

part 'payment_token.g.dart';

@JsonSerializable()
class PaymentToken extends Object {
  @JsonKey(name: 'paymentToken')
  String? paymentToken;

  @JsonKey(name: 'respCode')
  String? respCode;

  @JsonKey(name: 'respDesc')
  List<String>? respDesc;

  PaymentToken({
    this.paymentToken,
    this.respCode,
    this.respDesc,
  });

  factory PaymentToken.fromJson(Map<String, dynamic> json) =>
      _$PaymentTokenFromJson(json);

  get results => null;

  Map<String, dynamic> toJson() => _$PaymentTokenToJson(this);

  static PaymentToken Function(Object?) get toObject =>
      (json) => PaymentToken.fromJson(json as Map<String, dynamic>);
}
