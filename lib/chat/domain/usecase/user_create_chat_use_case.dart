import 'package:dartz/dartz.dart';
import 'package:health_care/chat/domain/model/chat_model.dart';
import 'package:health_care/chat/domain/repository/chat_repository.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';

class UserCreateChatUseCase implements BaseUseCase<String, BaseChat> {
  final BaseChatRepository _baseChatRepository;

  UserCreateChatUseCase(this._baseChatRepository);

  @override
  Future<Either<Failure, BaseChat>> call(String input) async {
    return await _baseChatRepository.userCreateChat(receiverId: input);
  }
}
