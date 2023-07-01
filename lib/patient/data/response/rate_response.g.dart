// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateResponse _$RateResponseFromJson(Map<String, dynamic> json) => RateResponse(
      json['_id'] as String?,
      json['rating'] as int?,
      json['comment'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
      json['patient'] == null
          ? null
          : UserResponse.fromJson(json['patient'] as Map<String, dynamic>),
      json['doctor'] == null
          ? null
          : UserResponse.fromJson(json['doctor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RateResponseToJson(RateResponse instance) =>
    <String, dynamic>{
      '_id': instance.reviewId,
      'rating': instance.rating,
      'comment': instance.comment,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'patient': instance.patient,
      'doctor': instance.doctor,
    };

RateInfoResponse _$RateInfoResponseFromJson(Map<String, dynamic> json) =>
    RateInfoResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['reviewsNum'] as int?,
      json['results'] as int?,
      (json['reviews'] as List<dynamic>?)
          ?.map((e) => RateResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RateInfoResponseToJson(RateInfoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'reviewsNum': instance.reviewsNum,
      'results': instance.results,
      'reviews': instance.reviews,
    };
