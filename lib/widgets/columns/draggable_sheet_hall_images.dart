import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DraggableSheetImages extends StatelessWidget {
  const DraggableSheetImages({super.key, required this.orientation, required this.image});

  final Orientation orientation;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: orientation == Orientation.landscape ? 35.9.h : 41.9.w,
          height: orientation == Orientation.landscape ? 20.h : 18.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.black,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(image),
            ),
          ),
        ),
        SizedBox(height: 0.8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            3,
            (index) => Container(
              width: orientation == Orientation.landscape ? 13.1.h : 13.1.w,
              height: orientation == Orientation.landscape ? 7.6.h : 5.6.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(image),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
