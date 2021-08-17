import 'package:get/get.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

class ImageListViewModel extends GetxController {
  List<Asset> images = <Asset>[].obs;
  loadAssets() async {
    List<Asset> resultList = <Asset>[];
    resultList = await MultiImagePicker.pickImages(
      maxImages: 9,
    );
    for (int count = 0; count < resultList.length; count++)
      images.add(resultList[count]);
    update();
  }
}
