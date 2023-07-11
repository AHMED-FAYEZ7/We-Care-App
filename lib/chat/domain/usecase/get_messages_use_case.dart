import 'package:health_care/chat/data/response/chat_response/chat_response.dart';
import 'package:health_care/chat/domain/repository/chat_repository.dart';
import 'package:health_care/core/usecase/base_usecase.dart';

class GetMessagesUseCase implements TestUseCase<String, AllMessagesResponse> {
  final BaseChatRepository _baseChatRepository;

  GetMessagesUseCase(this._baseChatRepository);

  @override
  Stream<AllMessagesResponse> call(String input) {
    return _baseChatRepository.userReceiveMessage(roomId: input);
  }
}
