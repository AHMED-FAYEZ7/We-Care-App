import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/chat/data/response/chat_response/chat_response.dart';
import 'package:health_care/chat/domain/model/chat_model.dart';
import 'package:health_care/chat/domain/usecase/get_all_messages_use_case.dart';
import 'package:health_care/chat/domain/usecase/get_messages_use_case.dart';
import 'package:health_care/chat/domain/usecase/get_stream_messages_use_case.dart';
import 'package:health_care/chat/domain/usecase/send_message_use_case.dart';
import 'package:health_care/chat/domain/usecase/user_create_chat_use_case.dart';
import 'package:health_care/chat/domain/usecase/user_send_message_use_case.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:image_picker/image_picker.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final UserCreateChatUseCase _userCreateChatUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final GetAllChatsUseCase _getAllChatsUseCase;
  final GetMessagesUseCase _getMessagesUseCase;
  // cubit
  final UserSendMessageUseCase _userSendMessageUseCase;
  final GetStreamMessagesUseCase _getStreamMessagesUseCase;
  final ImagePicker _imagePicker = ImagePicker();
  final _userFireStore = FirebaseStorage.instance;

  ChatCubit(
    this._userCreateChatUseCase,
    this._sendMessageUseCase,
    this._getAllChatsUseCase,
    this._getMessagesUseCase,
    this._userSendMessageUseCase,
    this._getStreamMessagesUseCase,
  ) : super(ChatInitial());

  static ChatCubit get(context) => BlocProvider.of(context);

  FutureOr<void> userCreateChat({
    required String receiverId,
  }) async {
    emit(CreateChatLoadingState());

    return (await _userCreateChatUseCase.call(
      receiverId,
      // "64564cc5061fd8d24c5ef612",
    ))
        .fold((l) {
      emit(CreateChatErrorState(l.message!));
    }, (r) {
      emit(CreateChatDoneState(chatInfo: r));
    });
  }

  FutureOr<void> getAllChats() async {
    emit(GetAllChatsLoadingState());

    return (await _getAllChatsUseCase.call(const NoParameters())).fold((l) {
      emit(GetAllChatsErrorState(l.message!));
    }, (r) {
      emit(GetAllChatsLoadedState(listOfChats: r));
    });
  }

  List<BaseMessageResponse> messages = [];

  void userGetMessages(String roomId) {
    emit(ChatLoadingState());
    messages = [];
    _getMessagesUseCase.call(roomId).listen(
      (messagesResponse) {
        (messagesResponse.allMessagesResponse)!.forEach((element) {
          messages.add(element);
        });
        emit(ChatLoadedState(listOfMessages: messagesResponse));
      },
      onDone: () {
        print("done");
      },
      onError: (error) {
        emit(ChatErrorState(error.toString()));
      },
    );
  }

// firebase

  List<MessageModel> messagesOfStream = [];

  void streamOfMessages(
    String senderId,
    String receiverId,
  ) {
    // emit(StreamLoadingState());
    _getStreamMessagesUseCase
        .call(
      GetMsgUseCaseInput(senderId: senderId, receiverId: receiverId),
    )
        .listen(
      (messagesStream) {
        messagesOfStream = [];
        messagesStream.forEach((element) {
          messagesOfStream.add(element);
        });
        emit(StreamLoadedState(listOfMessages: messagesOfStream));
      },
      onError: (error) {
        emit(StreamErrorState(error.toString()));
      },
    );
  }

  FutureOr<void> userSendMessage({
    required String senderId,
    required String receiverId,
    required String messageContent,
  }) async {
    // emit(SendMessageLoadingState());
    MessageModel messageModel = MessageModel(
      content: messageContent,
      type: MessageType.TEXT,
      senderID: senderId,
      receiverID: receiverId,
      sentTime: DateTime.now(),
    );

    await _userSendMessageUseCase.call(params: messageModel);
  }

  FutureOr<void> userSendImage({
    required String senderId,
    required String receiverId,
    required String imageUrl,
  }) async {
    // emit(SendMessageLoadingState());
    MessageModel messageModel = MessageModel(
      content: imageUrl,
      type: MessageType.IMAGE,
      senderID: senderId,
      receiverID: receiverId,
      sentTime: DateTime.now(),
    );

    await _userSendMessageUseCase.call(params: messageModel);
  }

  File? imageMessage;
  imageFromGallery(
    String senderId,
    String receiverId,
  ) async {
    var pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      // emit(CameraImagePickedSuccessState());
      imageMessage = File(pickedImage.path);
      String? imageUrl = await uploadImage(imageMessage!);

      userSendImage(
        senderId: senderId,
        receiverId: receiverId,
        imageUrl: imageUrl!,
      );
      imageMessage = null;
    }
  }

  imageFromCamera(
    String senderId,
    String receiverId,
  ) async {
    var pickedImage = await _imagePicker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      // emit(CameraImagePickedSuccessState());
      imageMessage = File(pickedImage.path);
      String? imageUrl = await uploadImage(imageMessage!);

      userSendImage(
        senderId: senderId,
        receiverId: receiverId,
        imageUrl: imageUrl!,
      );
      imageMessage = null;
    }
  }

  Future<String?> uploadImage(File imageMessage) async {
    try {
      Reference reference = _userFireStore
          .ref()
          .child('images/${Uri.file(imageMessage.path).pathSegments.last}');
      // print("asasdasd ${imageMessage.path}");
      UploadTask uploadTask = reference.putFile(imageMessage);
      // emit(UploadImagePickedSuccessState());

      return await uploadTask.then((results) => results.ref.getDownloadURL());
    } catch (e) {
      emit(UploadImagePickedErrorState());
      print(e.toString());
    }
  }
}
