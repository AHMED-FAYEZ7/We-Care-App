import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:health_care/core/global/theme/app_color/color_manager.dart';

class RateWidget extends StatelessWidget {
  RateWidget({
    this.onRateSelected,
    this.rate = 3,
    this.itemSize = 12,
    this.itemPadding = 0,
    this.ignoreGestures = false,
    Key? key,
  }) : super(key: key);

  Function({int? selectedRate})? onRateSelected;

  double? rate;
  double? itemSize;
  double? itemPadding;
  bool ignoreGestures = false;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: rate!,
      itemSize: itemSize!,
      minRating: 1,
      ignoreGestures: ignoreGestures,
      direction: Axis.horizontal,
      unratedColor: ColorManager.lightGrey,
      itemCount: 5,
      itemPadding: EdgeInsets.symmetric(horizontal: itemPadding!),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        onRateSelected!(selectedRate: rating.toInt());
      },
    );
  }
}
