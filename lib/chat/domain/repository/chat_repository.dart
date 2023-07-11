import 'package:dartz/dartz.dart';
import 'package:health_care/chat/domain/model/chat_model.dart';
import 'package:health_care/core/error/failure.dart';

abstract class BaseChatRepository {
  Future<Either<Failure, BaseChat>> userCreateChat({
    required String receiverId,
  });
  Future<Either<Failure, MessageModel>> userSendMessage({
    required String roomId,
    required String messageContent,
  });
  Future<Either<Failure, ChatsInfo>> getAllChats();

  Stream<Either<Failure, AllMessages>> userReceiveMessage();
}
