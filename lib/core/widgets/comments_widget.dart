// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/widgets/app_bar_widget.dart';
import 'package:health_care/doctor/domain/model/comments_likes_model.dart';

class CommentsWidget extends StatelessWidget {
  CommentsWidget({
    // required this.postId,
    // required this.comments,
    Key? key,
  }) : super(key: key);

  // String postId;
  // List<Comments> comments;

  TextEditingController comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        isBack: true,
        title: 'Comments',
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p12,
              ),
              itemBuilder: (context, index) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: AppSize.s25,
                    backgroundImage: NetworkImage(
                      "https://idsb.tmgrup.com.tr/ly/uploads/images/2022/12/19/247181.jpg",
                    ),
                  ),
                  const SizedBox(
                    width: AppSize.s5,
                  ),
                  Flexible(
                    child: Card(
                      elevation: AppSize.s3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 2,
                              left: 8,
                              right: 12,
                            ),
                            child: Text(
                              'Leo Messi',
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 2,
                              bottom: 0,
                              left: 8,
                              right: 12,
                            ),
                            child: Wrap(
                              children: [
                                Text(
                                  'NICE DOCTOR',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 2,
                              bottom: 2,
                              left: 8,
                              right: 12,
                            ),
                            child: Text(
                              'wen,2 2322',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              separatorBuilder: (context, index) => const SizedBox(
                height: AppSize.s15,
              ),
              itemCount: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppPadding.p12,
            ),
            child: Card(
              elevation: AppSize.s3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSize.s20),
              ),
              child: TextFormField(
                controller: comment,
                decoration: InputDecoration(
                  hintText: 'Write your title here...',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.s20),
                    borderSide: BorderSide(
                      color: ColorManager.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.s20),
                    borderSide: BorderSide(
                      color: ColorManager.primary,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.s20),
                    borderSide: BorderSide(
                      width: AppSize.s1_5,
                      color: ColorManager.error,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppSize.s20),
                    borderSide: BorderSide(
                      width: AppSize.s1_5,
                      color: ColorManager.error,
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(
                      left: 8, bottom: 5, top: 5, right: 5),
                  suffixIcon: IconButton(
                    icon: Icon(
                      IconBroken.Send,
                      size: AppSize.s30,
                      color: ColorManager.primary,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
