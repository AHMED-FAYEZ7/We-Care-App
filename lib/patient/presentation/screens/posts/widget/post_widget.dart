import 'package:flutter/material.dart';
import 'package:health_care/core/global/resources/icons_manger.dart';
import 'package:health_care/core/global/resources/values_manger.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        elevation: AppSize.s0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
          side: const BorderSide(color: Colors.grey, width: AppSize.s1),
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
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Leo Missi',
                              style: TextStyle(
                                height: 1.4,
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
                          'march 25,2022',
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
              ),
              Text(
                'ascdcxasdcasecawse',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //     top: 5,
              //     bottom: 10,
              //   ),
              //   child: Container(
              //     width: double.infinity,
              //     child: Wrap(
              //       children: [
              //         Container(
              //           padding: EdgeInsetsDirectional.only(
              //             end: 8,
              //           ),
              //           height: 25,
              //           child: MaterialButton(
              //             onPressed: (){},
              //             minWidth: 1,
              //             padding: EdgeInsets.zero,
              //             child: Text(
              //               '#software',
              //               style: Theme.of(context).textTheme.caption!.copyWith(
              //                 color: defaultColor,
              //               ),
              //             ),
              //           ),
              //         ),
              //         Container(
              //           padding: EdgeInsetsDirectional.only(
              //             end: 8,
              //           ),
              //           height: 25,
              //           child: MaterialButton(
              //             onPressed: (){},
              //             minWidth: 1,
              //             padding: EdgeInsets.zero,
              //             child: Text(
              //               '#flutter-dev',
              //               style: Theme.of(context).textTheme.caption!.copyWith(
              //                 color: defaultColor,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // if(model.postImage != '')
              if (false)
                Padding(
                  padding: const EdgeInsetsDirectional.only(top: 15),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: NetworkImage(
                          "https://idsb.tmgrup.com.tr/ly/uploads/images/2022/12/19/247181.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 3,
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
                              Icon(
                                size: 18,
                                IconBroken.Heart,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '5',
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
                              Icon(
                                size: 18,
                                IconBroken.Chat,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '0 comment',
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
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey[300],
                ),
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
      ),
    );
  }
}
