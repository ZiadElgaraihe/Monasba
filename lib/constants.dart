import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
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

final List<LatLng> latLng = [
  const LatLng(31.273027, 32.282245), //جراند لامور
  const LatLng(31.273459, 32.278385), //بوريفاج
  const LatLng(31.273707, 32.280204), //لاجولي
  const LatLng(31.272385, 32.293086), //الزفاف الملكي
  const LatLng(31.270677, 32.310852), //بونسور
  const LatLng(31.268068, 32.301523), //الأوركيدا
  const LatLng(31.273354, 32.295463), //الؤلؤة
  const LatLng(31.266472, 32.303633), //سهر الليالي
  const LatLng(31.260390, 32.300456), //الفرنسية
  const LatLng(31.272855, 32.293532), //اكاسيا
  const LatLng(31.272157, 32.294702), //كونكورد
  const LatLng(31.271859, 32.294214), //فور سيزون
];

List<String> ids = [
  '64a34c2d71f86a31d8168bf9',//جراند لامور
  '64a3491771f86a31d8168bcf',//بوريفاج
  '64a3336e71f86a31d8168bb5',//لاجولي
  '64a332f071f86a31d8168bac',//الزفاف الملكي
  '64a3479071f86a31d8168bbd',//بونسور
  '64a3484371f86a31d8168bc3',//الأوركيدا
  '64a348d371f86a31d8168bc9',//الؤلؤة
  '64a349cf71f86a31d8168bd8',//سهر الليالي
  '64a34a3971f86a31d8168be1',//الفرنسية
  '64a34eba71f86a31d8168c08',//اكاسيا
  '64a34b8271f86a31d8168bf0',//كونكورد
  '64a34af971f86a31d8168be7',//فور سيزون
];

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

List<Map<String, dynamic>> halls = [
  {
    'hall name': 'Sofitel Winter',
    'city': 'city',
    'rate': '4.5',
    'img': 'assets/images/hall 8.png',
  },
  {
    'hall name': 'Ramses Hall',
    'city': 'city',
    'rate': '4.0',
    'img': 'assets/images/hall 9.png',
  },
  {
    'hall name': 'Hatshepsut Hall',
    'city': 'city',
    'rate': '5.0',
    'img': 'assets/images/hall 10.png',
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
