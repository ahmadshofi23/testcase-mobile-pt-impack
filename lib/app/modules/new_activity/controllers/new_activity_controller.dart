import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NewActivityController extends GetxController {
  TextEditingController activityType = TextEditingController();
  TextEditingController institution = TextEditingController();
  TextEditingController objective = TextEditingController();
  TextEditingController remarks = TextEditingController();
  TextEditingController when = TextEditingController();

  final List<String> todoActivities = [
    'Meeting',
    'Calling',
  ];

  Future postData() async {
    log(activityType.text);
    log(institution.text);
    log(objective.text);
    log(remarks.text);
    log(when.text);
    try {
      final respons = await http.post(
          Uri.parse("http://10.0.2.2:3000/activities/insertActivities"),
          body: {
            'activityType': activityType.text,
            'institution': institution.text,
            'when': when.text,
            'objective': objective.text,
            'remarks': remarks.text,
          });
      log("ini dijalan");
      if (respons.statusCode == 200) {
        Get.snackbar("Success", "Save Data Success");
        log(respons.body);
        clearTextfield();
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar("Warning", e.toString());
    }
  }

  void clearTextfield() {
    activityType.clear();
    institution.clear();
    objective.clear();
    remarks.clear();
    when.clear();
  }
}
