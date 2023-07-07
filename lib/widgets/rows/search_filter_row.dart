import 'package:flutter/material.dart';
import 'package:monasba/widgets/buttons/inkwell%20buttons/circular_icon_button.dart';
import 'package:monasba/widgets/fields/textformfields/search_text_form_field.dart';
import 'package:monasba/widgets/modal%20bottom%20sheets/filter%20modal%20bottom%20sheets/filter_home.dart';
import 'package:sizer/sizer.dart';

class SearchFilterRow extends StatefulWidget {
  const SearchFilterRow(
      {super.key, this.searchText, required this.orientation});

  final String? searchText;
  final Orientation orientation;

  @override
  State<SearchFilterRow> createState() => _SearchFilterRowState();
}

class _SearchFilterRowState extends State<SearchFilterRow> {
  TextEditingController controller = TextEditingController();
  ValueNotifier<bool> containText = ValueNotifier<bool>(false);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SearchTextFormField(
            searchText: widget.searchText, orientation: widget.orientation),
        CircularIconButton(
          width: 8.9.w,
          height: 5.h,
          asset: 'assets/icons/Filter.svg',
          onTap: () {
            final AnimationController controller = AnimationController(
              duration: const Duration(milliseconds: 750),
              vsync: Navigator.of(context),
            );
            showModalBottomSheet(
              context: context,
              barrierColor: Colors.white.withOpacity(0.3),
              backgroundColor: Colors.transparent,
              builder: (context) => const FilterHome(),
              transitionAnimationController: controller,
            );
            controller.forward();
          },
        ),
      ],
    );
  }
}
