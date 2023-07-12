// ignore_for_file: must_be_immutable, unrelated_type_equality_checks

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/app/app_prefs.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/routes/app_routes.dart';
import 'package:health_care/core/services/services_locator.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/doctor/presentation/controller/doctor_cubit/doctor_cubit.dart';
import 'package:health_care/patient/presentation/widgets/empty_list_widget.dart';
import 'package:health_care/patient/presentation/widgets/search_bar_widget.dart';
import 'package:health_care/patient/presentation/widgets/shimmer/post_shimmer.dart';
import 'package:health_care/post/presentation/controller/post_cubit.dart';
import 'package:health_care/post/presentation/widget/post_widget.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostsScreen extends StatefulWidget {
  PostsScreen({
    // required this.name,
    // required this.docId,
    // required this.imageUrl,
    this.isRefresh = false,
    Key? key,
  }) : super(key: key);
  bool isRefresh = false;
  String? comment;

  final AppPreferences _appPreferences = sl<AppPreferences>();
  String? type;

  getType() async {
    type = await _appPreferences.getType();
  }

  // String docId;
  // String imageUrl;
  // String name;

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  handleComment({String? comment}) {
    widget.comment = comment;
  }

  @override
  void initState() {
    super.initState();
    widget.getType();
    if (widget.isRefresh == false) {
      PostCubit.get(context).getAllBlogs(const NoParameters());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        if (state is GetAllBlogsSuccessState ||
            state is GetAllBlogsFailureState) {
          widget.isRefresh = true;
        }
      },
      builder: (context, state) {
        var cubit = PostCubit.get(context);
        return Scaffold(
          body: Column(
            children: [
              if (widget.type == 'Doctor')
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppPadding.p12,
                  ),
                  child: Card(
                    elevation: AppSize.s3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p12,
                        vertical: AppPadding.p2,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 23,
                                backgroundImage: NetworkImage(
                                  "https://idsb.tmgrup.com.tr/ly/uploads/images/2022/12/19/247181.jpg",
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width * .62,
                                child: SearchBarWidget(
                                  readOnly: true,
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.createPostRoute,
                                    );
                                  },
                                  hintText: 'What\'s on Your mind?',
                                ),
                              ),
                              const Icon(
                                Icons.photo_camera_outlined,
                                size: AppSize.s30,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              Expanded(
                child: ConditionalBuilder(
                  condition: widget.isRefresh != false,
                  builder: (context) =>
                  cubit.allBlogs.isNotEmpty
                      ? SmartRefresher(
                    controller: _refreshController,
                    onRefresh: () async {
                      // Perform refresh logic here
                      // For example, call cubit.getAllBlogs() again
                      await cubit.getAllBlogs(const NoParameters());
                      _refreshController.refreshCompleted();
                    },
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p12,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) =>
                          PostWidget(
                            model: cubit.allBlogs[index],
                            // getComments: () {
                            //   cubit.getComments(cubit.allBlogs[index].blogId);
                            // },
                            // getLikes: () {
                            //   cubit.getLikes(cubit.allBlogs[index].blogId);
                            // },
                            // like: () {
                            //   cubit.createLike(cubit.allBlogs[index].blogId);
                            // },
                            // disLike: () {
                            //   cubit.createDisLike(
                            //       cubit.allBlogs[index].blogId);
                            // },
                            // comment: () {
                            //   cubit.createComment(
                            //     cubit.allBlogs[index].blogId,
                            //     widget.comment!,
                            //   );
                            // },
                            // likes: cubit.likes,
                            // comments: state is GetAllCommentsSuccessState
                            //     ? cubit.comments
                            //     : cubit.comments,
                            // handelComment: handleComment,
                          ),
                      separatorBuilder:
                          (BuildContext context, int index) =>
                      const SizedBox(
                        width: AppSize.s10,
                      ),
                      itemCount: cubit.allBlogs.length,
                    ),
                  )
                      : EmptyListWidget(
                    text: 'No Posts Loaded',
                  ),
                  fallback: (context) => PostsShimmerWidget(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
