// ignore_for_file: must_be_immutable, unrelated_type_equality_checks, avoid_print, prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/widgets/app_bar_widget.dart';
import 'package:health_care/patient/presentation/widgets/empty_list_widget.dart';
import 'package:health_care/post/presentation/controller/post_cubit.dart';
import 'package:health_care/post/presentation/widget/shimmer/comments_shimmer.dart';
import 'package:intl/intl.dart';

class CommentsWidget extends StatelessWidget {
  CommentsWidget({
    required this.postId,
    Key? key,
  }) : super(key: key);

  String postId;

  TextEditingController comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PostCubit.get(context);
        return Scaffold(
          appBar: AppBarWidget(
            isBack: true,
            title: 'Comments',
          ),
          body: Column(
            children: [
              Expanded(
                child: ConditionalBuilder(
                  condition: state is! GetAllCommentsLoadingState,
                  builder: (context) => cubit.comments.isNotEmpty
                      ? ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p12,
                          ),
                          itemBuilder: (context, index) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: AppSize.s25,
                                backgroundImage: NetworkImage(
                                  cubit
                                      .comments[index].userInfo!.profilePicture,
                                ),
                                backgroundColor: ColorManager.white,
                              ),
                              const SizedBox(
                                width: AppSize.s5,
                              ),
                              Flexible(
                                child: Card(
                                  elevation: AppSize.s3,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 5,
                                          bottom: 2,
                                          left: 8,
                                          right: 12,
                                        ),
                                        child: Text(
                                          cubit.comments[index].userInfo
                                                  ?.name ??
                                              '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayLarge,
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
                                              cubit.comments[index]
                                                  .commentContent,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium,
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
                                          "${DateFormat.jm().format(DateTime.parse(cubit.comments[index].createdAt))}  ${DateFormat.yMMMMd('en_US').format(DateTime.parse(cubit.comments[index].createdAt))}",
                                          style: TextStyle(
                                            fontSize: AppSize.s10,
                                          ),
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
                          itemCount: cubit.comments.length,
                        )
                      : EmptyListWidget(text: 'No comments here yet'),
                  fallback: (context) => CommentsShimmerWidget(),
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
                        onPressed: () async {
                          await cubit.createComment(
                            postId,
                            comment.text,
                          );
                          cubit.getComments(postId);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
