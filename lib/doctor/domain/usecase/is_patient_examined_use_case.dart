import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/doctor/domain/repository/doctor_repo.dart';

class IsPatientExaminedUseCase
    implements BaseUseCase<IsPatientExaminedUseCaseInput, void> {
  final BaseDoctorRepo _baseDoctorRepo;

  IsPatientExaminedUseCase(this._baseDoctorRepo);

  @override
  Future<Either<Failure, void>> call(
    IsPatientExaminedUseCaseInput input,
  ) async {
    return await _baseDoctorRepo.isExamined(
      appointmentId: input.appointmentId,
      status: input.status,
    );
  }
}

class IsPatientExaminedUseCaseInput {
  String appointmentId;
  String status;

  IsPatientExaminedUseCaseInput({
    required this.appointmentId,
    required this.status,
  });
}
