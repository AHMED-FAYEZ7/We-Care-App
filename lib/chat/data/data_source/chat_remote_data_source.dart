import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health_care/chat/data/network/doctor_api/chat_api.dart';
import 'package:health_care/chat/data/response/chat_response/chat_response.dart';
import 'package:health_care/chat/domain/model/chat_model.dart';

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

  Future<void> userSendMessage(MessageModel messageModel);
  Stream<List<MessageModel>> streamMessagesForChat(
    String senderId,
    String receiverId,
  );
}

class ChatRemoteDataSourceImpl implements BaseChatRemoteDataSource {
  final _userFireStore = FirebaseFirestore.instance;

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

  @override
  Future<void> userSendMessage(MessageModel messageModel) async {
    await _userFireStore
        .collection("users")
        .doc(messageModel.senderID)
        .collection('chats')
        .doc(messageModel.receiverID)
        .collection("messages")
        .add(messageModel.toJson());
    debugPrint("Message saved in sender successfully ......");
    await _userFireStore
        .collection("users")
        .doc(messageModel.receiverID)
        .collection('chats')
        .doc(messageModel.senderID)
        .collection("messages")
        .add(messageModel.toJson());
    debugPrint("Message saved in receiver successfully ......");
  }

  @override
  Stream<List<MessageModel>> streamMessagesForChat(
    String senderId,
    String receiverId,
  ) {
    return _userFireStore
        .collection("users")
        .doc(senderId)
        .collection("chats")
        .doc(receiverId)
        .collection("messages")
        .orderBy("sent_time", descending: false)
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => MessageModel.fromJSON(doc.data()))
          .toList();
    });
  }
}
