import 'package:flutter/material.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/providers/filter_provider.dart';
import 'package:monasba/widgets/buttons/inkwell%20buttons/filter_back_button.dart';
import 'package:monasba/widgets/buttons/text%20buttons/ok_text_button.dart';
import 'package:monasba/widgets/containers/category_box.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FilterOccasion extends StatefulWidget {
  const FilterOccasion({super.key});

  @override
  State<FilterOccasion> createState() => _FilterOccasionState();
}

class _FilterOccasionState extends State<FilterOccasion> {
  List<String> _selectedOccasions = ['All'];

  @override
  void initState() {
    if (!context.read<FilterProvider>().categories.contains('All')) {
      _selectedOccasions = context.read<FilterProvider>().categories;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.4.w),
      margin: EdgeInsets.symmetric(horizontal: 4.4.w, vertical: 1.9.h),
      height: 33.3.h,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FilterBackButton(),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: 80.w,
                  height: 17.h,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    direction: Axis.horizontal,
                    children: List.generate(
                      occasions.length,
                      (index) => CategoryBox(
                        title: occasions[index],
                        isSelected:
                            _selectedOccasions.contains(occasions[index]),
                        selectedOccasions: _selectedOccasions,
                        onTap: () {
                          setState(() {
                            if (occasions[index] == "All") {
                              _selectedOccasions.clear();
                              _selectedOccasions.add("All");
                            } else if (_selectedOccasions.contains("All")) {
                              _selectedOccasions.clear();
                              _selectedOccasions.add(occasions[index]);
                            } else if (_selectedOccasions
                                .contains(occasions[index])) {
                              _selectedOccasions.remove(occasions[index]);
                            } else {
                              _selectedOccasions.add(occasions[index]);
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          OkTextButton(onPressed: () {
            context.read<FilterProvider>().setCategories(_selectedOccasions);
          }),
        ],
      ),
    );
  }
}
