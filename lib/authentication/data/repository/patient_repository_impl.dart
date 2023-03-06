import 'package:dartz/dartz.dart';
import 'package:health_care/authentication/data/data_source/patient/patient_remote_data_source.dart';
import 'package:health_care/authentication/data/mapper/patient_mapper.dart';
import 'package:health_care/authentication/data/request/patient_request.dart';
import 'package:health_care/authentication/domain/model/patient_model.dart';
import 'package:health_care/authentication/domain/repository/patient_auth_repository.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/network/network_info.dart';

import '../../../core/error/error_handler.dart';

class PatientAuthRepositoryImpl extends PatientAuthRepository {
  PatientRemoteDataSource _patientRemoteDataSource;
  NetworkInfo _networkInfo;

  PatientAuthRepositoryImpl(
    this._patientRemoteDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, PatientAuth>> patientSignUp(
      PatientSignUpRequest patientSignUpRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call the API
        final response =
            await _patientRemoteDataSource.patientSignUp(patientSignUpRequest);
        if (response.status == ApiInternalStatus.SUCCESS) // success
        {
          // return data from right
          return Right(response.toDomain());
        } else
        // return biz logic error from left
        {
          return Left(Failure(ResponseCode.DEFAULT,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (left(ErrorHandler.handle(error).failure));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
