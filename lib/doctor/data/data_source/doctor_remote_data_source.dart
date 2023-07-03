import 'package:health_care/doctor/data/network/doctor_api/doctor_api.dart';
import 'package:health_care/doctor/data/response/time_block_response.dart';

abstract class BaseDoctorRemoteDataSource {
  Future<TimeBlockResponse> createTimeBlock({
    required int period,
    required String startTime,
    required String callType,
  });
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
}
