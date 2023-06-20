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
    );

Map<String, dynamic> _$AllDoctorsResponseToJson(AllDoctorsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'results': instance.results,
      'doctors': instance.allDoctors,
    };
