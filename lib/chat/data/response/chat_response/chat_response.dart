import 'package:json_annotation/json_annotation.dart';

import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:health_care/core/response/base_response.dart';
import 'package:health_care/doctor/data/response/blog/blog_response.dart';

part 'chat_response.g.dart';

@JsonSerializable()
class BaseChatResponse {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "chatId")
  String? roomId;
  BaseChatResponse(
    this.status,
    this.roomId,
  );

  factory BaseChatResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseChatResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$BaseChatResponseToJson(this);
}

@JsonSerializable()
class ChatsResponse {
  @JsonKey(name: "_id")
  String? roomId;
  @JsonKey(name: "members")
  List<UserResponse>? membersList;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "__v")
  int? v;
  @JsonKey(name: "lastMSG")
  String? lastMSG;

  ChatsResponse(
    this.roomId,
    this.membersList,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.lastMSG,
  );

  // from json
  factory ChatsResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatsResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ChatsResponseToJson(this);
}

@JsonSerializable()
class ChatsInfoResponse extends BaseResponse {
  @JsonKey(name: "results")
  int? results;

  @JsonKey(name: "chats")
  List<ChatsResponse>? chatsInfoResponse;

  // from json
  factory ChatsInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatsInfoResponseFromJson(json);

  // to json
  @override
  Map<String, dynamic> toJson() => _$ChatsInfoResponseToJson(this);

  ChatsInfoResponse(
    super.status,
    super.message,
    this.results,
    this.chatsInfoResponse,
  );
}

@JsonSerializable()
class BaseMessageResponse {
  @JsonKey(name: "chatId")
  String? roomId;

  @JsonKey(name: "sender")
  String? senderId;

  @JsonKey(name: "msg")
  String? messageContent;

  @JsonKey(name: "image")
  ImageResponse? imageResponse;

  @JsonKey(name: "_id")
  String? messageId;

  @JsonKey(name: "createdAt")
  String? createdAt;

  @JsonKey(name: "updatedAt")
  String? updatedAt;

  @JsonKey(name: "__v")
  int? v;

  BaseMessageResponse(
    this.roomId,
    this.senderId,
    this.messageContent,
    this.imageResponse,
    this.messageId,
    this.createdAt,
    this.updatedAt,
    this.v,
  );
  factory BaseMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseMessageResponseToJson(this);
}

@JsonSerializable()
class MessageResponse {
  @JsonKey(name: "status")
  String? status;

  @JsonKey(name: "message")
  BaseMessageResponse? messageData;

  MessageResponse(this.messageData, this.status);

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);
}

@JsonSerializable()
class AllMessagesResponse extends BaseResponse {
  @JsonKey(name: "results")
  int? results;
  @JsonKey(name: "messages")
  List<BaseMessageResponse>? allMessagesResponse;

  AllMessagesResponse(
    this.results,
    this.allMessagesResponse,
    super.status,
    super.message,
  );

  factory AllMessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$AllMessagesResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AllMessagesResponseToJson(this);
}
