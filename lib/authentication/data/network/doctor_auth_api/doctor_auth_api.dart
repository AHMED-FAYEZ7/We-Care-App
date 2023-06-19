import 'package:dio/dio.dart';
import 'package:health_care/authentication/data/response/doctor_auth_response/doctor_auth_response.dart';
import 'package:health_care/core/network/api_constance.dart';
import 'package:retrofit/retrofit.dart';

part 'doctor_auth_api.g.dart';

@RestApi(baseUrl: AppConstance.baseUrl)
abstract class DoctorAuthServiceClient {
  factory DoctorAuthServiceClient(Dio dio, {String baseUrl}) =
      _DoctorAuthServiceClient;

  @POST("api/v1/doctors/signup")
  Future<DoctorAuthResponse> doctorSignUp(
    @Field("name") String name,
    @Field("specialization") String specialization,
    @Field("password") String password,
    @Field("passwordConfirm") String passwordConfirm,
    @Field("email") String email,
  );
}
