import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobile_testcase/app/modules/edit_activity/views/component/custome_text_form_field.dart';
import 'package:mobile_testcase/app/utils/color.dart';

import '../controllers/new_activity_controller.dart';

class NewActivityView extends GetView<NewActivityController> {
  const NewActivityView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Activity'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.02,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What do you want to do?",
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                  color: kBlakcColor,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              DropdownButtonFormField2(
                decoration: InputDecoration(
                  fillColor: Colors.grey[200],
                  filled: true,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.grey,
                  )),
                ),
                isExpanded: true,
                hint: Text(
                  'Meeting Or Calling',
                  style: TextStyle(
                      fontSize: screenWidth * 0.04, color: Colors.grey[400]),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: screenWidth * 0.08,
                buttonHeight: screenHeight * 0.08,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                ),
                items: controller.todoActivities
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'Please select to do.';
                  }
                },
                onChanged: (value) {
                  String values = value.toString();
                  controller.activityType.text = values;
                  log(controller.activityType.text);
                },
                onSaved: (value) {
                  // controller.todoController.text = value.toString();
                  // log(controller.todoController.text);
                },
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Who do you want to meet/call?",
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                  color: kBlakcColor,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              CustomeTextFormField(
                textEditingController: controller.institution,
                iconButton:
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                text: "CV Anugrah Jaya",
                maxline: 1,
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "When do you want to meet/call CV Anugrah Jaya ?",
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                  color: kBlakcColor,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              TextFormField(
                controller: controller.when,
                decoration: InputDecoration(
                  hintText: "dd-MMM-yyyy HH:mm",
                  hintStyle: const TextStyle(color: Colors.grey),
                  suffixIcon: InkWell(
                    onTap: () async {
                      DatePicker.showDateTimePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(1000, 1, 1, 00, 00),
                          maxTime: DateTime.now(),
                          onChanged: (date) {}, onConfirm: (date) {
                        String formatDate =
                            DateFormat('dd-MMMM-yyyy HH:mm').format(date);
                        print('confirm $formatDate');
                        controller.when.text = formatDate;
                      }, locale: LocaleType.id);
                    },
                    child: Icon(
                      Icons.date_range_outlined,
                      // color: blackColor,
                      size: screenHeight * 0.03,
                    ),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Who do you want to meet/call CV Anugrah Jaya ?",
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                  color: kBlakcColor,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              CustomeTextFormField(
                textEditingController: controller.objective,
                iconButton: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_drop_down),
                ),
                text: "New Order, Invoice, New Leads",
                maxline: 1,
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "Could you describe it more details ?",
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                  color: kBlakcColor,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              CustomeTextFormField(
                textEditingController: controller.remarks,
                iconButton: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_drop_down),
                ),
                text: "Place holder",
                maxline: 4,
              ),
              SizedBox(height: screenHeight * 0.03),
              MaterialButton(
                height: screenHeight * 0.08,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: kButtonColor,
                onPressed: () => controller.postData(),
                child: Text(
                  "Submit",
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
      ),
    );
  }
}
