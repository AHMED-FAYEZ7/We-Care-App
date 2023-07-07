import 'package:health_care/chat/data/response/chat_response/chat_response.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

abstract class BaseChatRemoteDataSource {
  Future<void> connectToSocket();

  Future<BaseChatResponse> userCreateChat(String receiverId);

  // void userSendMessage(String roomId, String message);

  // void listenToMessages(Function(dynamic) callback);

  // void disconnect();
}

class ChatRemoteDataSourceImpl implements BaseChatRemoteDataSource {
  io.Socket? _socket;
  List<ChatsInfoResponse> messageList = [];
  ChatRemoteDataSourceImpl();

  @override
  Future<void> connectToSocket() async {
    const url = 'https://helth-clinc.onrender.com/';
    final options = io.OptionBuilder().setTransports(['websocket']).build();

    _socket = io.io(url, options);

    _socket!.on('', (newMessage) {
      // messageList.add(ChatsInfoResponse.fromJson(newMessage));
      // print(messageList.length);
      print('Connection done');
    });
    _socket!.send(messageList);

    _socket!.onConnect((_) {
      print('Connection established');
    });

    _socket!.connect();
  }

  @override
  Future<BaseChatResponse> userCreateChat(String receiverId) {
    // TODO: implement userCreateChat
    throw UnimplementedError();
  }
}
