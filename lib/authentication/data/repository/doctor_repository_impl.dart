import 'package:dartz/dartz.dart';
import 'package:health_care/authentication/data/data_source/doctor/doctor_remote_data_source.dart';
import 'package:health_care/authentication/data/mapper/doctor_mapper.dart';
import 'package:health_care/authentication/data/request/doctor_request.dart';
import 'package:health_care/authentication/domain/model/doctor_model.dart';
import 'package:health_care/authentication/domain/repository/doctor_auth_repository.dart';
import 'package:health_care/core/error/error_handler.dart';
import 'package:health_care/core/error/exceptions.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/network/network_info.dart';

class DoctorAuthRepositoryImpl implements BaseDoctorAuthRepository {
  final BaseDoctorRemoteDataSource baseDoctorRemoteDataSource;
  final NetworkInfo _networkInfo;
  DoctorAuthRepositoryImpl(
    this.baseDoctorRemoteDataSource,
    this._networkInfo,
  );
  @override
  Future<Either<Failure, DoctorAuth>> doctorSignUp(
    DoctorSignUpRequest doctorSignUpRequest,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await baseDoctorRemoteDataSource.doctorSignUp(doctorSignUpRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          print(response);
          return Right(response.toDomain());
        } else {
          print(response);
          return Left(Failure(1, response.message!));
        }
      } catch (error) {
        return Left((ErrorHandler.handle(error).failure));
      }
    } else {
      // internet
      return Left(Failure(1, ""));
    }

    // final result =
    //     await baseDoctorRemoteDataSource.doctorSignUp(doctorSignUpRequest);
    // try {
    //   return Right(result.toDomain());
    // } on ServerExceptions catch (failure) {
    //   return Left(ServerFailure(failure.errorMessageModel.message));
    // }
  }
}
