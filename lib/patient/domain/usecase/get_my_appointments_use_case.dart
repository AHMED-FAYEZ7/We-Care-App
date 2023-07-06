import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/patient/domain/model/appointment_model.dart';
import 'package:health_care/patient/domain/repository/patient_repo.dart';

class GetMyAppointmentsUseCase
    implements BaseUseCase<void, AppointmentsInfo> {
  final BasePatientRepo _basePatientRepo;

  GetMyAppointmentsUseCase(this._basePatientRepo);

  @override
  Future<Either<Failure, AppointmentsInfo>> call(
      void input,
  ) async {
    return await _basePatientRepo.getMyAppointments();
  }
}
