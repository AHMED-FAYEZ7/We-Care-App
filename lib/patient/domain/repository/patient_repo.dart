import 'package:dartz/dartz.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/patient/domain/model/patient_entities.dart';

abstract class BasePatientRepo {
  Future<Either<Failure, AllDoctors>> getAllDoctors();
  Future<Either<Failure, AllDoctors>> getDoctorSearch(String query);
  Future<Either<Failure, TopDoctors>> getTopDoctors();
  Future<Either<Failure, UserData>> getDoctorById(String id);
  Future<Either<Failure, DoctorsSpecialization>> getDoctorsSpecialization(
    String specialization,
  );
}
