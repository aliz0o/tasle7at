import 'package:get/get.dart';
import 'package:tasle7at/model/section_model.dart';
import 'package:tasle7at/network/api.dart';

class SectionViewModel extends GetxController {
  final isLoading = false.obs;
  final section = SectionModel().obs;

  changeIsLoadingStatus(bool status) {
    isLoading.value = status;
    update();
  }

  getData(int id) async {
    changeIsLoadingStatus(true);
    section.value = await Api().getSectionInfo(id);
    changeIsLoadingStatus(false);
  }
}
