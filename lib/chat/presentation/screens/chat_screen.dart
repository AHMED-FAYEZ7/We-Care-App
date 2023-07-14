import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/chat/domain/model/chat_model.dart';
import 'package:health_care/chat/presentation/controller/chat_cubit.dart';
import 'package:health_care/chat/presentation/widgets/custom_list_view_tiles.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/strings_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/routes/app_routes.dart';
import 'package:health_care/core/widgets/app_bar_widget.dart';

class ChatScreen extends StatefulWidget {
  final String senderId;
  final String receiverId;

  // final String roomId;

  ChatScreen({
    Key? key,
    required this.senderId,
    required this.receiverId,
    // required this.roomId,
  }) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        startScrolling();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void startScrolling() {
    _scrollToBottom();
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    // _deviceHeight = MediaQuery.of(context).size.height;
    // _deviceWidth = MediaQuery.of(context).size.width;
    final cubit = BlocProvider.of<ChatCubit>(context)
      ..streamOfMessages(
        widget.senderId,
        widget.receiverId,
      );
    final messages = ChatCubit.get(context).messagesOfStream;
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Messaging',
        isBack: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p20,
          vertical: AppPadding.p20,
        ),
        child: BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Column(
              children: [
                if (state is StreamLoadingState)
                  Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.black,
                    ),
                  ),
                if (state is StreamLoadedState)
                  ConditionalBuilder(
                    condition: state.listOfMessages.isNotEmpty,
                    builder: (context) {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: state.listOfMessages.length,
                          controller: _scrollController,
                          // reverse: true,
                          itemBuilder: (BuildContext context, int index) {
                            MessageModel message = state.listOfMessages[index];
                            bool isOwnMessage =
                                message.senderID == widget.senderId;
                            return Container(
                              child: CustomChatListViewTile(
                                deviceHeight:
                                    MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width * 0.80,
                                message: message,
                                isOwnMessage: isOwnMessage,
                              ),
                            );
                          },
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: 50, // Set a fixed height for the container
                          child: TextFormField(
                            controller: _messageController,
                            decoration: InputDecoration(
                              hintText: "Type a message",
                              hintStyle: TextStyle(color: ColorManager.black),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s20),
                                borderSide: BorderSide(
                                  color: ColorManager.grey,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s20),
                                borderSide: BorderSide(
                                  color: ColorManager.primary,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s20),
                                borderSide: BorderSide(
                                  width: AppSize.s1_5,
                                  color: ColorManager.error,
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s20),
                                borderSide: BorderSide(
                                  width: AppSize.s1_5,
                                  color: ColorManager.error,
                                ),
                              ),
                              contentPadding: const EdgeInsets.only(
                                left: 8,
                                bottom: 5,
                                top: 5,
                                right: 5,
                              ),
                              suffixIcon: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      IconBroken.Send,
                                      size: AppSize.s30,
                                      color: ColorManager.primary,
                                    ),
                                    onPressed: () async {
                                      if (_messageController.text.isNotEmpty) {
                                        await ChatCubit.get(context)
                                            .userSendMessage(
                                          senderId: widget.senderId,
                                          receiverId: widget.receiverId,
                                          messageContent:
                                              _messageController.text,
                                        );
                                      }
                                      _messageController.clear();
                                      _scrollToBottom();
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      IconBroken.Camera,
                                      size: AppSize.s30,
                                      color: ColorManager.primary,
                                    ),
                                    onPressed: () {
                                      _showPicker(
                                        context,
                                        widget.senderId,
                                        widget.receiverId,
                                      );
                                      _scrollToBottom();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  _showPicker(
    BuildContext context,
    String senderId,
    String receiverId,
  ) // shown when user tap on PP field
  {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              // pick from gallery
              ListTile(
                trailing: const Icon(Icons.arrow_forward),
                leading: const Icon(Icons.camera),
                title: const Text(AppStrings.photoGallery),
                onTap: () {
                  ChatCubit.get(context).imageFromGallery(
                    senderId,
                    receiverId,
                  );
                  Navigator.of(context).pop();
                },
              ),

              // pick from camera
              ListTile(
                trailing: const Icon(Icons.arrow_forward),
                leading: const Icon(Icons.camera_alt_outlined),
                title: const Text(AppStrings.photoCamera),
                onTap: () {
                  ChatCubit.get(context).imageFromCamera(
                    senderId,
                    receiverId,
                  );
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
