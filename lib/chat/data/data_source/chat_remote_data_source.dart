import 'package:health_care/chat/data/network/doctor_api/chat_api.dart';
import 'package:health_care/chat/data/response/chat_response/chat_response.dart';

abstract class BaseChatRemoteDataSource {
  Future<BaseChatResponse> userCreateChat({
    required String receiverId,
  });
  Future<ChatsInfoResponse> getAllChats();

  Future<MessageResponse> sendMessage({
    required String roomId,
    required String messageContent,
  });
  Stream<AllMessagesResponse> getAllMessages({
    required String roomId,
  });
}

class ChatRemoteDataSourceImpl implements BaseChatRemoteDataSource {
  final ChatServiceClient _chatServiceClient;

  ChatRemoteDataSourceImpl(
    this._chatServiceClient,
  );

  @override
  Future<BaseChatResponse> userCreateChat({
    required String receiverId,
  }) async {
    return await _chatServiceClient.createChatRoom(receiverId);
  }

  @override
  Future<ChatsInfoResponse> getAllChats() async {
    return await _chatServiceClient.getAllChats();
  }

  @override
  Future<MessageResponse> sendMessage({
    required String roomId,
    required String messageContent,
  }) async {
    return await _chatServiceClient.sendMessage(
      roomId,
      messageContent,
    );
  }

  @override
  Stream<AllMessagesResponse> getAllMessages({required String roomId}) {
    return _chatServiceClient.getAllMessages(
      roomId,
    );
  }
}
