// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';

class SearchBarWidget extends StatefulWidget {
  bool readOnly = false;
  Function onTap;
  Function(String value)? onChanged;
  TextEditingController? controller;
  String? initialValue;

  SearchBarWidget({
    required this.readOnly,
    required this.onTap,
    this.onChanged,
    this.controller,
    this.initialValue,
    super.key,
  });
  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSize.s12),
          child: SizedBox(
            height: AppSize.s40,
            child: TextFormField(
              controller: widget.controller,
              readOnly: widget.readOnly,
              onTap: () {
                widget.onTap();
              },
              onFieldSubmitted: (value) {
                widget.onChanged!(value);
              },
              decoration: InputDecoration(
                hintText: 'Search...',
                filled: true,
                fillColor: ColorManager.lightGrey,
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorManager.white),
                  borderRadius: BorderRadius.circular(AppSize.s20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorManager.white),
                  borderRadius: BorderRadius.circular(AppSize.s20),
                ),
                suffixIcon: Icon(
                  IconBroken.Search,
                  color: ColorManager.primary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
