import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/constants.dart';
import 'package:monasba/cubits/saved_places_cubit/saved_places_cubit.dart';
import 'package:monasba/pages/user%20pages/place%20pages/place_page.dart';
import 'package:monasba/widgets/appbars/appbar_design.dart';
import 'package:monasba/widgets/cards/place_card.dart';
import 'package:sizer/sizer.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackground,
      appBar: const AppBarDesign(pageMode: PageMode.light, title: 'Saved'),
      body: BlocBuilder<SavedPlacesCubit, SavedPlacesState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: context.read<SavedPlacesCubit>().savedPlaces.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(top: 3.8.h, left: 4.4.w, right: 4.4.w),
              child: PlaceCard(
                placeModel: context.read<SavedPlacesCubit>().savedPlaces[index],
                asset: 'assets/icons/Close_round.svg',
                onCircularButtonTap: () {
                  context.read<SavedPlacesCubit>().removePlaces(index: index);
                },
                onCardTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlacePage(
                        title: context
                            .read<SavedPlacesCubit>()
                            .savedPlaces[index]
                            .placeName,
                        image: context
                            .read<SavedPlacesCubit>()
                            .savedPlaces[index]
                            .image,
                        address: 'Port Said - Egypt',
                        rate: context
                            .read<SavedPlacesCubit>()
                            .savedPlaces[index]
                            .rate,
                        description: context
                            .read<SavedPlacesCubit>()
                            .savedPlaces[index]
                            .description,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
