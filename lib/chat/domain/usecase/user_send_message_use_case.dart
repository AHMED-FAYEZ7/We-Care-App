import 'package:health_care/chat/domain/model/chat_model.dart';
import 'package:health_care/chat/domain/repository/chat_repository.dart';
import 'package:health_care/core/usecase/base_usecase.dart';

class UserSendMessageUseCase implements VoidUseCase<void, MessageModel> {
  final BaseChatRepository _baseChatRepository;

  UserSendMessageUseCase(this._baseChatRepository);

  @override
  Future<void> call({
    required MessageModel params,
  }) async {
    await _baseChatRepository.sendMessage(params);
  }
}
