import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:health_care/authentication/data/data_source/user/user_data_source.dart';
import 'package:health_care/authentication/data/mapper/user_mapper.dart';
import 'package:health_care/authentication/data/request/user_request.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/authentication/domain/repository/user_repository.dart';
import 'package:health_care/core/error/error_handler.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/network/network_info.dart';

class BaseUserRepositoryImpl extends BaseUserRepository {
  final UserRemoteDataSource _userRemoteDataSource;
  final NetworkInfo _networkInfo;
  BaseUserRepositoryImpl(
    this._userRemoteDataSource,
    this._networkInfo,
  );

  //////////////// user login /////////////////////
  @override
  Future<Either<Failure, UserData>> userLogin(
    UserLoginRequest userLoginRequest,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _userRemoteDataSource.userLogin(
          userLoginRequest,
        );
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(1, response.message));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  //////////////// user forget password /////////////////////
  @override
  Future<Either<Failure, UserForgetPassword>> userForgetPassword(
    UserForgetPasswordRequest userForgetPasswordRequest,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _userRemoteDataSource.userForgetPassword(
          userForgetPasswordRequest,
        );
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(1, response.message));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  //////////////// user update password /////////////////////
  @override
  Future<Either<Failure, UserUpdatePassword>> userUpdatePassword(
    UserUpdatePasswordRequest userUpdatePasswordRequest,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _userRemoteDataSource.userUpdatePassword(
          userUpdatePasswordRequest,
        );
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(1, response.message));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  /////////// user delete me /////////////////
  @override
  Future<Failure> userDeleteMe() async {
    if (await _networkInfo.isConnected) {
      try {
        print("333333333333");
        return await _userRemoteDataSource.userDeleteMe();
      } catch (error) {
        print("22222222222222222222");
        return ErrorHandler.handle(error).failure;
      }
    } else {
      return DataSource.NO_INTERNET_CONNECTION.getFailure();
    }
  }
}
