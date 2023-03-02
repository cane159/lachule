// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentToken _$PaymentTokenFromJson(Map<String, dynamic> json) => PaymentToken(
      paymentToken: json['paymentToken'] as String?,
      respCode: json['respCode'] as String?,
      respDesc: (json['respDesc'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PaymentTokenToJson(PaymentToken instance) =>
    <String, dynamic>{
      'paymentToken': instance.paymentToken,
      'respCode': instance.respCode,
      'respDesc': instance.respDesc,
    };
