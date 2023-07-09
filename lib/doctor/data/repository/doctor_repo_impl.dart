import 'package:health_care/core/error/error_handler.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:health_care/core/network/network_info.dart';
import 'package:health_care/doctor/data/data_source/doctor_remote_data_source.dart';
import 'package:health_care/doctor/data/mapper/doctor_mapper.dart';
import 'package:health_care/doctor/domain/model/blog_model.dart';
import 'package:health_care/doctor/domain/model/comments_likes_model.dart';
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

        return Right(response.toDomain());
      } catch (error) {
        print("error ${error.toString()}");
        return Left((ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, BlogInfo>> createBlog(
    String postDescription,
    String postTitle, {
    String? blogImage,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _baseDoctorRemoteDataSource.createBlog(
          postDescription,
          postTitle,
          postImage: blogImage,
        );

        return Right(response.toDomain());
      } catch (error) {
        print("error ${error.toString()}");
        return Left((ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, BlogInfo>> getAllBlogs() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _baseDoctorRemoteDataSource.getAllBlogs();

        return Right(response.toDomain());
      } catch (error) {
        print("error ${error.toString()}");
        return Left((ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, CommentInfo>> createComment({
    required String blogId,
    required String commentContent,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _baseDoctorRemoteDataSource.createComment(
          blogId: blogId,
          commentContent: commentContent,
        );

        return Right(response.toDomain());
      } catch (error) {
        print("error ${error.toString()}");
        return Left((ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, CommentInfo>> getBlogsComments(
      {required String blogId}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _baseDoctorRemoteDataSource.getBlogsComments(
          blogId: blogId,
        );

        return Right(response.toDomain());
      } catch (error) {
        print("error ${error.toString()}");
        return Left((ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> createLike({required String blogId}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _baseDoctorRemoteDataSource.createLike(
          blogId: blogId,
        );
        return Right(response.message!);
      } catch (error) {
        print("error ${error.toString()}");
        return Left((ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> createDisLike(
      {required String blogId}) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _baseDoctorRemoteDataSource.createDisLike(
          blogId: blogId,
        );

        return Right(response.message!);
      } catch (error) {
        print("error ${error.toString()}");
        return Left((ErrorHandler.handle(error).failure));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
