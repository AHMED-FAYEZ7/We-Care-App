import 'package:health_care/authentication/data/mapper/user_mapper.dart';
import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/core/utils/extension.dart';
import 'package:health_care/doctor/data/response/blog/blog_response.dart';
import 'package:health_care/doctor/data/response/comments_likes/comments_likes_response.dart';
import 'package:health_care/doctor/data/response/time_block/time_block_response.dart';
import 'package:health_care/doctor/domain/model/blog_model.dart';
import 'package:health_care/doctor/domain/model/comments_likes_model.dart';
import 'package:health_care/doctor/domain/model/time_block_model.dart';

extension TimeBlockResponseMapper on TimeBlockResponse? {
  TimeBlock toDomain() {
    return TimeBlock(
      this?.period?.orZero() ?? Constants.zero,
      this?.startTime?.orEmpty() ?? Constants.empty,
      this?.type?.orEmpty() ?? Constants.empty,
      this?.timeBlockId?.orEmpty() ?? Constants.empty,
      this?.doctorId?.orEmpty() ?? Constants.empty,
      this?.v?.orZero() ?? Constants.zero,
    );
  }
}

////////////////// Blog ///////////////
extension ImageResponseMapper on ImageResponse? {
  BlogImage toDomain() {
    return BlogImage(
      this?.publicId?.orEmpty() ?? Constants.empty,
      this?.imageUrl?.orEmpty() ?? Constants.empty,
    );
  }
}

extension BlogResponseMapper on BlogResponse? {
  Blog toDomain() {
    return Blog(
      this?.doctorInfo?.toDomain(),
      this?.blogTitle?.orEmpty() ?? Constants.empty,
      this?.blogDescription?.orEmpty() ?? Constants.empty,
      this?.numComments?.orZero() ?? Constants.zero,
      this?.numLikes?.orZero() ?? Constants.zero,
      this?.image?.toDomain(),
      this?.blogId?.orEmpty() ?? Constants.empty,
      this?.createdAt?.orEmpty() ?? Constants.empty,
      this?.updatedAt?.orEmpty() ?? Constants.empty,
      this?.v?.orZero() ?? Constants.zero,
    );
  }
}

extension BlogInfoResponseMapper on BlogInfoResponse? {
  BlogInfo toDomain() {
    return BlogInfo(
      this?.message?.orEmpty() ?? Constants.empty,
      this?.blogResponseData?.toDomain(),
      (this?.allBlogsResponse?.map((blog) => blog.toDomain()) ??
              const Iterable.empty())
          .cast<Blog>()
          .toList(),
    );
  }
}
////////////////////// comments & likes /////////////

extension BaseCommentMapper on BaseCommentResponse? {
  BaseComment toDomain() {
    return BaseComment(
      this?.blogId?.orEmpty() ?? Constants.empty,
      this?.commentContent?.orEmpty() ?? Constants.empty,
      this?.commentId?.orEmpty() ?? Constants.empty,
      this?.createdAt?.orEmpty() ?? Constants.empty,
      this?.updatedAt?.orEmpty() ?? Constants.empty,
      this?.v?.orZero() ?? Constants.zero,
    );
  }
}

extension CommentMapper on CommentResponse? {
  Comment toDomain() {
    return Comment(
      this?.userId?.orEmpty() ?? Constants.empty,
      this?.blogId?.orEmpty() ?? Constants.empty,
      this?.commentContent?.orEmpty() ?? Constants.empty,
      this?.commentId?.orEmpty() ?? Constants.empty,
      this?.createdAt?.orEmpty() ?? Constants.empty,
      this?.updatedAt?.orEmpty() ?? Constants.empty,
      this?.v?.orZero() ?? Constants.zero,
    );
  }
}

extension CommentsMapper on CommentsResponse? {
  Comments toDomain() {
    return Comments(
      this?.userInfo?.toDomain(),
      this?.blogId?.orEmpty() ?? Constants.empty,
      this?.commentContent?.orEmpty() ?? Constants.empty,
      this?.commentId?.orEmpty() ?? Constants.empty,
      this?.createdAt?.orEmpty() ?? Constants.empty,
      this?.updatedAt?.orEmpty() ?? Constants.empty,
      this?.v?.orZero() ?? Constants.zero,
    );
  }
}

extension CommentInfoMapper on CommentInfoResponse? {
  CommentInfo toDomain() {
    return CommentInfo(
      this?.commentResponse?.toDomain(),
      (this?.blogCommentsResponse?.map(
                    (blogComment) => blogComment.toDomain(),
                  ) ??
              const Iterable.empty())
          .cast<Comments>()
          .toList(),
    );
  }
}
