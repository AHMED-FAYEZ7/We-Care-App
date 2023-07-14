// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseSessionResponse _$BaseSessionResponseFromJson(Map<String, dynamic> json) =>
    BaseSessionResponse(
      json['id'] as String?,
      json['object'] as String?,
      json['amount_subtotal'] as int?,
      json['amount_total'] as int?,
      json['cancel_url'] as String?,
      json['success_url'] as String?,
      json['client_reference_id'] as String?,
      json['customer_email'] as String?,
      json['currency'] as String?,
      json['url'] as String?,
    );

Map<String, dynamic> _$BaseSessionResponseToJson(
        BaseSessionResponse instance) =>
    <String, dynamic>{
      'id': instance.sessionId,
      'object': instance.objectType,
      'amount_subtotal': instance.subtotalAmount,
      'amount_total': instance.totalAmount,
      'cancel_url': instance.cancelUrl,
      'success_url': instance.successUrl,
      'client_reference_id': instance.clientReferenceId,
      'customer_email': instance.customerEmail,
      'currency': instance.currencyType,
      'url': instance.stripeUrl,
    };

SessionResponse _$SessionResponseFromJson(Map<String, dynamic> json) =>
    SessionResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['session'] == null
          ? null
          : BaseSessionResponse.fromJson(
              json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionResponseToJson(SessionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'session': instance.sessionResponse,
    };
