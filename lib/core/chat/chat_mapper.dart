import 'package:health_care/core/chat/chat_model.dart';
import 'package:health_care/core/response/chat_response.dart';
import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/core/utils/extension.dart';

extension ChatResponseMapper on ChatResponse? {
  Chat toDomain() {
    return Chat(
      this?.conversationId?.orEmpty() ?? Constants.empty,
      this?.membersList?.orEmptyList() ?? Constants.emptyList,
      this?.createdAt?.orEmpty() ?? Constants.empty,
      this?.updatedAt?.orEmpty() ?? Constants.empty,
      this?.v?.orZero() ?? Constants.zero,
    );
  }
}

extension ChatInfoResponseMapper on ChatInfoResponse? {
  ChatInfo toDomain() {
    return ChatInfo(
      this?.chatInfoResponse?.toDomain(),
    );
  }
}
