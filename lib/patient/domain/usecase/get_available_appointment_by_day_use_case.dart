import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/patient/domain/model/appointment_model.dart';
import 'package:health_care/patient/domain/repository/patient_repo.dart';

class GetAvailableAppointmentsByDayUseCase
    implements
        BaseUseCase<AvailableAppointmentsByDayInputUseCase,
            AvailableAppointments> {
  final BasePatientRepo _basePatientRepo;

  GetAvailableAppointmentsByDayUseCase(this._basePatientRepo);

  @override
  Future<Either<Failure, AvailableAppointments>> call(
    AvailableAppointmentsByDayInputUseCase params,
  ) async {
    return await _basePatientRepo.getAvailableAppointmentsByDay(
      docID: params.doctorId,
      dayDate: params.dayDate,
      visitType: params.visitType,
    );
  }
}

class AvailableAppointmentsByDayInputUseCase {
  String doctorId;
  String dayDate;
  String? visitType;
  AvailableAppointmentsByDayInputUseCase({
    required this.doctorId,
    required this.dayDate,
    this.visitType,
  });
}
