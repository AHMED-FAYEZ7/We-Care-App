// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientUserResponse _$PatientUserResponseFromJson(Map<String, dynamic> json) =>
    PatientUserResponse(
      (json['appointments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['_id'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['confirmed'] as bool?,
      json['active'] as bool?,
      json['__t'] as String?,
      json['username'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$PatientUserResponseToJson(
        PatientUserResponse instance) =>
    <String, dynamic>{
      'appointments': instance.appointments,
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'confirmed': instance.confirmed,
      'active': instance.active,
      '__t': instance.type,
      'username': instance.userName,
      '__v': instance.v,
    };

PatientDataResponse _$PatientDataResponseFromJson(Map<String, dynamic> json) =>
    PatientDataResponse(
      json['user'] == null
          ? null
          : PatientUserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PatientDataResponseToJson(
        PatientDataResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

PatientAuthResponse _$PatientAuthResponseFromJson(Map<String, dynamic> json) =>
    PatientAuthResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['token'] as String?,
      json['data'] == null
          ? null
          : PatientDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PatientAuthResponseToJson(
        PatientAuthResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'data': instance.data,
    };
