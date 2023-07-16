import 'package:health_care/core/response/base_response.dart';
import 'package:health_care/doctor/data/network/doctor_api/doctor_api.dart';
import 'package:health_care/doctor/data/response/blog/blog_response.dart';
import 'package:health_care/doctor/data/response/comments_likes/comments_likes_response.dart';
import 'package:health_care/doctor/data/response/time_block/time_block_response.dart';

abstract class BaseDoctorRemoteDataSource {
  Future<TimeBlockResponse> createTimeBlock({
    required int period,
    required String startTime,
    required String callType,
  });

  // ////////////// blog ///////////////
  Future<BlogInfoResponse> createBlog(
    String postDescription,
    String postTitle, {
    String? postImage,
  });

  Future<BlogInfoResponse> getAllBlogs();

  Future<BlogInfoResponse> getDoctorBlogsById({
    required String doctorId,
  });
  //////////////// comments & likes ///////////

  Future<BaseCommentResponse> createComment({
    required String blogId,
    required String commentContent,
  });

  Future<CommentInfoResponse> getBlogsComments({
    required String blogId,
  });

  Future<AllLikesResponse> getBlogsLikes({
    required String blogId,
  });

  Future<BaseResponse> createLike({
    required String blogId,
  });

  Future<BaseResponse> createDisLike({
    required String blogId,
  });

  Future<BaseResponse> isExamined({
    required String appointmentId,
    required String status,
  });
}

class DoctorRemoteDataSourceImpl implements BaseDoctorRemoteDataSource {
  final DoctorServiceClient _doctorServiceClient;

  DoctorRemoteDataSourceImpl(this._doctorServiceClient);

  @override
  Future<TimeBlockResponse> createTimeBlock({
    required int period,
    required String startTime,
    required String callType,
  }) async {
    return await _doctorServiceClient.createTimeBlock(
      period,
      startTime,
      callType,
    );
  }

  @override
  Future<BlogInfoResponse> createBlog(
    String postDescription,
    String postTitle, {
    String? postImage,
  }) async {
    return await _doctorServiceClient.createBlog(
      postDescription,
      postTitle,
      blogImage: postImage,
    );
  }

  @override
  Future<BlogInfoResponse> getAllBlogs() async {
    return await _doctorServiceClient.getAllBlogs();
  }

  @override
  Future<BaseCommentResponse> createComment({
    required String blogId,
    required String commentContent,
  }) async {
    return await _doctorServiceClient.createComment(
      blogId,
      commentContent,
    );
  }

  @override
  Future<CommentInfoResponse> getBlogsComments({required String blogId}) async {
    return await _doctorServiceClient.getBlogsComments(
      blogId,
    );
  }

  @override
  Future<AllLikesResponse> getBlogsLikes({required String blogId}) async {
    return await _doctorServiceClient.getBlogsLikes(
      blogId,
    );
  }

  @override
  Future<BaseResponse> createLike({required String blogId}) async {
    return await _doctorServiceClient.createLike(
      blogId,
    );
  }

  @override
  Future<BaseResponse> createDisLike({required String blogId}) async {
    return await _doctorServiceClient.createDisLike(
      blogId,
    );
  }

  @override
  Future<BaseResponse> isExamined({
    required String appointmentId,
    required String status,
  }) async {
    return await _doctorServiceClient.isExamined(
      appointmentId,
      status,
    );
  }

  @override
  Future<BlogInfoResponse> getDoctorBlogsById({
    required String doctorId,
  }) async {
    return await _doctorServiceClient.getDoctorBlogsById(
      doctorId,
    );
  }
}
