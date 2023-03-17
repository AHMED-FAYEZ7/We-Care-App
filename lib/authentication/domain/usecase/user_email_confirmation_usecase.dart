import 'package:dartz/dartz.dart';
import 'package:health_care/authentication/data/request/user_request.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/authentication/domain/repository/user_repository.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';

class UserEmailConfirmationUseCase
    extends BaseUseCase<int, UserEmailConfirmation> {
  final BaseUserRepository _baseUserRepository;

  UserEmailConfirmationUseCase(
    this._baseUserRepository,
  );

  @override
  Future<Either<Failure, UserEmailConfirmation>> call(int input) async {
    return await _baseUserRepository.userEmailConfirmation(
      UserEmailConfirmationRequest(
        input,
      ),
    );
  }
}
