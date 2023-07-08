import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const Color darkBackground = Color(0xFF000000);
const Color lightBackground = Color(0xFFFFFFFF);

const List<String> cities = [
  'Alexandria',
  'Aswan',
  'Asyut',
  'Beheira',
  'Beni Suef',
  'Cairo',
  'Damietta',
  'Dakahlia',
  'Faiyum',
  'Gharbia',
  'Giza',
  'Ismailia',
  'Kafr El Sheikh',
  'Luxor',
  'Matrouh',
  'Minya',
  'Monufia',
  'New Valley',
  'North Sinai',
  'Port Said',
  'Qalyubia',
  'Qena',
  'Red Sea',
  'Sharqia',
  'Sohag',
  'South Sinai',
  'Suez',
];

const List<String> genders = ['None', 'Male', 'Female'];

const List<String> payWith = ['Master Card', 'Credit Card', 'Paypal'];

const List<String> occasions = [
  "All",
  "Wedding",
  "Meeting",
  "Birth Date",
  "Launch",
  "Engagement",
  "Party"
];

const List<String> months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

const List<Map<String, String>> packageInfo = [
  {
    'title': 'The Menu',
    'content':
        '''4 pieces of gateau + service sale (mini pizza + baton sale + barazek)
Progress with
Roles cake for the newlyweds
More than (150 EGP ) per role
+ treasure + water bottle for each table'''
  },
  {
    'title': 'Photography',
    'content': '''2 full HD cameras + Mixer + LED screen + Cairo studio'''
  },
  {
    'title': 'Decor',
    'content':
        '''Kosha for the newlyweds + flower terrace + laser table + golden laser chair + dance flower + flower entrance + centerpiece'''
  },
  {
    'title': 'Singer',
    'content': '''DJ Al-Qasasen.
Wedding for the newlyweds.'''
  },
  {
    'title': 'Laser',
    'content': '''8 laser bar.
10 moving.'''
  },
  {'title': 'Excess Person', 'content': '''55,000 EGP'''},
  {
    'title': 'Note',
    'content': '''Photographer by agreement with the hall or studio.
The day party starts from 12 pm until 6 pm.'''
  }
];

List<Map<String, String>> personsAndPrices = [
  {
    'number of persons': '150',
    'price': '15750',
  },
  {
    'number of persons': '200',
    'price': '18500',
  },
];

enum PageMode {
  light,
  dark,
}

final ThemeData timePickerThemeData = ThemeData.dark().copyWith(
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: const MaterialStatePropertyAll(Colors.white),
      textStyle: MaterialStatePropertyAll(
        TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  ),
  timePickerTheme: TimePickerThemeData(
    backgroundColor: darkBackground,
    dayPeriodTextStyle: TextStyle(fontSize: 14.sp),
    dayPeriodShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(7.5),
    ),
    dayPeriodBorderSide: BorderSide(color: Colors.white, width: 0.25.w),
    dayPeriodColor: MaterialStateColor.resolveWith(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        } else {
          return Colors.black;
        }
      },
    ),
    dayPeriodTextColor: MaterialStateColor.resolveWith(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.black;
        } else {
          return Colors.white;
        }
      },
    ),
    dialTextColor: MaterialStateColor.resolveWith(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        } else {
          return Colors.black;
        }
      },
    ),
    dialHandColor: Colors.black,
    dialBackgroundColor: Colors.white,
    dialTextStyle: TextStyle(fontSize: 14.sp),
    helpTextStyle: TextStyle(fontSize: 10.sp),
    hourMinuteTextColor: MaterialStateColor.resolveWith(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.black;
        } else {
          return Colors.white;
        }
      },
    ),
    hourMinuteColor: MaterialStateColor.resolveWith(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Colors.white;
        } else {
          return Colors.black;
        }
      },
    ),
    hourMinuteTextStyle: TextStyle(fontSize: 50.sp),
    hourMinuteShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  ),
);
