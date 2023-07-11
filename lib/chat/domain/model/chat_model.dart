import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/doctor/domain/model/blog_model.dart';

class BaseChat {
  String success;
  String roomId;
  BaseChat(
    this.success,
    this.roomId,
  );
}

class Chats {
  String roomId;
  List<User> membersList;
  String createdAt;
  String updatedAt;
  int v;
  String lastMSG;

  Chats(
    this.roomId,
    this.membersList,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.lastMSG,
  );
}

class ChatsInfo {
  int results;
  List<Chats>? chatInfo;

  ChatsInfo(
    this.results,
    this.chatInfo,
  );
}

class BaseMessage {
  String roomId;
  String senderId;
  String messageContent;
  BlogImage? imageResponse;
  String messageId;
  String createdAt;
  String updatedAt;
  int v;

  BaseMessage(
    this.roomId,
    this.senderId,
    this.messageContent,
    this.imageResponse,
    this.messageId,
    this.createdAt,
    this.updatedAt,
    this.v,
  );
}

class MessageModel {
  BaseMessage? messageData;

  MessageModel(this.messageData);
}

class AllMessages {
  int results;
  List<BaseMessage>? messageData;

  AllMessages(this.results, this.messageData);
}
