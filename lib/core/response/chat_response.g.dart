// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) => ChatResponse(
      json['_id'] as String?,
      (json['members'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$ChatResponseToJson(ChatResponse instance) =>
    <String, dynamic>{
      '_id': instance.conversationId,
      'members': instance.membersList,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

ChatInfoResponse _$ChatInfoResponseFromJson(Map<String, dynamic> json) =>
    ChatInfoResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['chat'] == null
          ? null
          : ChatResponse.fromJson(json['chat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChatInfoResponseToJson(ChatInfoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'chat': instance.chatInfoResponse,
    };
