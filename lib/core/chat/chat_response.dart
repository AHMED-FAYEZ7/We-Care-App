import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:health_care/core/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
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
  String? results;

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
