import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/cubits/get_one_place_cubitcubit/get_one_place_cubit.dart';
import 'package:monasba/widgets/appbars/empty_appbar.dart';
import 'package:monasba/widgets/buttons/animated_buttons/animated_button.dart';
import 'package:monasba/widgets/buttons/floating%20action%20buttons/navigate_button.dart';
import 'package:monasba/widgets/modal%20bottom%20sheets/draggable_sheet.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<ValueNotifier<String>> _markers = [];
  final ValueNotifier<int> _selectedMarkerIndex = ValueNotifier<int>(-1);
  final ValueNotifier<bool> _isVisible = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _markers = List.generate(
      latLng.length,
      (_) => ValueNotifier<String>('assets/icons/map/markers/hall_marker.svg'),
    );
  }

  void handleMarkerTap(int index) {
    if (_selectedMarkerIndex.value != index) {
      if (_selectedMarkerIndex.value != -1) {
        _markers[_selectedMarkerIndex.value].value =
            'assets/icons/map/markers/hall_marker.svg';
      }
      _selectedMarkerIndex.value = index;
      _markers[index].value = 'assets/icons/map/markers/marker.svg';
    }
    context.read<GetOnePlaceCubit>().getOnePlace(
          id: ids[index],
          token:
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2NDhlMTczODdkODVmMzI2OTQ4NTVkN2IiLCJpYXQiOjE2ODg5Mzk2MzEsImV4cCI6MTY5NjcxNTYzMX0.CDtK72U8XUz12A-n-G_vmyX6co0LbrpSylC-kxKYe0I',
        );
    _isVisible.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          appBar: const EmptyAppBar(pageMode: PageMode.light),
          body: Stack(
            children: [
              FlutterMap(
                options: MapOptions(
                  zoom: 15,
                  center: latLng[0],
                  maxZoom: 18,
                  minZoom: 5,
                ),
                children: [
                  GestureDetector(
                    onTap: () {
                      _isVisible.value = false;
                    },
                    child: TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    ),
                  ),
                  MarkerLayer(
                    markers: List.generate(
                      latLng.length,
                      (index) => Marker(
                        height: 6.5.h,
                        width: 11.9.w,
                        point: latLng[index],
                        builder: (context) => ValueListenableBuilder(
                          valueListenable: _markers[index],
                          builder: (context, value, child) => GestureDetector(
                            onTap: () {
                              handleMarkerTap(index);
                            },
                            child: SvgPicture.asset(
                              value,
                              height: 5.3.h,
                              width: 6.9.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: orientation == Orientation.landscape ? 12.h : 5.h,
                right: 2.2.w,
                child: NavigateButton(),
              ),
              Positioned(
                  top: orientation == Orientation.landscape ? 2.5.h : 3.8.h,
                  right: 2.2.w,
                  child: AnimatedButton(orientation: orientation)),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: ValueListenableBuilder(
                  valueListenable: _isVisible,
                  builder: (context, value, child) => DraggableSheet(
                    isVisible: value,
                    orientation: orientation,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
