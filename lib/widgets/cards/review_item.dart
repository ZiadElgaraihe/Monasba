import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasba/widgets/texts/truncated_text.dart';
import 'package:sizer/sizer.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.9.h, horizontal: 4.4.w),
      padding: EdgeInsets.all(2.2.w),
      width: double.infinity,
      height: 21.1.h,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0x40000000)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 13.6.h,
            child: Row(
              children: [
                Container(
                  height: 12.3.h,
                  width: 24.6.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/Rectangle 4233.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(width: 2.2.w),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const TruncatedText(
                          title:
                              'Lorem ipsum dolor sit amet consectetur. Iaculis '
                              'tortor diam nunc ante placerat condimentum purus.'
                              ' Mi tortor sed maecenas at magna aliquam ut ipsum.'
                              ' Tristique interdum facilisis libero pellentesque'),
                      SizedBox(
                        height: 2.5.h,
                        child: Row(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) => SvgPicture.asset(
                                'assets/icons/star_colored.svg',
                                height: 1.7.h,
                                width: 3.3.w,
                                colorFilter: const ColorFilter.mode(
                                  Color(0xFFff9529),
                                  BlendMode.srcATop,
                                ),
                              ),
                            ),
                            SizedBox(width: 0.6.w),
                            Text(
                              '5.0',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 9.sp),
                            ),
                            const Spacer(),
                            Text(
                              '5 days',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF686868),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Text(
            'Name of place',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
