// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:health_care/core/response/base_response.dart';

part 'payment_response.g.dart';

@JsonSerializable()
class BaseSessionResponse {
  @JsonKey(name: "id")
  String? sessionId;

  @JsonKey(name: "object")
  String? objectType;

  @JsonKey(name: "amount_subtotal")
  int? subtotalAmount;

  @JsonKey(name: "amount_total")
  int? totalAmount;

  @JsonKey(name: "cancel_url")
  String? cancelUrl;

  @JsonKey(name: "success_url")
  String? successUrl;

  @JsonKey(name: "client_reference_id")
  String? clientReferenceId;

  @JsonKey(name: "customer_email")
  String? customerEmail;

  @JsonKey(name: "currency")
  String? currencyType;

  @JsonKey(name: "url")
  String? stripeUrl;

  BaseSessionResponse(
    this.sessionId,
    this.objectType,
    this.subtotalAmount,
    this.totalAmount,
    this.cancelUrl,
    this.successUrl,
    this.clientReferenceId,
    this.customerEmail,
    this.currencyType,
    this.stripeUrl,
  );

  factory BaseSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseSessionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseSessionResponseToJson(this);
}

@JsonSerializable()
class SessionResponse extends BaseResponse {
  @JsonKey(name: "session")
  BaseSessionResponse? sessionResponse;

  SessionResponse(
    super.status,
    super.message,
    this.sessionResponse,
  );

  factory SessionResponse.fromJson(Map<String, dynamic> json) {
    return _$SessionResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$SessionResponseToJson(this);
}
