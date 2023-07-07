import 'package:health_care/authentication/domain/model/user_model.dart';

class BaseChat {
  String success;
  String roomId;
  BaseChat(
    this.success,
    this.roomId,
  );
}

class Chats {
  String conversationId;
  List<User> membersList;
  String createdAt;
  String updatedAt;
  int v;
  String lastMSG;

  Chats(
    this.conversationId,
    this.membersList,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.lastMSG,
  );
}

class ChatsInfo {
  String results;
  List<Chats>? chatInfo;

  ChatsInfo(
    this.results,
    this.chatInfo,
  );
}
