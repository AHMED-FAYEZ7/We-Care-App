import 'package:dartz/dartz.dart';

import '../error/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> call(In input);
}
