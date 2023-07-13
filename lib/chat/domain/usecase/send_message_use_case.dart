import 'package:dartz/dartz.dart';

import 'package:health_care/chat/domain/model/chat_model.dart';
import 'package:health_care/chat/domain/repository/chat_repository.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/usecase/base_usecase.dart';

class SendMessageUseCase
    implements BaseUseCase<SendMessageUseCaseInput, MessageModelServer> {
  final BaseChatRepository _baseChatRepository;

  SendMessageUseCase(this._baseChatRepository);

  @override
  Future<Either<Failure, MessageModelServer>> call(
    SendMessageUseCaseInput input,
  ) async {
    return await _baseChatRepository.userSendMessage(
      roomId: input.roomId,
      messageContent: input.messageContent,
    );
  }
}

class SendMessageUseCaseInput {
  String roomId;
  String messageContent;

  SendMessageUseCaseInput({
    required this.roomId,
    required this.messageContent,
  });
}
