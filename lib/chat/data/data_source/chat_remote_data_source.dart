import 'package:socket_io_client/socket_io_client.dart' as io;

import 'package:health_care/chat/data/network/doctor_api/chat_api.dart';
import 'package:health_care/chat/data/response/chat_response/chat_response.dart';

abstract class BaseChatRemoteDataSource {
  // Future<void> connectToSocket();

  Future<BaseChatResponse> userCreateChat({
    required String receiverId,
  });

  // void userSendMessage(String roomId, String message);

  // void listenToMessages(Function(dynamic) callback);

  // void disconnect();
}

class ChatRemoteDataSourceImpl implements BaseChatRemoteDataSource {
  final ChatServiceClient _chatServiceClient;

  ChatRemoteDataSourceImpl(
    this._chatServiceClient,
  );
  // io.Socket? _socket;
  // List<ChatsInfoResponse> messageList = [];
  // ChatRemoteDataSourceImpl();

  // @override
  // Future<void> connectToSocket() async {
  //   const url = 'https://helth-clinc.onrender.com/';
  //   final options = io.OptionBuilder().setTransports(['websocket']).build();

  //   _socket = io.io(url, options);

  //   _socket!.on('', (newMessage) {
  //     // messageList.add(ChatsInfoResponse.fromJson(newMessage));
  //     // print(messageList.length);
  //     print('Connection done');
  //   });
  //   _socket!.send(messageList);

  //   _socket!.onConnect((_) {
  //     print('Connection established');
  //   });

  //   _socket!.connect();
  // }

  @override
  Future<BaseChatResponse> userCreateChat({
    required String receiverId,
  }) async {
    return await _chatServiceClient.createChatRoom(receiverId);
  }
}
