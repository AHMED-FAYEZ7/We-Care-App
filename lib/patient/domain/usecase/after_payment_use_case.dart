import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/patient/domain/repository/patient_repo.dart';

class AfterPaymentUseCase
    implements BaseUseCase<AfterPaymentUseCaseInput, void> {
  final BasePatientRepo _basePatientRepo;

  AfterPaymentUseCase(this._basePatientRepo);

  @override
  Future<Either<Failure, void>> call(
    AfterPaymentUseCaseInput input,
  ) async {
    return await _basePatientRepo.afterPayment(
      appointmentId: input.appointmentId,
      sessionId: input.sessionId,
    );
  }
}

class AfterPaymentUseCaseInput {
  String appointmentId;
  String sessionId;

  AfterPaymentUseCaseInput({
    required this.appointmentId,
    required this.sessionId,
  });
}
