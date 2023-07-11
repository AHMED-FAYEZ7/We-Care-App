// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_likes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseCommentResponse _$BaseCommentResponseFromJson(Map<String, dynamic> json) =>
    BaseCommentResponse(
      json['blog'] as String?,
      json['content'] as String?,
      json['_id'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$BaseCommentResponseToJson(
        BaseCommentResponse instance) =>
    <String, dynamic>{
      'blog': instance.blogId,
      'content': instance.commentContent,
      '_id': instance.commentId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };

CommentResponse _$CommentResponseFromJson(Map<String, dynamic> json) =>
    CommentResponse(
      json['user'] as String?,
      json['blog'] as String?,
      json['content'] as String?,
      json['_id'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$CommentResponseToJson(CommentResponse instance) =>
    <String, dynamic>{
      'blog': instance.blogId,
      'content': instance.commentContent,
      '_id': instance.commentId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'user': instance.userId,
    };

CommentsResponse _$CommentsResponseFromJson(Map<String, dynamic> json) =>
    CommentsResponse(
      json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      json['blog'] as String?,
      json['content'] as String?,
      json['_id'] as String?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
      json['__v'] as int?,
    );

Map<String, dynamic> _$CommentsResponseToJson(CommentsResponse instance) =>
    <String, dynamic>{
      'blog': instance.blogId,
      'content': instance.commentContent,
      '_id': instance.commentId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
      'user': instance.userInfo,
    };

CommentInfoResponse _$CommentInfoResponseFromJson(Map<String, dynamic> json) =>
    CommentInfoResponse(
      json['status'] as String?,
      json['message'] as String?,
      json['Comment'] == null
          ? null
          : CommentResponse.fromJson(json['Comment'] as Map<String, dynamic>),
      (json['Comments'] as List<dynamic>?)
          ?.map((e) => CommentsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CommentInfoResponseToJson(
        CommentInfoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'Comment': instance.commentResponse,
      'Comments': instance.blogCommentsResponse,
    };

AllLikesResponse _$AllLikesResponseFromJson(Map<String, dynamic> json) =>
    AllLikesResponse(
      json['status'] as String?,
      json['message'] as String?,
      (json['likes'] as List<dynamic>?)
          ?.map((e) => CommentsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllLikesResponseToJson(AllLikesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'likes': instance.blogLikesResponse,
    };
