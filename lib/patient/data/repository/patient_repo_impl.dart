import 'package:dartz/dartz.dart';
import 'package:health_care/authentication/data/mapper/user_mapper.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/error/error_handler.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/network/network_info.dart';
import 'package:health_care/patient/data/data_source/patient_remote_data_source.dart';
import 'package:health_care/patient/data/mapper/patient_mapper.dart';
import 'package:health_care/patient/domain/model/appointment_model.dart';
import 'package:health_care/patient/domain/model/patient_entities.dart';
import 'package:health_care/patient/domain/repository/patient_repo.dart';

class PatientRepoImpl implements BasePatientRepo {
  final BasePatientRemoteDataSource _basePatientRemoteDataSource;
  final NetworkInfo _networkInfo;

  PatientRepoImpl(
    this._basePatientRemoteDataSource,
    this._networkInfo,
  );
  @override
  Future<Either<Failure, DoctorInfo>> getAllDoctors() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _basePatientRemoteDataSource.getAllDoctors();

        if (response.status == ApiInternalStatus.SUCCESS) {
          print(" ssssssssss ssssssssssss ${response.resultsResponse}");
          return Right(response.toDomain());
        } else {
          return Left(Failure(1, response.message!));
        }
      } catch (error) {
        return Left((ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, DoctorInfo>> getTopDoctors({
    String? specialization,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _basePatientRemoteDataSource.getTopDoctors(
          specialization: specialization,
        );

        if (response.status == ApiInternalStatus.SUCCESS) {
          print(" mmmmmmmmmmmm ${response.resultsResponse}");
          return Right(response.toDomain());
        } else {
          return Left(Failure(1, response.message!));
        }
      } catch (error) {
        return Left((ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, DoctorInfo>> getDoctorsSpecialization(
    String specialization,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _basePatientRemoteDataSource.getDoctorsBySpecialization(
          specialization,
        );

        if (response.status == ApiInternalStatus.SUCCESS) {
          print(" hhhhhhhhhhh hhhhhhhhhhhss ${response.resultsResponse}");
          return Right(response.toDomain());
        } else {
          return Left(Failure(1, response.message!));
        }
      } catch (error) {
        return Left((ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, UserData>> getDoctorById(String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _basePatientRemoteDataSource.getDoctorById(id);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(1, response.message!));
        }
      } catch (error) {
        return Left((ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, DoctorInfo>> getDoctorSearch(String query) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _basePatientRemoteDataSource.getDoctorSearch(
          query,
        );

        if (response.status == ApiInternalStatus.SUCCESS) {
          print(" ssssssssss ssssssssssss ${response.resultsResponse}");
          print(
              " ةةةة ssssssssssss ${response.doctorsSearchDataResponse!.length}");
          // print(" cccccccccc ssssssssssss ${response.allDoctors!.length}");
          return Right(response.toDomain());
        } else {
          return Left(Failure(1, response.message!));
        }
      } catch (error) {
        return Left((ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, AppointmentsInfo>> getDoctorAvailableAppointments(
    String docID,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _basePatientRemoteDataSource.getDoctorAvailableAppointments(
          docID,
        );

        if (response.status == ApiInternalStatus.SUCCESS) {
          print(" ssssssssss ssssssssssss ${response.status}");
          print(
              " ةةةة ssssssssssss ${response.availableAppointmentsResponseData!.length}");
          // print(" cccccccccc ssssssssssss ${response.allDoctors!.length}");
          return Right(response.toDomain());
        } else {
          return Left(Failure(1, response.message!));
        }
      } catch (error) {
        return Left((ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, AppointmentsInfo>> getAvailableAppointmentsByDay({
    required String docID,
    required String date,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _basePatientRemoteDataSource.getAvailableAppointmentsByDay(
          docID,
          date,
        );

        print(" ssssssssss ssssssssssss ${response.status}");
        print(
            " ةةةة ssssssssssss ${response.availableAppointmentsByDayResponseData!.length}");
        // print(" cccccccccc ssssssssssss ${response.allDoctors!.length}");
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(1, response.message!));
        }
      } catch (error) {
        return Left((ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
