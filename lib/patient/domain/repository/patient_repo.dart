import 'package:dartz/dartz.dart';
import 'package:health_care/authentication/domain/model/patient_model.dart';
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

  Future<Either<Failure, UserData>> getUserData();

  Future<Either<Failure, AvailableAppointments>> getDoctorAvailableAppointments(
    String docID,
  );

  Future<Either<Failure, MyAppointments>> getMyAppointments();

  Future<Either<Failure, AvailableAppointments>> getAvailableAppointmentsByDay({
    required String docID,
    required String dayDate,
    String? visitType,
  });

  Future<Either<Failure, BookedAppointment>> bookAppointment({
    required String appointmentID,
  });

  Future<Either<Failure, RateInfo>> getDoctorReviews({
    required String doctorId,
  });

  Future<Either<Failure, RateInfo>> makeDoctorReview({
    required String docId,
    required int rating,
    required String comment,
  });

  Future<Either<Failure, RateInfo>> updateDoctorReview({
    required String docId,
    required int rating,
    required String comment,
  });

  Future<Either<Failure, RateInfo>> deleteReview({required String docId});
}
