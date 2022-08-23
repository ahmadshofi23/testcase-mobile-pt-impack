import 'package:flutter/material.dart';
import 'package:mobile_testcase/app/data/activity_model.dart';
import 'package:mobile_testcase/app/utils/color.dart';

class CardContent extends StatelessWidget {
  String objective;
  String day;
  String time;
  CardContent(
      {Key? key,
      required this.time,
      required this.objective,
      required this.day})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              day,
              // "Monday, 01 April 2002",
              style: TextStyle(
                color: kBlakcColor,
                fontWeight: FontWeight.w600,
                fontSize: screenWidth * 0.04,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
              child: Row(
                children: [
                  Text(
                    time,
                    // "09:00",
                    style: TextStyle(
                      color: kBlakcColor,
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: screenHeight * 0.08,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth * 0.05, top: screenHeight * 0.02),
                        child: Text(
                          objective,
                          style: TextStyle(
                              color: kWhiteColor, fontSize: screenWidth * 0.04),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              color: kBlakcColor,
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
