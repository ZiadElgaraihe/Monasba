import 'package:monasba/network/helper/api.dart';
import 'package:monasba/network/models/place_model.dart';

class GetOnePlaceService {
  Future<PlaceModel> getOnePlace({
    required String id,
    required String token,
  }) async {
    Map<String, dynamic> data = await Api().get(
      restOfUrl: 'places/single/$id',
      token: token,
    );

    return PlaceModel.fromJson(data: data['data']['document']);
  }
}
