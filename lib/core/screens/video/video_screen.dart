import 'package:flutter/material.dart';
import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/core/widgets/app_bar_widget.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class VideoScreen extends StatelessWidget {
  final String userID;
  final String userName;
  const VideoScreen({
    Key? key,
    required this.userID,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(
          isBack: true,
          title: "Video Call",
        ),
        body: ZegoUIKitPrebuiltCall(
          appID: Constants.APPID,
          appSign: Constants.APPSign,
          callID: "callId",
          userID: userID,
          userName: userName,
          config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
            ..onOnlySelfInRoom = (_) => Navigator.of(context).pop(),
        ));
  }
}

class CallPage extends StatelessWidget {
  final String userID;
  final String userName;
  const CallPage({
    Key? key,
    required this.userID,
    required this.userName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: Constants.APPID,
      appSign: Constants.APPSign,
      callID: "callId",
      userID: userID,
      userName: userName,
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
        ..onOnlySelfInRoom = (_) => Navigator.of(context).pop(),
    );
  }
}
