import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/chat/data/response/chat_response/chat_response.dart';
import 'package:health_care/chat/domain/model/chat_model.dart';
import 'package:health_care/chat/domain/usecase/get_all_messages_use_case.dart';
import 'package:health_care/chat/domain/usecase/get_messages_use_case.dart';
import 'package:health_care/chat/domain/usecase/send_message_use_case.dart';
import 'package:health_care/chat/domain/usecase/user_create_chat_use_case.dart';
import 'package:health_care/core/error/failure.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/core/usecase/base_usecase.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final UserCreateChatUseCase _userCreateChatUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final GetAllChatsUseCase _getAllChatsUseCase;
  final GetMessagesUseCase _getMessagesUseCase;

  ChatCubit(
    this._userCreateChatUseCase,
    this._sendMessageUseCase,
    this._getAllChatsUseCase,
    this._getMessagesUseCase,
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

  FutureOr<void> userSendMessage({
    required String roomId,
    required String messageContent,
  }) async {
    emit(SendMessageLoadingState());

    return (await _sendMessageUseCase.call(
      SendMessageUseCaseInput(
        roomId: roomId,
        messageContent: messageContent,
      ),
      // "64564cc5061fd8d24c5ef612",
    ))
        .fold((l) {
      emit(SendMessageErrorState(l.message!));
    }, (r) {
      emit(SendMessageLoadedState(messageData: r));
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
}
