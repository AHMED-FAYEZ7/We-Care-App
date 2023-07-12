// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_cubit.dart';

abstract class ChatState {}

class ChatInitial extends ChatState {}

class CreateChatLoadingState extends ChatState {}

class CreateChatDoneState extends ChatState {
  final BaseChat chatInfo;
  CreateChatDoneState({
    required this.chatInfo,
  });
}

class CreateChatErrorState extends ChatState {
  final String error;

  CreateChatErrorState(this.error);
}

//

class SendMessageLoadingState extends ChatState {}

class SendMessageLoadedState extends ChatState {
  final MessageModel messageData;

  SendMessageLoadedState({required this.messageData});
}

class SendMessageErrorState extends ChatState {
  final String error;

  SendMessageErrorState(this.error);
}

//
class GetAllChatsLoadingState extends ChatState {}

class GetAllChatsLoadedState extends ChatState {
  final ChatsInfo listOfChats;
  GetAllChatsLoadedState({
    required this.listOfChats,
  });
}

class GetAllChatsErrorState extends ChatState {
  final String error;

  GetAllChatsErrorState(this.error);
}

//
class ChatLoadingState extends ChatState {}

class ChatLoadedState extends ChatState {
  final AllMessagesResponse listOfMessages;
  ChatLoadedState({
    required this.listOfMessages,
  });
}

class ChatErrorState extends ChatState {
  final String error;

  ChatErrorState(this.error);
}
