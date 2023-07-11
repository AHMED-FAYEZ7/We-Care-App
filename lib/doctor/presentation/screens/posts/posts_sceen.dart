// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/routes/app_routes.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/core/widgets/post_widget.dart';
import 'package:health_care/doctor/presentation/controller/doctor_cubit/doctor_cubit.dart';
import 'package:health_care/patient/presentation/widgets/empty_list_widget.dart';
import 'package:health_care/patient/presentation/widgets/search_bar_widget.dart';
import 'package:health_care/patient/presentation/widgets/shimmer/post_shimmer.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostsDoctorScreen extends StatefulWidget {
  PostsDoctorScreen({this.isRefresh = false, Key? key}) : super(key: key);
  bool isRefresh = false;

  @override
  State<PostsDoctorScreen> createState() => _PostsDoctorScreenState();
}

class _PostsDoctorScreenState extends State<PostsDoctorScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    if (widget.isRefresh == false) {
      DoctorCubit.get(context).getAllBlogs(const NoParameters());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {
        if (state is GetAllBlogsSuccessState ||
            state is GetAllBlogsFailureState) {
          widget.isRefresh = true;
        }
      },
      builder: (context, state) {
        var cubit = DoctorCubit.get(context);
        return Scaffold(
          body: Column(
            children: [
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
                              width: MediaQuery.of(context).size.width * .62,
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
                  builder: (context) => cubit.allBlogs.isNotEmpty
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
