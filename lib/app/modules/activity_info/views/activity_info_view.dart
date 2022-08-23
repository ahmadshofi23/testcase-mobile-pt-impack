import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_testcase/app/routes/app_pages.dart';
import 'package:mobile_testcase/app/utils/color.dart';

import '../controllers/activity_info_controller.dart';

class ActivityInfoView extends GetView<ActivityInfoController> {
  const ActivityInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    DateTime data = DateTime.parse(controller.activityModel.when.toString());
    // log(data.toString());
    String formatDate = DateFormat('dd-MMMM-yyyy').format(data);
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Info'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04, vertical: screenHeight * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: kBlakcColor.withOpacity(0.5),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.02,
                  vertical: screenHeight * 0.01,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Details",
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w500,
                        color: kBlakcColor,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      "${controller.activityModel.activityType}"
                      " with "
                      "${controller.activityModel.institution} "
                      "${formatDate}",
                      // "Meeting with CV Anugrah Jaya at 01-April-2002",
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: kBlakcColor,
                      ),
                    ),
                    Text(
                      "${controller.activityModel.when != null ? controller.activityModel.when.toString().substring(11, 16).toString() : ""} "
                      " to discuss about "
                      "${controller.activityModel.objective}",
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: kBlakcColor,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    MaterialButton(
                      color: kPrimaryColor,
                      height: screenHeight * 0.07,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minWidth: double.infinity,
                      onPressed: () {
                        Get.toNamed(Routes.EDIT_ACTIVITY,
                            arguments: controller.activityModel);
                      },
                      child: Text(
                        "Edit Activity",
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              "What is the result ?",
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              height: screenHeight * 0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadiusDirectional.circular(15),
                  border: Border.all(
                    color: kBlakcColor.withOpacity(0.1),
                    width: 2,
                  )),
            ),
            SizedBox(height: screenHeight * 0.01),
            MaterialButton(
              height: screenHeight * 0.08,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: kButtonColor,
              onPressed: () {},
              child: Text(
                "Complete Activity",
                style: TextStyle(
                  color: kWhiteColor.withOpacity(0.8),
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
