import 'package:dartz/dartz.dart';
import 'package:health_care/core/error/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> call(In input);
}
