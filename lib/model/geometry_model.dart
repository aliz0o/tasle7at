import 'location_model.dart';

class GeometryModel {
  final LocationModel locationModel;
  GeometryModel({this.locationModel});

  factory GeometryModel.fromJson(Map<dynamic, dynamic> parsedJson) {
    return GeometryModel(
        locationModel: LocationModel.fromJson(parsedJson['location']));
  }
}
