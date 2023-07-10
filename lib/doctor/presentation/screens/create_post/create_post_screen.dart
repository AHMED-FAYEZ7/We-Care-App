import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/widgets/app_bar_widget.dart';
import 'package:health_care/doctor/presentation/controller/doctor_cubit/doctor_cubit.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBarWidget(
            isBack: true,
            title: 'Create Post',
          ),
        );
      },
    );
  }
}
