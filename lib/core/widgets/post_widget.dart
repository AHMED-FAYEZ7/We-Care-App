import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/widgets/divider_widget.dart';
import 'package:health_care/doctor/domain/model/blog_model.dart';
import 'package:intl/intl.dart';

class PostWidget extends StatelessWidget {
  PostWidget({
    required this.model,
    Key? key,
  }) : super(key: key);

  Blog model;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: AppSize.s3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    "https://idsb.tmgrup.com.tr/ly/uploads/images/2022/12/19/247181.jpg",
                  ),
                ),
                const SizedBox(
                  width: AppSize.s8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            child: Text(
                              model.doctorInfo!.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                height: 1.4,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.check_circle,
                            color: ColorManager.primary,
                            size: 15,
                          ),
                        ],
                      ),
                      Text(
                        DateFormat.yMMMMd('en_US')
                            .format(DateTime.parse(model.createdAt)),
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              height: 1.4,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz_outlined,
                    size: 20,
                  ),
                ),
              ],
            ),
            MyDividerWidget(
              height: AppSize.s3,
            ),
            if (model.blogTitle != '')
              Text(
                "${model.blogTitle}: ",
                maxLines: 2,
                style: TextStyle(
                  color: ColorManager.black,
                  fontSize: AppSize.s12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            const SizedBox(
              height: AppSize.s1,
            ),
            if (model.blogDescription != '')
              Text(
                model.blogDescription,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: ColorManager.black,
                  fontSize: AppSize.s12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            SizedBox(
              width: double.infinity,
              child: Wrap(
                children: [
                  Container(
                    padding: const EdgeInsetsDirectional.only(
                      end: AppPadding.p8,
                    ),
                    height: 25,
                    child: MaterialButton(
                      onPressed: () {},
                      minWidth: 1,
                      padding: EdgeInsets.zero,
                      child: Text(
                        '#software',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: ColorManager.primary,
                            ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.only(
                      end: AppPadding.p8,
                    ),
                    height: 25,
                    child: MaterialButton(
                      onPressed: () {},
                      minWidth: 1,
                      padding: EdgeInsets.zero,
                      child: Text(
                        '#flutter-dev',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: ColorManager.primary,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: AppSize.s150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                  image: NetworkImage(
                    model.imageData!.imageUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 1,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              size: 18,
                              IconBroken.Heart,
                              color: Colors.red,
                            ),
                            const SizedBox(
                              width: AppSize.s5,
                            ),
                            Text(
                              "${model.numLikes}",
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              size: 18,
                              IconBroken.Chat,
                              color: Colors.amber,
                            ),
                            const SizedBox(
                              width: AppSize.s5,
                            ),
                            Text(
                              "${model.numComments}",
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            MyDividerWidget(
              height: AppSize.s0,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: NetworkImage(
                            "https://idsb.tmgrup.com.tr/ly/uploads/images/2022/12/19/247181.jpg",
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          'write a comment ...',
                          style: Theme.of(context).textTheme.caption!.copyWith(
                                height: 1.4,
                              ),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                ),
                InkWell(
                  child: Row(
                    children: [
                      Icon(
                        size: 18,
                        IconBroken.Heart,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Like',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
