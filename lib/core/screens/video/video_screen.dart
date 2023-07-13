import 'package:flutter/material.dart';
import 'package:health_care/core/widgets/app_bar_widget.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isBack: true,
        title:
        "",
      ),
      body: Center(child: Text('video')),
    );
  }
}
