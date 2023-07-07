import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/widgets/appbars/empty_appbar.dart';
import 'package:monasba/widgets/buttons/animated_buttons/animated_button.dart';
import 'package:monasba/widgets/modal%20bottom%20sheets/draggable_sheet.dart';
import 'package:sizer/sizer.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final List<LatLng> _latLng = [
    const LatLng(31.273459, 32.278385),
    const LatLng(31.273885, 32.287999),
    const LatLng(31.242166, 32.321259),
  ];

  List<ValueNotifier<String>> _markers = [];
  final ValueNotifier<int> _selectedMarkerIndex = ValueNotifier<int>(-1);
  final ValueNotifier<bool> _isVisible = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _markers = List.generate(
      _latLng.length,
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
                  center: _latLng[0],
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
                      _latLng.length,
                      (index) => Marker(
                        height: 6.5.h,
                        width: 11.9.w,
                        point: _latLng[index],
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
                  )
                ],
              ),
              Positioned(
                bottom: orientation == Orientation.landscape ? 12.h : 5.h,
                right: 2.2.w,
                child: SizedBox(
                  height: 6.6.h,
                  width: 11.7.w,
                  child: FloatingActionButton(
                      backgroundColor: darkBackground,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: SvgPicture.asset(
                        'assets/icons/map/navigate.svg',
                        height: 4.4.h,
                        width: 7.8.w,
                      ),
                      onPressed: () {}),
                ),
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
