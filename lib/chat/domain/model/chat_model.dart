import 'package:cloud_firestore/cloud_firestore.dart';
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

class MessageModelServer {
  BaseMessage? messageData;

  MessageModelServer(this.messageData);
}

class AllMessages {
  int results;
  List<BaseMessage>? messageData;

  AllMessages(this.results, this.messageData);
}

enum MessageType {
  TEXT,
  IMAGE,
  UNKNOWN,
}

class MessageModel {
  final String senderID;
  final String receiverID;
  final MessageType type;
  final String content;
  final DateTime sentTime;

  MessageModel({
    required this.content,
    required this.type,
    required this.senderID,
    required this.receiverID,
    required this.sentTime,
  });

  factory MessageModel.fromJSON(Map<String, dynamic> json) {
    MessageType _messageType;
    switch (json["type"]) {
      case "text":
        _messageType = MessageType.TEXT;
        break;
      case "image":
        _messageType = MessageType.IMAGE;
        break;
      default:
        _messageType = MessageType.UNKNOWN;
    }
    return MessageModel(
      content: json["content"],
      type: _messageType,
      senderID: json["sender_id"],
      receiverID: json["receiver_id"],
      sentTime: json["sent_time"].toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    String _messageType;
    switch (type) {
      case MessageType.TEXT:
        _messageType = "text";
        break;
      case MessageType.IMAGE:
        _messageType = "image";
        break;
      default:
        _messageType = "";
    }
    return {
      "content": content,
      "type": _messageType,
      "sender_id": senderID,
      "receiver_id": receiverID,
      "sent_time": Timestamp.fromDate(sentTime),
    };
  }
}
