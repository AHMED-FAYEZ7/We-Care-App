class Chat {
  String conversationId;
  List<String> membersList;
  String createdAt;
  String updatedAt;
  int v;
  Chat(
    this.conversationId,
    this.membersList,
    this.createdAt,
    this.updatedAt,
    this.v,
  );
}

class ChatInfo {
  Chat? chatInfo;

  ChatInfo(this.chatInfo);
}
