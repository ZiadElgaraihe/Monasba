import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasba/pages/user%20pages/home%20pages/search_page.dart';
import 'package:sizer/sizer.dart';

class SearchTextFormField extends StatefulWidget {
  const SearchTextFormField(
      {super.key, this.searchText, required this.orientation});

  final String? searchText;
  final Orientation orientation;

  @override
  State<SearchTextFormField> createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {
  TextEditingController controller = TextEditingController();
  ValueNotifier<bool> containText = ValueNotifier<bool>(false);

  @override
  void initState() {
    controller.text = widget.searchText ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.orientation == Orientation.landscape ? 80.h : 73.3.w,
      height: 5.8.h,
      padding: EdgeInsets.symmetric(horizontal: 2.2.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.black),
      child: TextField(
        controller: controller,
        onChanged: (value) {
          if (controller.text.isNotEmpty) {
            containText.value = true;
          } else {
            containText.value = false;
          }
        },
        cursorColor: Colors.white,
        style: TextStyle(color: Colors.white, fontSize: 14.sp),
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 1.1.h),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
          prefixIcon: IconButton(
            onPressed: null,
            padding: EdgeInsets.zero,
            icon: SvgPicture.asset('assets/icons/search.svg', height: 3.8.h),
          ),
          suffixIcon: ValueListenableBuilder(
            valueListenable: containText,
            builder: (context, value, child) => IconButton(
              onPressed: value
                  ? () {
                      Navigator.pushNamed(context, SearchPage.id,
                          arguments: controller.text);
                    }
                  : null,
              padding: EdgeInsets.zero,
              icon: SvgPicture.asset(
                'assets/icons/trends/Left.svg',
                height: 3.8.h,
                colorFilter: ColorFilter.mode(
                    value ? Colors.white : Colors.grey, BlendMode.srcATop),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
