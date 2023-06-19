// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientAuthResponse _$PatientAuthResponseFromJson(Map<String, dynamic> json) =>
    PatientAuthResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['token'] as String?,
      json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PatientAuthResponseToJson(
        PatientAuthResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };
