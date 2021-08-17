import 'package:tasle7at/view_model/section_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionScreen extends StatefulWidget {
  final int id;
  SectionScreen(this.id);
  @override
  _SectionScreenState createState() => _SectionScreenState();
}

class _SectionScreenState extends State<SectionScreen> {
  @override
  Widget build(BuildContext context) {
    SectionViewModel viewModel = Get.put(SectionViewModel());
    viewModel.getData(widget.id);
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text('sections'.tr, style: TextStyle(fontFamily: 'Lalezar')),
      )),
      body: GetX<SectionViewModel>(
        init: SectionViewModel(),
        builder: (controller) => viewModel.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Card(
                elevation: 5,
                child: Text(
                  '${viewModel.section.value.title}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
      ),
    );
  }
}
