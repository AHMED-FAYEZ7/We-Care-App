import 'package:dartz/dartz.dart';
import 'package:health_care/chat/domain/model/chat_model.dart';
import 'package:health_care/core/error/failure.dart';

abstract class BaseChatRepository {
  // Future<void> connectToSocket();
  // Future<void> disconnectSocket();
  Future<Either<Failure, BaseChat>> userCreateChat({
    required String receiverId,
  });
  Future<void> userSendMessage(String message);
  Stream<Either<Failure, ChatsInfo>> userReceiveMessage();
}
