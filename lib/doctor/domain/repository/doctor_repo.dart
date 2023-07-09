import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/doctor/domain/model/blog_model.dart';
import 'package:health_care/doctor/domain/model/time_block_model.dart';

abstract class BaseDoctorRepo {
  Future<Either<Failure, TimeBlock>> createTimeBlocK({
    required int period,
    required String startTime,
    required String callType,
  });
  // /////////////// blog ////////////
  Future<Either<Failure, BlogInfo>> createBlog(
    String blogDescription,
    String blogTitle, {
    String? blogImage,
  });
  Future<Either<Failure, BlogInfo>> getAllBlogs();
}
