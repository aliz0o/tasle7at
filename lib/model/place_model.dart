import 'geometry_model.dart';

class PlaceModel {
  final GeometryModel geometry;
  final String name;
  final String vicinity;
  PlaceModel({this.geometry, this.name, this.vicinity});

  factory PlaceModel.fromJson(Map<String, dynamic> parsedJson) {
    return PlaceModel(
        geometry: GeometryModel.fromJson(parsedJson['geometry']),
        name: parsedJson['formatted_address'],
        vicinity: parsedJson['vicinity']);
  }
}
