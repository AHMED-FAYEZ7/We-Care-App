// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorUserResponse _$DoctorUserResponseFromJson(Map<String, dynamic> json) =>
    DoctorUserResponse(
      json['specialization'] as String?,
      json['fees'] as int?,
      json['timePerPatient'] as int?,
      (json['timeTable'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['patients'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['appointments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      (json['averageRating'] as num?)?.toDouble(),
      json['status'] as String?,
      json['_id'] as String?,
      json['name'] as String?,
      json['email'] as String?,
      json['confirmed'] as bool?,
      json['active'] as bool?,
      json['__t'] as String?,
      json['username'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$DoctorUserResponseToJson(DoctorUserResponse instance) =>
    <String, dynamic>{
      'specialization': instance.specialization,
      'fees': instance.fees,
      'timePerPatient': instance.timePerPatient,
      'timeTable': instance.timeTable,
      'patients': instance.patients,
      'appointments': instance.appointments,
      'averageRating': instance.averageRating,
      'status': instance.status,
      '_id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'confirmed': instance.confirmed,
      'active': instance.active,
      '__t': instance.type,
      'username': instance.userName,
      '__v': instance.v,
    };

DoctorDataResponse _$DoctorDataResponseFromJson(Map<String, dynamic> json) =>
    DoctorDataResponse(
      json['user'] == null
          ? null
          : DoctorUserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DoctorDataResponseToJson(DoctorDataResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
    };

DoctorAuthResponse _$DoctorAuthResponseFromJson(Map<String, dynamic> json) =>
    DoctorAuthResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['token'] as String?,
      json['data'] == null
          ? null
          : DoctorDataResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DoctorAuthResponseToJson(DoctorAuthResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
      'data': instance.data,
    };
