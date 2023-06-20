import 'package:dio/dio.dart';
import 'package:health_care/core/network/api_constance.dart';
import 'package:health_care/patient/data/response/patient_response.dart';
import 'package:retrofit/retrofit.dart';

part 'patient_api.g.dart';

@RestApi(baseUrl: AppConstance.baseUrl)
abstract class PatientServiceClient {
  factory PatientServiceClient(Dio dio, {String baseUrl}) =
      _PatientServiceClient;

  @GET("api/v1/doctors")
  Future<AllDoctorsResponse> getAllDoctors();
}
