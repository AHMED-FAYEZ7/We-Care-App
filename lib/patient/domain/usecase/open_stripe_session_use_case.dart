import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/patient/domain/model/payment_model.dart';
import 'package:health_care/patient/domain/repository/patient_repo.dart';

class OpenStripeSessionUseCase implements BaseUseCase<String, SessionModel> {
  final BasePatientRepo _basePatientRepo;

  OpenStripeSessionUseCase(this._basePatientRepo);

  @override
  Future<Either<Failure, SessionModel>> call(String input) async {
    return await _basePatientRepo.openStripeSession(appointmentId: input);
  }
}
