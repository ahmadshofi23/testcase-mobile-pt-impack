import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_testcase/app/data/activity_model.dart';

class HomeController extends GetxController {
  final String url = "http://10.0.2.2:3000/activities/getAllActivity";
  Future<List<ActivityModel>> getActivity() async {
    try {
      var respons = await http.get(Uri.parse(url));
      if (respons.statusCode != 200) {
        throw "err";
      }
      var resultData = json.decode(respons.body)["activities"] as List<dynamic>;
      log(resultData.toString());
      return ActivityModel.fromJsonList(resultData);
    } catch (e) {
      log(e.toString());
    }

    return getActivity();
  }
}
