import 'package:dio/dio.dart';
import 'package:health_care/authentication/data/response/patient_auth_response/patient_auth_response.dart';
import 'package:health_care/core/network/api_constance.dart';
import 'package:retrofit/retrofit.dart';

part 'patient_auth_api.g.dart';

@RestApi(baseUrl: AppConstance.baseUrl)
abstract class PatientAuthServiceClient {
  factory PatientAuthServiceClient(Dio dio, {String baseUrl}) =
      _PatientAuthServiceClient;

  @POST("api/v1/patients/signup")
  Future<PatientAuthResponse> patientSignUp(
    @Field("name") String name,
    @Field("password") String password,
    @Field("email") String email,
    @Field("passwordConfirm") String passwordConfirm,
  );
}
