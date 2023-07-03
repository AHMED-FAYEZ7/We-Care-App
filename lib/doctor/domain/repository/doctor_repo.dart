import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/doctor/domain/model/time_block_model.dart';

abstract class BaseDoctorRepo {
  Future<Either<Failure, TimeBlock>> createTimeBloc({
    required int period,
    required String startTime,
    required String callType,
  });
}
