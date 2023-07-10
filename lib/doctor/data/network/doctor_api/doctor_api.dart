import 'package:dio/dio.dart';
import 'package:health_care/core/network/api_constance.dart';
import 'package:health_care/core/response/base_response.dart';
import 'package:health_care/doctor/data/response/blog/blog_response.dart';
import 'package:health_care/doctor/data/response/comments_likes/comments_likes_response.dart';
import 'package:health_care/doctor/data/response/time_block/time_block_response.dart';
import 'package:retrofit/retrofit.dart';

part 'doctor_api.g.dart';

@RestApi(baseUrl: AppConstance.baseUrl)
abstract class DoctorServiceClient {
  factory DoctorServiceClient(Dio dio, {String baseUrl}) = _DoctorServiceClient;

  @POST("api/v1/timeBlocks")
  Future<TimeBlockResponse> createTimeBlock(
    @Field("period") int period,
    @Field("startTime") String startTime,
    @Field("type") String callType,
  );
// ///////////////// blogs //////////
  @POST("api/v1/blog")
  Future<BlogInfoResponse> createBlog(
    @Field("des") String blogDescription,
    @Field("title") String blogTitle, {
    @Field("image") String? blogImage,
  });

  @GET("api/v1/blog")
  Future<BlogInfoResponse> getAllBlogs();

/////////////////// comments & likes //////////

  @POST("api/v1/blog/add-comment/{blogId}")
  Future<CommentInfoResponse> createComment(
    @Path("blogId") String blogId,
    @Field("content") String commentContent,
  );

  @GET("api/v1/blog/comments/{blogId}")
  Future<CommentInfoResponse> getBlogsComments(
    @Path("blogId") String blogId,
  );
  @POST("api/v1/blog/like/{blogId}")
  Future<BaseResponse> createLike(
    @Path("blogId") String blogId,
  );
  @POST("api/v1/blog/unlike/{blogId}")
  Future<BaseResponse> createDisLike(
    @Path("blogId") String blogId,
  );
}
