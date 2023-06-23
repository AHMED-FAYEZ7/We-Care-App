import 'package:dio/dio.dart';
import 'package:health_care/authentication/data/response/user_response/user_response.dart';
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

  @GET("api/v1/doctors/topdoctors")
  Future<TopDoctorsResponse> getTopDoctors();

  @GET("api/v1/doctors/specialization/{specialization}")
  Future<DoctorsSpecializationResponse> getDoctorsBySpecialization(
    @Path("specialization") String specialization,
  );

  @GET("api/v1/doctors/{id}")
  Future<DoctorByIdResponse> getDoctorById(
    @Path("id") String id,
  );
  @GET("api/v1/doctors/search")
  Future<AllDoctorsResponse> getDoctorSearch(
    @Query("keyword") String query,
  );
}
