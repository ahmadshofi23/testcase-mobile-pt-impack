import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_testcase/app/data/activity_model.dart';
import 'package:mobile_testcase/app/modules/home/views/card_content.dart';
import 'package:mobile_testcase/app/routes/app_pages.dart';
import 'package:mobile_testcase/app/utils/color.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Activities',
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: kPrimaryColor,
            height: screenHeight * 0.15,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  minWidth: screenWidth * 0.4,
                  color: kWhiteColor,
                  height: screenHeight * 0.06,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Open",
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                MaterialButton(
                  minWidth: screenWidth * 0.4,
                  textColor: kWhiteColor,
                  height: screenHeight * 0.06,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: kWhiteColor,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Complete",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),
          Expanded(
            child: FutureBuilder<List<ActivityModel>>(
              future: controller.getActivity(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text("Tidak ada data..."),
                  );
                }

                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      ActivityModel activityModel = snapshot.data![index];

                      // log(activityModel.when.toString());
                      String formatDate;
                      String days = "";
                      String dateAfterformat;
                      if (activityModel.when != null) {
                        var date = DateTime.now();
                        days = DateFormat('EEEE').format(date);
                        String? convertDate = activityModel.when.toString();
                        DateTime data = DateTime.parse(convertDate);
                        // log(data.toString());
                        formatDate = DateFormat('dd-MMMM-yyyy').format(data);
                        log(formatDate);
                        dateAfterformat = days + "," + formatDate;
                      } else {
                        formatDate = "";
                        dateAfterformat = days + formatDate;
                      }
                      return GestureDetector(
                          onTap: () {
                            log(activityModel.id.toString());
                            Get.toNamed(Routes.ACTIVITY_INFO,
                                arguments: activityModel);
                          },
                          child: CardContent(
                            time: activityModel.when != null
                                ? activityModel.when
                                    .toString()
                                    .substring(11, 16)
                                    .toString()
                                : "",
                            day: dateAfterformat,
                            objective: activityModel.institution.toString(),
                          ));
                    });
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        child: Icon(
          Icons.add,
          size: screenHeight * 0.05,
          color: kWhiteColor,
        ),
        onPressed: () => Get.toNamed(Routes.NEW_ACTIVITY),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: screenHeight * 0.04,
          backgroundColor: kPrimaryColor,
          selectedItemColor: kWhiteColor,
          unselectedItemColor: kWhiteColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_sharp,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_month_outlined,
                ),
                label: "My Activity"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu_book_rounded,
                ),
                label: "Orders"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_pin,
                ),
                label: "My Profile"),
          ]),
    );
  }
}
