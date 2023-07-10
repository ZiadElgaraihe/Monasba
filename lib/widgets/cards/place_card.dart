import 'package:flutter/material.dart';
import 'package:monasba/network/models/place_model.dart';
import 'package:monasba/widgets/buttons/inkwell%20buttons/circular_icon_button.dart';
import 'package:monasba/widgets/rows/location_row.dart';
import 'package:monasba/widgets/rows/rate_row.dart';
import 'package:monasba/widgets/texts/place_name_text.dart';
import 'package:sizer/sizer.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard(
      {super.key, required this.asset, required this.onCardTap, this.placeModel, required this.onCircularButtonTap});

  final String asset;
  final Function onCardTap, onCircularButtonTap;
  final PlaceModel? placeModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCardTap();
      },
      child: SizedBox(
        height: 9.5.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 9.5.h,
              width: 16.9.w,
              child: CircleAvatar(
                backgroundImage: AssetImage((placeModel != null)
                    ? placeModel!.image
                    : 'assets/images/hall 1.png'),
              ),
            ),
            SizedBox(width: 4.7.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlaceNameText(
                    title: (placeModel != null)
                        ? placeModel!.placeName
                        : 'Name of Place'),
                const LocationRow(city: 'Post Said', country: 'Egypt'),
                RateRow(
                    rate: (placeModel != null) ? placeModel!.rate : '4.5',
                    iconHeight: 1.9.h,
                    fontSize: 10.sp),
              ],
            ),
            const Spacer(),
            CircularIconButton(
              width: 6.7.w,
              height: 3.8.h,
              padding: EdgeInsets.all(0.25.h),
              asset: asset,
              onTap: onCircularButtonTap,
            ),
          ],
        ),
      ),
    );
  }
}
