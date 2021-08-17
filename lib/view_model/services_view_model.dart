import 'package:tasle7at/model/services_model.dart';
import 'package:get/get.dart';
import 'package:tasle7at/network/api.dart';

class ServicesViewModel extends GetxController {
  final isLoading = false.obs;
  List<ServicesModel> services = <ServicesModel>[].obs;

  changeIsLoadingStatus(bool status) {
    isLoading.value = status;
    update();
  }

  getData() async {
    changeIsLoadingStatus(true);
    services = await Api().getServicesData();
    changeIsLoadingStatus(false);
  }
}
