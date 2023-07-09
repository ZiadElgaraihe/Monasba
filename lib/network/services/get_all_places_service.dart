import 'package:monasba/network/helper/api.dart';
import 'package:monasba/network/models/place_model.dart';

class GetAllPlacesService {
  Future<List<PlaceModel>> getAllPlaces({required String token}) async {
    Map<String, dynamic> data = await Api().get(
      restOfUrl: 'places',
      token: token,
    );

    List<PlaceModel> places = [];

    for (int index = 0; index < data['data']['documents'].length; index++) {
      places.add(PlaceModel.fromJson(data: data['data']['documents'][index]));
    }

    return places;
  }
}
