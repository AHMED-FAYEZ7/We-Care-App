import 'package:health_care/doctor/data/network/doctor_api/doctor_api.dart';
import 'package:health_care/doctor/data/response/blog/blog_response.dart';
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
}
