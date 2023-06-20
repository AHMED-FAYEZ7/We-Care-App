import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/patient/domain/model/patient_entities.dart';

abstract class BasePatientRepo {
  Future<Either<Failure, AllDoctors>> getAllDoctors();
}
