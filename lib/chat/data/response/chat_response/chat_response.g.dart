// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseChatResponse _$BaseChatResponseFromJson(Map<String, dynamic> json) =>
    BaseChatResponse(
      json['status'] as String?,
      json['chatId'] as String?,
    );

Map<String, dynamic> _$BaseChatResponseToJson(BaseChatResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'chatId': instance.roomId,
    };

ChatsResponse _$ChatsResponseFromJson(Map<String, dynamic> json) =>
    ChatsResponse(
      json['_id'] as String?,
      (json['members'] as List<dynamic>?)
          ?.map((e) => UserResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
      json['lastMSG'] as String?,
    );

Map<String, dynamic> _$ChatsResponseToJson(ChatsResponse instance) =>
    <String, dynamic>{
      '_id': instance.roomId,
      'members': instance.membersList,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'lastMSG': instance.lastMSG,
    };

ChatsInfoResponse _$ChatsInfoResponseFromJson(Map<String, dynamic> json) =>
    ChatsInfoResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['results'] as int?,
      (json['chats'] as List<dynamic>?)
          ?.map((e) => ChatsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatsInfoResponseToJson(ChatsInfoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'results': instance.results,
      'chats': instance.chatsInfoResponse,
    };

BaseMessageResponse _$BaseMessageResponseFromJson(Map<String, dynamic> json) =>
    BaseMessageResponse(
      json['chatId'] as String?,
      json['sender'] as String?,
      json['msg'] as String?,
      json['image'] == null
          ? null
          : ImageResponse.fromJson(json['image'] as Map<String, dynamic>),
      json['_id'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$BaseMessageResponseToJson(
        BaseMessageResponse instance) =>
    <String, dynamic>{
      'chatId': instance.roomId,
      'sender': instance.senderId,
      'msg': instance.messageContent,
      'image': instance.imageResponse,
      '_id': instance.messageId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    MessageResponse(
      json['message'] == null
          ? null
          : BaseMessageResponse.fromJson(
              json['message'] as Map<String, dynamic>),
      json['status'] as String?,
    );

Map<String, dynamic> _$MessageResponseToJson(MessageResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.messageData,
    };

AllMessagesResponse _$AllMessagesResponseFromJson(Map<String, dynamic> json) =>
    AllMessagesResponse(
      json['results'] as int?,
      (json['messages'] as List<dynamic>?)
          ?.map((e) => BaseMessageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['status'] as String?,
      json['message'] as String?,
    );

Map<String, dynamic> _$AllMessagesResponseToJson(
        AllMessagesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'results': instance.results,
      'messages': instance.allMessagesResponse,
    };
