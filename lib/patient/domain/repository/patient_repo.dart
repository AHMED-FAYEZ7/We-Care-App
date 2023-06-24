import 'package:dartz/dartz.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/patient/domain/model/patient_entities.dart';

abstract class BasePatientRepo {
  Future<Either<Failure, DoctorInfo>> getAllDoctors();
  Future<Either<Failure, DoctorInfo>> getDoctorSearch(String query);
  Future<Either<Failure, DoctorInfo>> getTopDoctors();
  Future<Either<Failure, UserData>> getDoctorById(String id);
  Future<Either<Failure, DoctorInfo>> getDoctorsSpecialization(
    String specialization,
  );
}
