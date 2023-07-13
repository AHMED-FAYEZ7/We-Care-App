import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:health_care/chat/data/response/chat_response/chat_response.dart';
import 'package:health_care/chat/domain/model/chat_model.dart';
import 'package:health_care/core/error/failure.dart';

abstract class BaseChatRepository {
  Future<Either<Failure, BaseChat>> userCreateChat({
    required String receiverId,
  });
  Future<Either<Failure, MessageModelServer>> userSendMessage({
    required String roomId,
    required String messageContent,
  });
  Future<Either<Failure, ChatsInfo>> getAllChats();

  Stream<AllMessagesResponse> userReceiveMessage({
    required String roomId,
  });

  Future<void> sendMessage(MessageModel messageModel);

  Stream<List<MessageModel>> streamMessagesForChat({
    required String senderId,
    required String receiverId,
  });
}
