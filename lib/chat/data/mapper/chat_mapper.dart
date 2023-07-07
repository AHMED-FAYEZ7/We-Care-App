import 'package:health_care/authentication/data/mapper/user_mapper.dart';
import 'package:health_care/authentication/domain/model/user_model.dart';
import 'package:health_care/chat/data/response/chat_response/chat_response.dart';
import 'package:health_care/chat/domain/model/chat_model.dart';
import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/core/utils/extension.dart';

extension BaseChatResponseMapper on BaseChatResponse? {
  BaseChat toDomain() {
    return BaseChat(
      this?.status?.orEmpty() ?? Constants.empty,
      this?.roomId?.orEmpty() ?? Constants.empty,
    );
  }
}

extension ChatResponseMapper on ChatsResponse? {
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

extension ChatInfoResponseMapper on ChatsInfoResponse? {
  ChatsInfo toDomain() {
    return ChatsInfo(
      this?.results?.orEmpty() ?? Constants.empty,
      (this?.chatsInfoResponse?.map((chatsInfoResponseData) =>
                  chatsInfoResponseData.toDomain()) ??
              const Iterable.empty())
          .cast<Chats>()
          .toList(),
    );
  }
}
