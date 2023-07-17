import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/widgets/app_bar_widget.dart';
import 'package:health_care/patient/presentation/widgets/empty_list_widget.dart';
import 'package:health_care/post/presentation/controller/post_cubit.dart';
import 'package:health_care/post/presentation/widget/post_widget.dart';
import 'package:health_care/post/presentation/widget/shimmer/post_shimmer.dart';

class DoctorPostsScreen extends StatelessWidget {
  const DoctorPostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = PostCubit.get(context);
        return Scaffold(
          appBar: AppBarWidget(
            isBack: true,
            title: 'Posts',
          ),
          body: Column(
            children: [
              Expanded(
                child: ConditionalBuilder(
                  condition: state is! GetDoctorPostsLoadingState,
                  builder: (context) => cubit.doctorBlogs.isNotEmpty
                      ? ListView.separated(
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p12,
                          ),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) =>
                              PostWidget(
                            model: cubit.doctorBlogs[index],
                            type: 'Patient',
                          ),
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                            width: AppSize.s10,
                          ),
                          itemCount: cubit.doctorBlogs.length,
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
