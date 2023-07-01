import 'package:dartz/dartz.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/patient/domain/model/appointment_model.dart';
import 'package:health_care/patient/domain/model/patient_entities.dart';
import 'package:health_care/patient/domain/model/rarte_model.dart';

abstract class BasePatientRepo {
  Future<Either<Failure, DoctorInfo>> getAllDoctors();
  Future<Either<Failure, DoctorInfo>> getDoctorSearch(
    String query, {
    String? specialization,
  });
  Future<Either<Failure, DoctorInfo>> getTopDoctors({String? specialization});
  Future<Either<Failure, UserData>> getDoctorById(String id);
  Future<Either<Failure, DoctorInfo>> getDoctorsSpecialization(
    String specialization,
  );
  Future<Either<Failure, AppointmentsInfo>> getDoctorAvailableAppointments(
    String docID,
  );
  Future<Either<Failure, AppointmentsInfo>> getAvailableAppointmentsByDay({
    required String docID,
    required String date,
  });
  Future<Either<Failure, AppointmentsInfo>> bookAppointment({
    required String appointmentID,
  });
  Future<Either<Failure, RateInfo>> getDoctorReviews({
    required String doctorId,
  });
}
