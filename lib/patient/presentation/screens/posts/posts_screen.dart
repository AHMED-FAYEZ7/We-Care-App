import 'package:flutter/material.dart';
import 'package:health_care/patient/presentation/screens/posts/widget/post_widget.dart';

class PostsPatientScreen extends StatelessWidget {
  const PostsPatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          PostWidget(),
        ],
      ),
    );
  }
}
