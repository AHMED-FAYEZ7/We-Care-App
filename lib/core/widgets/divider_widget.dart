// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';

class MyDividerWidget extends StatelessWidget {
  MyDividerWidget({
    required this.height,
    Key? key,
  }) : super(key: key);
  double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: height,
        ),
        Divider(),
      ],
    );
  }
}
