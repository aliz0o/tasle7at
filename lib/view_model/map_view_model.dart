import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tasle7at/model/map_search_model.dart';
import 'dart:developer';
import 'dart:convert' as converter;
import 'package:http/http.dart' as http;
import 'package:tasle7at/model/place_model.dart';

class MapViewModel extends GetxController {
  final marker = Marker(markerId: MarkerId('marker')).obs;
  final normal = true.obs;
  addMarker(LatLng pos) {
    marker.value = Marker(
      markerId: MarkerId('marker'),
      position: pos,
    );
    log('$pos');
    log('$marker.value.infoWindow');
  }

  changeType() {
    normal.value ? normal.value = false : normal.value = true;
  }

  List<MapSearchModel> searchResult = <MapSearchModel>[].obs;
  getAutoComplete(String search) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=AIzaSyDvx0fn5lvoXo6Xqgiz_M8OMAR29b5zl0A';
    var response = await http.get(Uri.parse(url));
    var json = converter.jsonDecode(response.body);
    var jsonResult = json['predictions'] as List;
    List<MapSearchModel> temp = [];
    temp = jsonResult.map((place) => MapSearchModel.fromJson(place)).toList();
    searchResult.clear();
    for (int count = 0; count < temp.length; count++)
      searchResult.add(temp[count]);
    log(temp[0].placeId);
    update();
  }

  final lat = 31.963158.obs;
  final lng = 35.930359.obs;

  getPlace(String placeId) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=AIzaSyDvx0fn5lvoXo6Xqgiz_M8OMAR29b5zl0A';
    var response = await http.get(Uri.parse(url));
    var json = converter.jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String, dynamic>;
    var result = PlaceModel.fromJson(jsonResult);
    lat.value = result.geometry.locationModel.lat;
    lng.value = result.geometry.locationModel.lng;
    update();
    log('${lat.value}');
    log('${lng.value}');
  }

  final on = false.obs;
  searchListVisibility() {
    on.value = !on.value;
    update();
  }
}
