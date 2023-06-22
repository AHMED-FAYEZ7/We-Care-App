import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/patient/domain/model/patient_entities.dart';

abstract class BasePatientRepo {
  Future<Either<Failure, AllDoctors>> getAllDoctors();
  Future<Either<Failure, TopDoctors>> getTopDoctors();
  Future<Either<Failure, DoctorsSpecialization>> getDoctorsSpecialization(
    String specialization,
  );
}
