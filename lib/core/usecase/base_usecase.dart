import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:health_care/core/error/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> call(In input);
}

abstract class OptionalBaseUseCase<In, Out> {
  Future<Either<Failure, Out>> call({In? input});
}

class TwoParametersUseCase {
  String firstParam;
  String? secondParam;
  TwoParametersUseCase(
    this.firstParam, [
    this.secondParam,
  ]);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}
