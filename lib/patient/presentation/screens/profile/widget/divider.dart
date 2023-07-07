// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/values_manger.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: AppSize.s10,
        ),
        Divider(),
      ],
    );
  }
}
