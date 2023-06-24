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
  Future<DoctorInfResponse> getAllDoctors();

  @GET("api/v1/doctors/topdoctors")
  Future<DoctorInfResponse> getTopDoctors();

  @GET("api/v1/doctors/specialization/{specialization}")
  Future<DoctorInfResponse> getDoctorsBySpecialization(
    @Path("specialization") String specialization,
  );

  @GET("api/v1/doctors/{id}")
  Future<DoctorByIdResponse> getDoctorById(
    @Path("id") String id,
  );
  @GET("api/v1/doctors/search")
  Future<DoctorInfResponse> getDoctorSearch(
    @Query("keyword") String query,
  );
}
