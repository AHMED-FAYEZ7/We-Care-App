import 'package:health_care/authentication/domain/model/user_model.dart';

class BaseComment {
  String blogId;
  String commentContent;
  String commentId;
  String createdAt;
  String updatedAt;
  int v;
  BaseComment(
    this.blogId,
    this.commentContent,
    this.commentId,
    this.createdAt,
    this.updatedAt,
    this.v,
  );
}

class Comment extends BaseComment {
  String userId;
  Comment(
    this.userId,
    super.blogId,
    super.commentContent,
    super.commentId,
    super.createdAt,
    super.updatedAt,
    super.v,
  );
}

class Comments extends BaseComment {
  User? userInfo;
  Comments(
    this.userInfo,
    super.blogId,
    super.commentContent,
    super.commentId,
    super.createdAt,
    super.updatedAt,
    super.v,
  );
}

class CommentInfo {
  Comment? commentData;
  List<Comments>? blogComments;
  CommentInfo(
    this.commentData,
    this.blogComments,
  );
}

class LikesModel {
  List<Comments>? blogLikes;
  LikesModel(
    this.blogLikes,
  );
}
