import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_testcase/app/utils/appbarTheme.dart';
import 'package:mobile_testcase/app/utils/color.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(appBarTheme: appBarTheme()),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
