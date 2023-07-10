class PlaceModel {
  final String id;
  final String owner;
  final String placeName;
  final String address;
  final String rate;
  final String image;
  final String description;
  final List<dynamic> halls;

  PlaceModel({
    required this.id,
    required this.owner,
    required this.placeName,
    required this.address,
    required this.rate,
    required this.image,
    required this.description,
    required this.halls,
  });

  factory PlaceModel.fromJson({required Map<String, dynamic> data}) {
    return PlaceModel(
      id: data['_id'],
      owner: data['owner'],
      placeName: data['placeName'],
      address: data['address'],
      rate: '${data['starNumber']}.0',
      image: 'assets/images/places/${data['cover']}',
      description: data['desc'],
      halls: data['halls'],
    );
  }
}
