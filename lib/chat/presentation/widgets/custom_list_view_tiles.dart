//Packages
import 'package:flutter/material.dart';
import 'package:health_care/chat/domain/model/chat_model.dart';
import 'package:health_care/chat/presentation/widgets/message_bubbles.dart';

class CustomChatListViewTile extends StatelessWidget {
  final double width;
  final double deviceHeight;
  final bool isOwnMessage;
  final MessageModel message;

  CustomChatListViewTile({
    required this.width,
    required this.deviceHeight,
    required this.isOwnMessage,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      width: width,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment:
            isOwnMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: width * 0.05,
          ),
          message.type == MessageType.TEXT
              ? TextMessageBubble(
                  isOwnMessage: isOwnMessage,
                  message: message,
                  // height: deviceHeight * 0.6,
                  width: width,
                )
              : ImageMessageBubble(
                  isOwnMessage: isOwnMessage,
                  message: message,
                  height: deviceHeight * 0.30,
                  width: width * 0.55,
                ),
        ],
      ),
    );
  }
}
