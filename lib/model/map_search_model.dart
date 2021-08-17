class MapSearchModel {
  MapSearchModel({
    this.description,
    this.placeId,
  });

  final String description;
  final String placeId;

  factory MapSearchModel.fromJson(Map<String, dynamic> json) {
    return MapSearchModel(
      description: json['description'],
      placeId: json['place_id'],
    );
  }
}
