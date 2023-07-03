import 'package:dio/dio.dart';
import 'package:health_care/core/network/api_constance.dart';
import 'package:health_care/doctor/data/response/time_block_response.dart';
import 'package:retrofit/retrofit.dart';

part 'doctor_api.g.dart';

@RestApi(baseUrl: AppConstance.baseUrl)
abstract class DoctorServiceClient {
  factory DoctorServiceClient(Dio dio, {String baseUrl}) = _DoctorServiceClient;

  @POST("api/v1/timeBlocks")
  Future<TimeBlockResponse> createTimeBlock(
    @Field("period") int period,
    @Field("startTime") String startTime,
    @Field("callType") String callType,
  );
}
