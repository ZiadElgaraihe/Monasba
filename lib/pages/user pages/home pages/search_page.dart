import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/pages/user%20pages/place%20pages/place_page.dart';
import 'package:monasba/widgets/appbars/empty_appbar.dart';
import 'package:monasba/widgets/cards/place_card.dart';
import 'package:monasba/widgets/rows/search_filter_row.dart';
import 'package:sizer/sizer.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  static String id = '/search page';

  @override
  Widget build(BuildContext context) {
    final String searchText =
        ModalRoute.of(context)!.settings.arguments.toString();
    return OrientationBuilder(
      builder: (context, orientation) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: Scaffold(
          backgroundColor: lightBackground,
          appBar: const EmptyAppBar(pageMode: PageMode.light),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.2.w),
            child: Column(
              children: [
                SizedBox(height: 3.8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.2.w),
                  child: SearchFilterRow(
                      searchText: searchText, orientation: orientation),
                ),
                SizedBox(height: 1.9.h),
                Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 1.9.h, horizontal: 2.2.w),
                      child: PlaceCard(
                        onCircularButtonTap: () {},
                        asset: 'assets/icons/bookmarks/bookmark_fill.svg',
                        onCardTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PlacePage(
                                title: 'Name of Place',
                                image: 'assets/images/hall 1.png',
                                address: 'Port Said',
                                rate: '5.0',
                                description:
                                    'Lorem ipsum dolor sit amet consectetur. Volutpat sed sem tellus tellus quisque. Blandit praesent fusce vulputate nulla egestas ultrices diam. Lectus nulla ipsum turpis sed enim eu nibh amet sed.',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
