import 'package:health_care/authentication/domain/repository/user_repository.dart';
import 'package:health_care/core/error/failure.dart';

class UserDeleteMeUseCase {
  final BaseUserRepository _baseUserRepository;

  UserDeleteMeUseCase(
    this._baseUserRepository,
  );

  Future<Failure> call() async {
    return await _baseUserRepository.userDeleteMe();
  }
}
