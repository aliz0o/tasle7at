import 'package:flutter/material.dart';
import 'package:tasle7at/view_model/image_list_view_model.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

class ImageListScreen extends StatefulWidget {
  @override
  _ImageListScreenState createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {
  @override
  Widget build(BuildContext context) {
    ImageListViewModel viewModel = ImageListViewModel();
    return Scaffold(
        appBar: AppBar(
            title: Center(
          child: Text('images'.tr, style: TextStyle(fontFamily: 'Lalezar')),
        )),
        body: GetX<ImageListViewModel>(
          init: ImageListViewModel(),
          builder: (controller) => Column(
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(viewModel.images.length, (index) {
                    Asset asset = viewModel.images[index];
                    return AssetThumb(
                      asset: asset,
                      width: 300,
                      height: 300,
                    );
                  }),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    viewModel.loadAssets();
                  },
                  child: Text('Select Images'))
            ],
          ),
        ));
  }
}
