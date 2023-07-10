import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/cubits/saved_places_cubit/saved_places_cubit.dart';
import 'package:monasba/network/models/place_model.dart';
import 'package:monasba/pages/user%20pages/place%20pages/place_page.dart';
import 'package:monasba/widgets/containers/is_saved_container.dart';
import 'package:monasba/widgets/rows/location_row.dart';
import 'package:monasba/widgets/rows/rate_row.dart';
import 'package:monasba/widgets/texts/place_name_text.dart';
import 'package:sizer/sizer.dart';

class PlaceStack extends StatelessWidget {
  const PlaceStack({super.key, this.orientation, required this.places});

  final Orientation? orientation;
  final List<PlaceModel> places;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 6.7.w,
          mainAxisExtent: 32.h,
          crossAxisCount: orientation == Orientation.landscape ? 3 : 2),
      itemCount: places.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlacePage(
                  title: places[index].placeName,
                  image: places[index].image,
                  address: 'Port Said - Egypt',
                  rate: places[index].rate,
                  description: places[index].description,
                ),
              ));
        },
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 23.4.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(places[index].image),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 1.3.h),
                PlaceNameText(title: places[index].placeName),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const LocationRow(city: 'Port Said'),
                    const Spacer(),
                    RateRow(
                        rate: places[index].rate,
                        iconHeight: 1.9.h,
                        fontSize: 10.sp),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 1.3.h,
              right: 2.2.w,
              child: IsSavedContainer(
                onTap: () {
                  context
                      .read<SavedPlacesCubit>()
                      .addAndRemovePlaces(placeModel: places[index]);
                },
                isSaved: context
                    .read<SavedPlacesCubit>()
                    .savedPlaces
                    .any((savedPlace) => savedPlace.id == places[index].id),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
