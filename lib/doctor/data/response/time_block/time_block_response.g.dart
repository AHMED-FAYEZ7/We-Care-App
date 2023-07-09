// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_block_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeBlockResponse _$TimeBlockResponseFromJson(Map<String, dynamic> json) =>
    TimeBlockResponse(
      json['period'] as int?,
      json['startTime'] as String?,
      json['type'] as String?,
      json['_id'] as String?,
      json['doctor'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$TimeBlockResponseToJson(TimeBlockResponse instance) =>
    <String, dynamic>{
      'period': instance.period,
      'startTime': instance.startTime,
      'type': instance.type,
      '_id': instance.timeBlockId,
      'doctor': instance.doctorId,
      '__v': instance.v,
    };
