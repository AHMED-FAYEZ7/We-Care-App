// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/patient/presentation/widgets/search_bar_widget.dart';

class PopNavigatorAppBarWidget extends StatelessWidget {
  PopNavigatorAppBarWidget({
    this.title,
    this.isSearch = false,
    Key? key,
  }) : super(key: key);

  String? title;
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * .12,
        ),
        Row(children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              IconBroken.Arrow___Left,
            ),
          ),
          if (isSearch)
            SizedBox(
              width: MediaQuery.of(context).size.width * .866,
              child: SearchBarWidget(
                readOnly: false,
                initialValue: "Dr. ",
                onTap: () {},
              ),
            ),
          if (!isSearch)
            Text(
              title!,
              style: Theme.of(context).textTheme.displaySmall,
            ),
        ]),
      ],
    );
  }
}
