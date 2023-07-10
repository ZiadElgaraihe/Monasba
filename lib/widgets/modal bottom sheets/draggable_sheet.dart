import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/cubits/get_one_place_cubitcubit/get_one_place_cubit.dart';
import 'package:monasba/widgets/rows/draggable_sheet_hall_info.dart';
import 'package:monasba/widgets/rows/draggable_sheet_hall_review.dart';
import 'package:sizer/sizer.dart';

class DraggableSheet extends StatelessWidget {
  const DraggableSheet(
      {super.key, required this.isVisible, required this.orientation});

  final bool isVisible;
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: 50,
      height: isVisible
          ? ((orientation == Orientation.portrait) ? 100.h : 70.w)
          : 0,
      curve: Curves.easeInOut,
      child: DraggableScrollableSheet(
        minChildSize: orientation == Orientation.portrait ? 0.313 : 0.75,
        maxChildSize: orientation == Orientation.portrait ? 0.666 : 1,
        initialChildSize: orientation == Orientation.portrait ? 0.313 : 0.75,
        builder: (context, scrollController) => Container(
          padding: EdgeInsets.only(left: 3.8.w, right: 2.2.w),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: SingleChildScrollView(
            controller: scrollController,
            child: BlocBuilder<GetOnePlaceCubit, GetOnePlaceState>(
              builder: (context, state) {
                if(state is GetOnePlaceSuccess){
                  return Column(
                    children: [
                      SizedBox(height: 1.3.h),
                      Container(
                        width: 17.8.w,
                        height: 0.6.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SizedBox(height: 2.5.h),
                      DraggableSheetHallInfo(orientation: orientation, placeModel: state.placeModel),
                      SizedBox(height: 3.8.h),
                      DraggableSheetHallReview(orientation: orientation, placeModel: state.placeModel),
                      orientation == Orientation.landscape
                          ? SizedBox(height: 20.w)
                          : const SizedBox(),
                    ],
                  );
                }else {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
