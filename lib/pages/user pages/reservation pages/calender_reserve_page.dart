import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/cubits/reservation_cubit/reservation_cubit.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/buttons/elevated%20buttons/colored_button.dart';
import 'package:monasba/widgets/calenders/date_picker_calender.dart';
import 'package:monasba/widgets/containers/reservation%20animated%20containers/date_reserve_animated_container.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CalenderReservePage extends StatefulWidget {
  const CalenderReservePage({super.key});

  static String id = '/calender reserve page';

  @override
  State<CalenderReservePage> createState() => _CalenderReservePageState();
}

class _CalenderReservePageState extends State<CalenderReservePage> {
  final ValueNotifier<bool> _isVisible = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: const AppBarDesign(pageMode: PageMode.light),
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                DatePickerCalender(
                  selectionMode: DateRangePickerSelectionMode.single,
                  onSelectionChanged: _selectDay,
                ),
                SizedBox(height: 32.9.h),
                Stack(
                  children: [
                    ColoredButton(
                      title: 'Book Now',
                      pageMode: PageMode.light,
                      onPressed: () {
                        _isVisible.value = true;
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
          Positioned(
            bottom: 2.7.h,
            child: ValueListenableBuilder(
              valueListenable: _isVisible,
              builder: (context, value, child) =>
                  DateReserveAnimatedContainer(isVisible: _isVisible),
            ),
          ),
        ],
      ),
    );
  }

  void _selectDay(
      DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
    BlocProvider.of<ReservationCubit>(context, listen: false).selectDay(
      DateFormat('dd MMMM yyyy')
          .format(dateRangePickerSelectionChangedArgs.value),
    );
  }
}
