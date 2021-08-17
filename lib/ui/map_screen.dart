import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tasle7at/view_model/map_view_model.dart';
import 'package:get/get.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController googleMapController;
  @override
  void dispose() {
    googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MapViewModel viewModel = Get.put(MapViewModel());
    String searchTerm = '';
    return Scaffold(
      appBar: AppBar(
        title: GetX<MapViewModel>(
          init: MapViewModel(),
          builder: (controller) => Center(
            child:
                viewModel.marker.value != Marker(markerId: MarkerId('marker'))
                    ? Text(
                        '${viewModel.marker.value.position}',
                        style: TextStyle(fontSize: 16),
                        maxLines: 2,
                      )
                    : Text(''),
          ),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.edit_location_outlined),
              onPressed: () {
                viewModel.changeType();
              }),
        ],
      ),
      body: SafeArea(
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextField(
              onChanged: (value) {
                searchTerm = value;
              },
              decoration: InputDecoration(
                  hintText: 'Search Location',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      viewModel.getAutoComplete(searchTerm);
                      viewModel.searchListVisibility();
                    },
                  )),
            ),
          ),
          Stack(
            children: [
              Container(
                height: 660,
                child: GetX<MapViewModel>(
                  init: MapViewModel(),
                  builder: (controller) => GoogleMap(
                    onMapCreated: (controller) =>
                        googleMapController = controller,
                    mapType: viewModel.normal.value
                        ? MapType.normal
                        : MapType.satellite,
                    initialCameraPosition: CameraPosition(
                        target:
                            LatLng(viewModel.lat.value, viewModel.lng.value),
                        zoom: 11.5),
                    markers: {
                      if (viewModel.marker.value != null)
                        viewModel.marker.value,
                    },
                    onLongPress: viewModel.addMarker,
                  ),
                ),
              ),
              GetX<MapViewModel>(
                  init: MapViewModel(),
                  builder: (controller) => viewModel.on.value == true
                      ? Container(
                          height: 660,
                          child: ListView.builder(
                              itemCount: viewModel.searchResult.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.6),
                                      backgroundBlendMode: BlendMode.darken),
                                  child: InkWell(
                                    onTap: () async {
                                      await viewModel.getPlace(viewModel
                                          .searchResult[index].placeId);
                                      viewModel.searchListVisibility();

                                      googleMapController.animateCamera(
                                          CameraUpdate.newLatLng(LatLng(
                                              viewModel.lat.value,
                                              viewModel.lng.value)));
                                    },
                                    child: ListTile(
                                      title: Text(
                                        viewModel
                                            .searchResult[index].description,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      : Container(
                          height: 0.0,
                          width: 0.0,
                        )),
            ],
          ),
        ]),
      ),
    );
  }
}
