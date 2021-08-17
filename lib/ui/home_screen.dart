import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:tasle7at/ui/image_list_screen.dart';
import 'package:tasle7at/ui/localization_screen.dart';
import 'package:tasle7at/ui/map_screen.dart';
import 'package:tasle7at/ui/section_screen.dart';
import 'package:tasle7at/ui/validation_screen.dart';
import 'package:tasle7at/view_model/services_view_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ServicesViewModel viewModel = Get.put(ServicesViewModel());
    viewModel.getData();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.to(ImageListScreen());
          },
          icon: Icon(Icons.image, color: Colors.white),
        ),
        title: Center(
          child: Text('sections'.tr, style: TextStyle(fontFamily: 'Lalezar')),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(MapScreen());
            },
            icon: Icon(Icons.location_on, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Get.to(LocalizationScreen());
            },
            icon: Icon(Icons.language, color: Colors.white),
          ),
          IconButton(
            onPressed: () {
              Get.to(ValidationScreen());
            },
            icon: Icon(Icons.phone, color: Colors.white),
          )
        ],
      ),
      body: GetX<ServicesViewModel>(
        init: ServicesViewModel(),
        builder: (controller) =>
            viewModel.isLoading.value && viewModel.services == null
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: viewModel.services.length,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        Get.to(SectionScreen(viewModel.services[index].id));
                      },
                      child: Card(
                        elevation: 5,
                        child: Text(
                          '${viewModel.services[index].title}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
