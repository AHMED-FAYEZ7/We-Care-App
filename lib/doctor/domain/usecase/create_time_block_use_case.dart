import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/doctor/domain/model/time_block_model.dart';
import 'package:health_care/doctor/domain/repository/doctor_repo.dart';

class CreateTimeBlockUseCase
    implements BaseUseCase<CreateTimeBlockUseCaseInput, TimeBlock> {
  final BaseDoctorRepo _baseDoctorRepo;

  CreateTimeBlockUseCase(this._baseDoctorRepo);

  @override
  Future<Either<Failure, TimeBlock>> call(
    CreateTimeBlockUseCaseInput input,
  ) async {
    return await _baseDoctorRepo.createTimeBlocK(
      period: input.period,
      startTime: input.startTime,
      callType: input.callType,
    );
  }
}

class CreateTimeBlockUseCaseInput {
  int period;
  String startTime;
  String callType;

  CreateTimeBlockUseCaseInput({
    required this.period,
    required this.startTime,
    required this.callType,
  });
}
