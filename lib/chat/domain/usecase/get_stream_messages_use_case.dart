import 'package:health_care/chat/domain/model/chat_model.dart';
import 'package:health_care/chat/domain/repository/chat_repository.dart';
import 'package:health_care/core/usecase/base_usecase.dart';

class GetStreamMessagesUseCase
    implements TestUseCase<GetMsgUseCaseInput, List<MessageModel>> {
  final BaseChatRepository _baseChatRepository;

  GetStreamMessagesUseCase(this._baseChatRepository);

  @override
  Stream<List<MessageModel>> call(GetMsgUseCaseInput input) {
    return _baseChatRepository.streamMessagesForChat(
      senderId: input.senderId,
      receiverId: input.receiverId,
    );
  }
}

class GetMsgUseCaseInput {
  String senderId;
  String receiverId;

  GetMsgUseCaseInput({
    required this.senderId,
    required this.receiverId,
  });
}
