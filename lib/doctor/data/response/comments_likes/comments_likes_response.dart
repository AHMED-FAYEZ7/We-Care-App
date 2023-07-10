import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:health_care/core/response/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comments_likes_response.g.dart';

@JsonSerializable()
class BaseCommentResponse {
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
class CommentResponse extends BaseCommentResponse {
  @JsonKey(name: "user")
  String? userId;
  CommentResponse(
    this.userId,
    super.blogId,
    super.commentContent,
    super.commentId,
    super.createdAt,
    super.updatedAt,
    super.v,
  );

  factory CommentResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CommentResponseToJson(this);
}

@JsonSerializable()
class CommentsResponse extends BaseCommentResponse {
  @JsonKey(name: "user")
  UserResponse? userInfo;
  CommentsResponse(
    this.userInfo,
    super.blogId,
    super.commentContent,
    super.commentId,
    super.createdAt,
    super.updatedAt,
    super.v,
  );

  factory CommentsResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentsResponseFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$CommentsResponseToJson(this);
}

@JsonSerializable()
class CommentInfoResponse extends BaseResponse {
  @JsonKey(name: "Comment")
  CommentResponse? commentResponse;

  @JsonKey(name: "Comments")
  List<CommentsResponse>? blogCommentsResponse;

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
