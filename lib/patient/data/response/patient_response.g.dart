// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorInfResponse _$DoctorInfResponseFromJson(Map<String, dynamic> json) =>
    DoctorInfResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['results'] as int?,
      json['doctorsNum'] as int?,
      (json['allDoctors'] as List<dynamic>?)
          ?.map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['searchedDoctors'] as List<dynamic>?)
          ?.map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['topDoctors'] as List<dynamic>?)
          ?.map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['specializedDoctors'] as List<dynamic>?)
          ?.map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorInfResponseToJson(DoctorInfResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'results': instance.resultsResponse,
      'doctorsNum': instance.doctorsNumResponse,
      'allDoctors': instance.allDoctorsResponse,
      'searchedDoctors': instance.doctorsSearchDataResponse,
      'topDoctors': instance.topDoctorsDataResponse,
      'specializedDoctors': instance.specializedDoctorsDataResponse,
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
