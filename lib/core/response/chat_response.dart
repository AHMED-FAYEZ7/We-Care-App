import 'package:health_care/core/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'chat_response.g.dart';

@JsonSerializable()
class ChatResponse {
  @JsonKey(name: "_id")
  String? conversationId;
  @JsonKey(name: "members")
  List<String>? membersList;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;
  @JsonKey(name: "__v")
  int? v;

  ChatResponse(
    this.conversationId,
    this.membersList,
    this.createdAt,
    this.updatedAt,
    this.v,
  );

  // from json
  factory ChatResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ChatResponseToJson(this);
}

@JsonSerializable()
class ChatInfoResponse extends BaseResponse {
  @JsonKey(name: "chat")
  ChatResponse? chatInfoResponse;

  // from json
  factory ChatInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$ChatInfoResponseFromJson(json);

  // to json
  Map<String, dynamic> toJson() => _$ChatInfoResponseToJson(this);
  ChatInfoResponse(
    super.status,
    super.message,
    this.chatInfoResponse,
  );
}
