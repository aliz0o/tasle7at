import 'dart:developer';

import 'package:tasle7at/model/section_model.dart';
import 'package:http/http.dart' as http;
import 'package:tasle7at/model/services_model.dart';
import 'package:tasle7at/network/api_url.dart';

class Api {
  Future<SectionModel> getSectionInfo(int id) async {
    String url = '${ApiUrl.sectionUrl}$id';
    var uri = Uri.parse(url);
    log("URL : $url");
    var response = await http.get(uri);
    SectionModel sectionModel = sectionModelFromJson(response.body);
    return sectionModel;
  }

  Future<List<ServicesModel>> getServicesData() async {
    var response = await http.get(Uri.parse(ApiUrl.sectionUrl));
    List<ServicesModel> servicesModel = servicesModelFromJson(response.body);
    return servicesModel;
  }
}
