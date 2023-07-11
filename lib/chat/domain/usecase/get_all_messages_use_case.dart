import 'package:dartz/dartz.dart';
import 'package:health_care/chat/domain/model/chat_model.dart';
import 'package:health_care/chat/domain/repository/chat_repository.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';

class GetAllChatsUseCase implements BaseUseCase<NoParameters, ChatsInfo> {
  final BaseChatRepository _baseChatRepository;

  GetAllChatsUseCase(this._baseChatRepository);

  @override
  Future<Either<Failure, ChatsInfo>> call(NoParameters input) async {
    return await _baseChatRepository.getAllChats();
  }
}
