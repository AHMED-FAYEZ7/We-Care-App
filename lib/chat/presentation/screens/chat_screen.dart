import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/chat/presentation/controller/chat_cubit.dart';
import 'package:health_care/core/global/fonts/app_fonts.dart';
import 'package:health_care/core/global/resources/strings_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/widgets/app_bar_widget.dart';

class ChatScreen extends StatelessWidget {
  final String senderId;
  final String receiverId;
  final String roomId;
  final TextEditingController _messageController = TextEditingController();

  ChatScreen({
    Key? key,
    required this.senderId,
    required this.receiverId,
    required this.roomId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<ChatCubit>(context)..userGetMessages(roomId);
    final messagesCubit = ChatCubit.get(context).messages;
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Messaging',
        isBack: true,
      ),
      body: BlocConsumer<ChatCubit, ChatState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p20,
              vertical: AppPadding.p20,
            ),
            child: Column(
              children: [
                if (state is ChatLoadingState)
                  Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  ),
                ConditionalBuilder(
                  condition: ChatCubit.get(context).messages.isNotEmpty,
                  builder: (context) {
                    return Expanded(
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Align(
                            alignment: messagesCubit[index].senderId == senderId
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Card(
                              elevation: AppSize.s3,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s12),
                              ),
                              child: Text(
                                messagesCubit[index].messageContent!,
                                style: TextStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s18,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),

                            //  MessageWidget(
                            //   message: state.message[index].message!,
                            //   color: state.message[index].senderId! ==
                            //           cubit.clientId
                            //       ? ColorManager.bottomAbbBar
                            //       : ColorManager.primary,
                            //   isOwn: state.message[index].senderId! ==
                            //           cubit.clientId
                            //       ? true
                            //       : false,
                            // ),
                          );
                        },
                        itemCount: messagesCubit.length,
                      ),
                    );
                  },
                  fallback: (context) => SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "You do'nt have any messages yet",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppSize.s32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: _messageController,
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorManager.white,
                        ),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 20,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          hintText: "Type message...",
                          filled: true,
                          fillColor: ColorManager.error,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: AppSize.s10,
                    ),
                    Container(
                      width: 70,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorManager.black,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.7),
                            spreadRadius: AppSize.s2,
                            blurRadius: AppSize.s5,
                            offset: const Offset(AppSize.s0, AppSize.s3),
                          )
                        ],
                      ),
                      child: MaterialButton(
                        onPressed: () async {
                          await cubit.userSendMessage(
                            roomId: roomId,
                            messageContent: _messageController.text,
                          );
                          print(_messageController.text);
                          _messageController.clear();
                        },
                        child: const Text(
                          AppStrings.send,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: AppSize.s16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
