import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/widgets/rows/search_filter_row.dart';
import 'package:monasba/widgets/stacks/place_stack.dart';
import 'package:monasba/widgets/texts/page_definition.dart';
import 'package:monasba/widgets/texts/page_title.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.navBarScaffoldKey});

  final GlobalKey<ScaffoldState> navBarScaffoldKey;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: Scaffold(
          backgroundColor: lightBackground,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                navBarScaffoldKey.currentState!.openDrawer();
              },
              padding: EdgeInsets.zero,
              icon: SvgPicture.asset(
                'assets/icons/Outer_side_bar.svg',
                height: 3.8.h,
                width: 6.7.w,
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle.dark
                .copyWith(statusBarColor: Colors.transparent),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 3.8.h),
                  const PageTitle(
                      title: 'Hi Mohamed, Let\'s', pageMode: PageMode.light),
                  SizedBox(height: 0.3.h),
                  const PageDefinition(
                      title: 'Find the best place for you',
                      pageMode: PageMode.light),
                  SizedBox(height: 5.3.h),
                  SearchFilterRow(orientation: orientation),
                  SizedBox(height: 5.h),
                  SvgPicture.asset(
                    'assets/images/group_958.svg',
                    width:
                        orientation == Orientation.landscape ? 94.5.h : 91.1.w,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 3.8.h),
                  PlaceStack(orientation: orientation),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
