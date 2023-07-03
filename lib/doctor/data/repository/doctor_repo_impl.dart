import 'package:health_care/core/error/error_handler.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:health_care/core/network/network_info.dart';
import 'package:health_care/doctor/data/data_source/doctor_remote_data_source.dart';
import 'package:health_care/doctor/data/mapper/doctor_mapper.dart';
import 'package:health_care/doctor/domain/model/time_block_model.dart';
import 'package:health_care/doctor/domain/repository/doctor_repo.dart';

class DoctorRepoImpl implements BaseDoctorRepo {
  final BaseDoctorRemoteDataSource _baseDoctorRemoteDataSource;
  final NetworkInfo _networkInfo;

  DoctorRepoImpl(
    this._baseDoctorRemoteDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, TimeBlock>> createTimeBlocK({
    required int period,
    required String startTime,
    required String callType,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _baseDoctorRemoteDataSource.createTimeBlock(
          period: period,
          startTime: startTime,
          callType: callType,
        );

        // print(" ssssssssss ssssssssssss ${response.status}");
        // print(" ةةةة ssssssssssss ${response.reviews!.length}");
        // print(" cccccccccc ssssssssssss ${response.allDoctors!.length}");
        return Right(response.toDomain());
      } catch (error) {
        print("error ${error.toString()}");
        return Left((ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
