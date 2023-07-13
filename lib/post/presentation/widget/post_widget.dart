// ignore_for_file: unrelated_type_equality_checks, avoid_print, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/app/app_prefs.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/core/utils/constants.dart';
import 'package:health_care/core/widgets/divider_widget.dart';
import 'package:health_care/doctor/domain/model/blog_model.dart';
import 'package:health_care/doctor/presentation/controller/doctor_cubit/doctor_cubit.dart';
import 'package:health_care/patient/presentation/controller/Patient_cubit/patient_cubit.dart';
import 'package:health_care/post/presentation/controller/post_cubit.dart';
import 'package:health_care/post/presentation/screen/comments/comments.dart';
import 'package:health_care/post/presentation/screen/likes/likes.dart';
import 'package:intl/intl.dart';

class PostWidget extends StatefulWidget {
  PostWidget({
    this.isLike = false,
    required this.model,
    this.handelComment,
    required this.type,
    Key? key,
  }) : super(key: key);

  Blog model;
  bool isLike = false;
  Function({String? comment})? handelComment;
  Color? likeColor;
  String? type;

  // final AppPreferences _appPreferences = sl<AppPreferences>();
  // getType() async {
  //   type = await _appPreferences.getType();
  // }

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PostCubit.get(context);

        // getLikeColor() async {
        //   if (await _appPreferences.getType() == 'Doctor') {
        //     bool doctorExists = cubit.likes.any(
        //       (user) =>
        //           user.userInfo!.id == DoctorCubit.get(context).doctorData!.id,
        //     );
        //     if (doctorExists) {
        //       widget.likeColor = ColorManager.primary;
        //       return widget.likeColor;
        //     } else {
        //       widget.likeColor = Colors.red;
        //       return widget.likeColor;
        //     }
        //   } else {
        //     bool patientExists = cubit.likes.any(
        //       (user) =>
        //           user.userInfo!.id ==
        //           PatientCubit.get(context).patientData!.id,
        //     );
        //     if (patientExists) {
        //       widget.likeColor = ColorManager.primary;
        //       return widget.likeColor;
        //     } else {
        //       widget.likeColor = Colors.red;
        //       return widget.likeColor;
        //     }
        //   }
        // }

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
                        widget.model.doctorInfo?.profilePicture ??
                            Constants.defaultDoctorImage,
                      ),
                      backgroundColor: ColorManager.white,
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
                                  widget.model.doctorInfo!.name,
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
                                .format(DateTime.parse(widget.model.createdAt)),
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
                if (widget.model.blogTitle != '')
                  Text(
                    "${widget.model.blogTitle}: ",
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
                if (widget.model.blogDescription != '')
                  Text(
                    widget.model.blogDescription,
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
                            '#doctor',
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
                            '#patient-recovery',
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
                        widget.model.imageData!.imageUrl,
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
                                  "${widget.model.numLikes}",
                                  style: Theme.of(context).textTheme.caption,
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            cubit.getLikes(widget.model.blogId);
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
                            cubit.getComments(widget.model.blogId);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CommentsWidget(
                                  postId: widget.model.blogId,
                                ),
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
                                  "${widget.model.numComments}",
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
                          cubit.getComments(widget.model.blogId);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CommentsWidget(
                                postId: widget.model.blogId,
                              ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundImage: NetworkImage(
                                widget.type == 'Doctor'
                                    ? DoctorCubit.get(context)
                                            .doctorData
                                            ?.profilePicture ??
                                        Constants.defaultDoctorImage
                                    : PatientCubit.get(context)
                                            .patientData
                                            ?.profilePicture ??
                                        Constants.defaultPatientImage,
                              ),
                              backgroundColor: ColorManager.white,
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
                        // print(await _appPreferences.getType());
                        await cubit.createLike(widget.model.blogId);
                      },
                      child: Row(
                        children: [
                          Icon(
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
