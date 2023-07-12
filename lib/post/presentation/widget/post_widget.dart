// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/app/app_prefs.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/core/widgets/divider_widget.dart';
import 'package:health_care/doctor/domain/model/blog_model.dart';
import 'package:health_care/doctor/domain/model/comments_likes_model.dart';
import 'package:health_care/doctor/presentation/controller/doctor_cubit/doctor_cubit.dart';
import 'package:health_care/patient/presentation/controller/Patient_cubit/patient_cubit.dart';
import 'package:health_care/post/presentation/controller/post_cubit.dart';
import 'package:health_care/post/presentation/screen/comments/comments.dart';
import 'package:health_care/post/presentation/screen/likes/likes.dart';
import 'package:intl/intl.dart';

class PostWidget extends StatelessWidget {
  PostWidget({
    this.isLike = false,
    required this.model,
    // required this.getLikes,
    // required this.getComments,
    // required this.like,
    // required this.disLike,
    // required this.comment,
    // required this.comments,
    // required this.likes,
    this.handelComment,
    Key? key,
  }) : super(key: key);

  Blog model;
  bool isLike = false;
  final AppPreferences _appPreferences = sl<AppPreferences>();

  // VoidCallback getLikes;
  // VoidCallback getComments;
  // VoidCallback like;
  // VoidCallback disLike;
  // VoidCallback comment;
  // List<Comments> comments;
  // List<LikesModel> likes;
  Function({String? comment})? handelComment;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PostCubit.get(context);
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
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
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
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
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
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
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
                          onTap: () {
                            cubit.getLikes(model.blogId);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LikesWidget(),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            cubit.getComments(model.blogId);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CommentsWidget(),
                              ),
                            );
                          },
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
                        onTap: () {
                          cubit.getComments(model.blogId);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommentsWidget(),
                            ),
                          );
                        },
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
                              style:
                                  Theme.of(context).textTheme.caption!.copyWith(
                                        height: 1.4,
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        print(await _appPreferences.getType());
                        if (await _appPreferences.getType() == 'Doctor') {
                          bool doctorExists = cubit.likes.any(
                            (user) =>
                                user.userInfo!.id ==
                                DoctorCubit.get(context).doctorData!.id,
                          );
                          if (doctorExists) {
                            cubit.createDisLike(model.blogId);
                          } else {
                            cubit.createLike(model.blogId);
                          }
                        } else {
                          bool patientExists = cubit.likes.any(
                            (user) =>
                                user.userInfo!.id ==
                                PatientCubit.get(context).patientData!.id,
                          );
                          if (patientExists) {
                            cubit.createDisLike(model.blogId);
                          } else {
                            cubit.createLike(model.blogId);
                          }
                        }
                      },
                      child: Row(
                        children: [
                          const Icon(
                            size: 18,
                            IconBroken.Heart,
                            color: Colors.red,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Like',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
