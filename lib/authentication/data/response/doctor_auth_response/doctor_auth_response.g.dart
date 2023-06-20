// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScheduleTimingResponse _$ScheduleTimingResponseFromJson(
        Map<String, dynamic> json) =>
    ScheduleTimingResponse(
      json['start'] as String?,
      json['end'] as String?,
      json['_id'] as String?,
    );

Map<String, dynamic> _$ScheduleTimingResponseToJson(
        ScheduleTimingResponse instance) =>
    <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
      '_id': instance.id,
    };

DoctorAuthResponse _$DoctorAuthResponseFromJson(Map<String, dynamic> json) =>
    DoctorAuthResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['token'] as String?,
      json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DoctorAuthResponseToJson(DoctorAuthResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };
