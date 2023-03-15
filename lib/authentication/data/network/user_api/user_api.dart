import 'package:dio/dio.dart';
import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:health_care/core/network/api_constance.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api.g.dart';

@RestApi(baseUrl: AppConstance.baseUrl)
abstract class UserServiceClient {
  factory UserServiceClient(Dio dio, {String baseUrl}) = _UserServiceClient;

  @POST("api/v1/users/login")
  Future<UserDataResponse> userLogin(
    @Field("email") String email,
    @Field("password") String password,
  );

  @POST("api/v1/users/forgotPassword")
  Future<UserForgetPasswordResponse> userForgetPassword(
    @Field("email") String email,
  );
}
