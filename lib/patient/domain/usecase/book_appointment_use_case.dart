import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/patient/domain/model/appointment_model.dart';
import 'package:health_care/patient/domain/repository/patient_repo.dart';

class BookAppointmentUseCase
    implements BaseUseCase<BookAppointmentUseCaseInput, BookedAppointment> {
  final BasePatientRepo _basePatientRepo;

  BookAppointmentUseCase(this._basePatientRepo);

  @override
  Future<Either<Failure, BookedAppointment>> call(
    BookAppointmentUseCaseInput input,
  ) async {
    return await _basePatientRepo.bookAppointment(
      appointmentID: input.appointmentID,
      comment: input.comment,
    );
  }
}

class BookAppointmentUseCaseInput {
  String appointmentID;
  String? comment;
  BookAppointmentUseCaseInput({
    required this.appointmentID,
    this.comment,
  });
}
