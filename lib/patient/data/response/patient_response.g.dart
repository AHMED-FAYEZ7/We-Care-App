// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllDoctorsResponse _$AllDoctorsResponseFromJson(Map<String, dynamic> json) =>
    AllDoctorsResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['results'] as int?,
      (json['doctors'] as List<dynamic>?)
          ?.map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['doc'] as List<dynamic>?)
          ?.map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllDoctorsResponseToJson(AllDoctorsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'results': instance.results,
      'doctors': instance.allDoctors,
      'doc': instance.doctorsSearchData,
    };

TopDoctorsResponse _$TopDoctorsResponseFromJson(Map<String, dynamic> json) =>
    TopDoctorsResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['results'] as int?,
      (json['doctors'] as List<dynamic>?)
          ?.map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['doc'] as List<dynamic>?)
          ?.map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopDoctorsResponseToJson(TopDoctorsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'results': instance.results,
      'doctors': instance.allDoctors,
      'doc': instance.doctorsSearchData,
    };

DoctorByIdResponse _$DoctorByIdResponseFromJson(Map<String, dynamic> json) =>
    DoctorByIdResponse(
      json['doctor'] == null
          ? null
          : UserResponse.fromJson(json['doctor'] as Map<String, dynamic>),
      json['message'] as String?,
      json['status'] as String?,
      json['token'] as String?,
    );

Map<String, dynamic> _$DoctorByIdResponseToJson(DoctorByIdResponse instance) =>
    <String, dynamic>{
      'doctor': instance.user,
      'message': instance.message,
      'status': instance.status,
      'token': instance.token,
    };

DoctorsSpecializationResponse _$DoctorsSpecializationResponseFromJson(
        Map<String, dynamic> json) =>
    DoctorsSpecializationResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['doctorsNum'] as int?,
      json['results'] as int?,
      (json['doctors'] as List<dynamic>?)
          ?.map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorsSpecializationResponseToJson(
        DoctorsSpecializationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'doctorsNum': instance.doctorsNum,
      'results': instance.results,
      'doctors': instance.doctorsData,
    };
