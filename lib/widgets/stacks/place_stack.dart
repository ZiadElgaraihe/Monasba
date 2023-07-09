import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/network/models/place_model.dart';
import 'package:monasba/pages/user%20pages/place%20pages/place_page.dart';
import 'package:monasba/widgets/rows/location_row.dart';
import 'package:monasba/widgets/rows/rate_row.dart';
import 'package:monasba/widgets/texts/place_name_text.dart';
import 'package:sizer/sizer.dart';

class PlaceStack extends StatelessWidget {
  const PlaceStack({super.key, this.orientation, this.places});

  final Orientation? orientation;
  final List<PlaceModel>? places;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 6.7.w,
          mainAxisExtent: 32.h,
          crossAxisCount: orientation == Orientation.landscape ? 3 : 2),
      itemCount: places != null ? places!.length : listOfPlaces.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlacePage(
                  title: places != null
                      ? places![index].placeName
                      : listOfPlaces[index]['place name']!,
                  image: places != null
                      ? places![index].image
                      : listOfPlaces[index]['img']!,
                  address: 'Port Said - Egypt',
                  rate: places != null
                      ? '${places![index].rate}'
                      : listOfPlaces[index]['rate']!,
                  description: places != null
                      ? places![index].description
                      : 'Lorem ipsum dolor sit amet consectetur. Volutpat sed sem tellus tellus quisque. Blandit praesent fusce vulputate nulla egestas ultrices diam. Lectus nulla ipsum turpis sed enim eu nibh amet sed.',
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
                      image: AssetImage(places != null
                          ? places![index].image
                          : listOfPlaces[0]['img']!),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 1.3.h),
                PlaceNameText(
                    title: places != null
                        ? places![index].placeName
                        : listOfPlaces[index]['place name']!),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const LocationRow(city: 'Port Said'),
                    const Spacer(),
                    RateRow(
                        rate: places != null
                            ? '${places![index].rate}'
                            : listOfPlaces[index]['rate']!,
                        iconHeight: 1.9.h,
                        fontSize: 10.sp),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 1.3.h,
              right: 2.2.w,
              child: Container(
                width: 8.3.w,
                height: 4.7.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF343434),
                ),
                child: Padding(
                  padding: EdgeInsets.all(0.5.h),
                  child: SvgPicture.asset(
                      'assets/icons/bookmarks/bookmark_fill_active.svg'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
