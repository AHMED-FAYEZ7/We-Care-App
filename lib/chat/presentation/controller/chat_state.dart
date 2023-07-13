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
  final MessageModelServer messageData;

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
class StreamLoadingState extends ChatState {}

class StreamLoadedState extends ChatState {
  final List<MessageModel> listOfMessages;
  StreamLoadedState({
    required this.listOfMessages,
  });
}

class StreamErrorState extends ChatState {
  final String error;

  StreamErrorState(this.error);
}

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

class GalleryImagePickedSuccessState extends ChatState {}

class GalleryImagePickedErrorState extends ChatState {}

class CameraImagePickedSuccessState extends ChatState {}

class CameraImagePickedErrorState extends ChatState {}

class UploadImagePickedSuccessState extends ChatState {}

class UploadImagePickedErrorState extends ChatState {}
