import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:sizer/sizer.dart';

import 'owner_package_info.dart';

class OwnerPackagePage extends StatelessWidget {
  const OwnerPackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: const AppBarDesign(pageMode: PageMode.light, title: 'Package'),
      body: GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OwnerPackageInfoPage(),
                ));
          },
          child: Container(
            height: 28.8.h,
            width: 41.1.w,
            alignment: AlignmentDirectional.bottomStart,
            margin: EdgeInsets.symmetric(horizontal: 4.4.w, vertical: 2.5.h),
            padding: EdgeInsets.symmetric(vertical: 2.5.h, horizontal: 2.2.w),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              'Package Name',
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
