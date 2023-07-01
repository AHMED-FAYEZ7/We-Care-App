import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/patient/domain/model/appointment_model.dart';
import 'package:health_care/patient/domain/repository/patient_repo.dart';

class GetAvailableAppointmentsByDay
    implements BaseUseCase<TwoParametersUseCase, AppointmentsInfo> {
  final BasePatientRepo _basePatientRepo;

  GetAvailableAppointmentsByDay(this._basePatientRepo);

  @override
  Future<Either<Failure, AppointmentsInfo>> call(
    TwoParametersUseCase params,
  ) async {
    return await _basePatientRepo.getAvailableAppointmentsByDay(
      docID: params.firstParam,
      date: params.secondParam!,
    );
  }
}
