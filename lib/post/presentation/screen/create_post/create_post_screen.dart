// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';
import 'package:health_care/core/widgets/app_bar_widget.dart';
import 'package:health_care/core/widgets/snack_bar_widget.dart';
import 'package:health_care/doctor/presentation/controller/doctor_cubit/doctor_cubit.dart';
import 'package:health_care/post/presentation/controller/post_cubit.dart';
import 'package:health_care/post/presentation/screen/create_post/widgets/pick_up_image_widget.dart';

class CreatePostScreen extends StatefulWidget {
  CreatePostScreen({
    this.image,
    Key? key,
  }) : super(key: key);

  File? image;

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  var titleController = TextEditingController();

  var desController = TextEditingController();

  selectedImage({File? image}) {
    widget.image = image;
  }

  String fileToBase64(File file) {
    List<int> fileBytes = file.readAsBytesSync();
    String fileType = getFileType(file);
    String dataUri = 'data:$fileType;base64,${base64Encode(fileBytes)}';
    return dataUri;
  }

  String getFileType(File file) {
    String fileName = file.path.toLowerCase();
    if (fileName.endsWith('.png')) {
      return 'image/png';
    } else if (fileName.endsWith('.jpg') || fileName.endsWith('.jpeg')) {
      return 'image/jpeg';
    }
    throw Exception('Unsupported image type');
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostCubit, PostState>(
      listener: (context, state) {
        if (state is CreatePostSuccessState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = PostCubit.get(context);
        return Scaffold(
          appBar: AppBarWidget(
            isBack: true,
            title: 'Create Post',
            isTextButton: true,
            textButton: 'Post',
            onTap: () async {
              if (widget.image == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBarWidget(
                    text: Text(
                      'please choose photo',
                      style: TextStyle(
                        color: ColorManager.white,
                        fontSize: AppSize.s16,
                      ),
                    ),
                    backGroundColor: ColorManager.error,
                  ),
                );
              } else {
                cubit.createPost(
                  titleController.text,
                  desController.text,
                  fileToBase64(widget.image!),
                );
              }
            },
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p12,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (state is CreatePostLoadingState)
                    LinearProgressIndicator(
                      color: ColorManager.primary,
                    ),
                  if (state is CreatePostLoadingState)
                    SizedBox(
                      height: 5,
                    ),
                  Card(
                    elevation: AppSize.s3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSize.s12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p12,
                        vertical: AppPadding.p2,
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 23,
                            backgroundImage: NetworkImage(
                              "https://idsb.tmgrup.com.tr/ly/uploads/images/2022/12/19/247181.jpg",
                            ),
                          ),
                          const SizedBox(
                            width: AppSize.s8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    child: Text(
                                      DoctorCubit.get(context)
                                              .doctorData
                                              ?.name ??
                                          '',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.check_circle,
                                    color: ColorManager.primary,
                                    size: 15,
                                  ),
                                ],
                              ),
                              const Text(
                                'public',
                                style: TextStyle(
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          'Title',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: 'Write your title here...',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 0, bottom: 5, top: 5, right: 0),
                        ),
                      ),
                      SizedBox(
                        height: AppSize.s10,
                      ),
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: Text(
                          'Description',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      TextFormField(
                        controller: desController,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        minLines: null,
                        decoration: InputDecoration(
                          hintText: 'Write your Description here...',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 0, bottom: 5, top: 5, right: 0),
                        ),
                      ),
                      PickUpImageWidget(
                        selectedImage: selectedImage,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
