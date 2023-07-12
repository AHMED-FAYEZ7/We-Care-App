import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:health_care/core/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comments_likes_response.g.dart';

@JsonSerializable()
class BaseCommentResponse {
  @JsonKey(name: "user")
  UserResponse? userInfo;

  @JsonKey(name: "blog")
  String? blogId;

  @JsonKey(name: "content")
  String? commentContent;

  @JsonKey(name: "_id")
  String? commentId;

  @JsonKey(name: "createdAt")
  String? createdAt;

  @JsonKey(name: "updatedAt")
  String? updatedAt;

  @JsonKey(name: "__v")
  int? v;

  BaseCommentResponse(
    this.userInfo,
    this.blogId,
    this.commentContent,
    this.commentId,
    this.createdAt,
    this.updatedAt,
    this.v,
  );

  factory BaseCommentResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseCommentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseCommentResponseToJson(this);
}

@JsonSerializable()
class CommentInfoResponse extends BaseResponse {
  @JsonKey(name: "Comment")
  BaseCommentResponse? commentResponse;

  @JsonKey(name: "Comments")
  List<BaseCommentResponse>? blogCommentsResponse;

  CommentInfoResponse(
    super.status,
    super.message,
    this.commentResponse,
    this.blogCommentsResponse,
  );

  factory CommentInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentInfoResponseFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CommentInfoResponseToJson(this);
}

@JsonSerializable()
class AllLikesResponse extends BaseResponse {
  @JsonKey(name: "likes")
  List<BaseCommentResponse>? blogLikesResponse;

  AllLikesResponse(
    super.status,
    super.message,
    this.blogLikesResponse,
  );

  factory AllLikesResponse.fromJson(Map<String, dynamic> json) =>
      _$AllLikesResponseFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$AllLikesResponseToJson(this);
}
