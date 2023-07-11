import 'package:health_care/authentication/data/mapper/user_mapper.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/chat/data/response/chat_response/chat_response.dart';
import 'package:health_care/chat/domain/model/chat_model.dart';
import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/core/utils/extension.dart';
import 'package:health_care/doctor/data/mapper/doctor_mapper.dart';

extension BaseChatResponseMapper on BaseChatResponse? {
  BaseChat toDomain() {
    return BaseChat(
      this?.status?.orEmpty() ?? Constants.empty,
      this?.roomId?.orEmpty() ?? Constants.empty,
    );
  }
}

extension ChatsResponseMapper on ChatsResponse? {
  Chats toDomain() {
    return Chats(
      this?.roomId?.orEmpty() ?? Constants.empty,
      (this?.membersList?.map((member) => member.toDomain()) ??
              const Iterable.empty())
          .cast<User>()
          .toList(),
      this?.createdAt?.orEmpty() ?? Constants.empty,
      this?.updatedAt?.orEmpty() ?? Constants.empty,
      this?.v?.orZero() ?? Constants.zero,
      this?.lastMSG?.orEmpty() ?? Constants.empty,
    );
  }
}

extension ChatsInfoResponseMapper on ChatsInfoResponse? {
  ChatsInfo toDomain() {
    return ChatsInfo(
      this?.results?.orZero() ?? Constants.zero,
      (this?.chatsInfoResponse?.map((chatsInfoResponseData) =>
                  chatsInfoResponseData.toDomain()) ??
              const Iterable.empty())
          .cast<Chats>()
          .toList(),
    );
  }
}

// ///////////// Messages ///////////
extension BaseMessageResponseMapper on BaseMessageResponse? {
  BaseMessage toDomain() {
    return BaseMessage(
      this?.roomId?.orEmpty() ?? Constants.empty,
      this?.senderId?.orEmpty() ?? Constants.empty,
      this?.messageContent?.orEmpty() ?? Constants.empty,
      this?.imageResponse?.toDomain(),
      this?.messageId?.orEmpty() ?? Constants.empty,
      this?.createdAt?.orEmpty() ?? Constants.empty,
      this?.updatedAt?.orEmpty() ?? Constants.empty,
      this?.v?.orZero() ?? Constants.zero,
    );
  }
}

extension MessageResponseMapper on MessageResponse? {
  MessageModel toDomain() {
    return MessageModel(
      this?.messageData?.toDomain(),
    );
  }
}

extension AllMessagesResponseMapper on AllMessagesResponse? {
  AllMessages toDomain() {
    return AllMessages(
      this?.results?.orZero() ?? Constants.zero,
      (this?.allMessagesResponse?.map(
                    (allMessages) => allMessages.toDomain(),
                  ) ??
              const Iterable.empty())
          .cast<BaseMessage>()
          .toList(),
    );
  }
}
