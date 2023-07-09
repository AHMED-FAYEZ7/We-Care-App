// ignore_for_file: must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/usecase/base_usecase.dart';
import 'package:health_care/patient/presentation/controller/Patient_cubit/patient_cubit.dart';
import 'package:health_care/patient/presentation/screens/posts/widget/post_widget.dart';
import 'package:health_care/patient/presentation/widgets/empty_list_widget.dart';
import 'package:health_care/patient/presentation/widgets/shimmer/post_shimmer.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostsPatientScreen extends StatefulWidget {
  PostsPatientScreen({this.isRefresh = false, Key? key}) : super(key: key);
  bool isRefresh = false;

  @override
  State<PostsPatientScreen> createState() => _PostsPatientScreenState();
}

class _PostsPatientScreenState extends State<PostsPatientScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    if (widget.isRefresh == false) {
      PatientCubit.get(context).getAllBlogs(const NoParameters());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientState>(
      listener: (context, state) {
        if (state is GetAllBlogsSuccessState ||
            state is GetAllBlogsFailureState) {
          widget.isRefresh = true;
        }
      },
      builder: (context, state) {
        var cubit = PatientCubit.get(context);
        return Scaffold(
          body: Column(
            children: [
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
