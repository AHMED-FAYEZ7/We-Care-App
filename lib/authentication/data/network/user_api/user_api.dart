import 'package:dio/dio.dart';
import 'package:health_care/authentication/data/response/user_response/user_response.dart';
import 'package:health_care/core/network/api_constance.dart';
import 'package:retrofit/retrofit.dart';

part 'user_api.g.dart';

@RestApi(baseUrl: AppConstance.baseUrl)
abstract class UserServiceClient {
  factory UserServiceClient(Dio dio, {String baseUrl}) = _UserServiceClient;

  //////////// user login ////////////
  @POST("api/v1/users/login")
  Future<UserDataResponse> userLogin(
    @Field("email") String email,
    @Field("password") String password,
  );

  /////////// user forget password ///////////////////
  @POST("api/v1/users/forgotPassword")
  Future<UserForgetPasswordResponse> userForgetPassword(
    @Field("email") String email,
  );

  /////////// user update password /////////////////
  @PATCH("api/v1/users/updatePassword")
  Future<UserUpdatePasswordResponse> userUpdatePassword(
    @Field("passwordCurrent") String currentPassword,
    @Field("password") String newPassword,
    @Field("passwordConfirm") String confirmNewPassword,
  );

  /////////// user delete me /////////////////
  @DELETE("api/v1/users/deleteMe")
  Future userDeleteMe();
}
