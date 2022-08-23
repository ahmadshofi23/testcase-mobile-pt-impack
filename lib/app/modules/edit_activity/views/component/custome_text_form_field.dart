import 'package:flutter/material.dart';
import 'package:mobile_testcase/app/utils/color.dart';

class CustomeTextFormField extends StatelessWidget {
  String text;
  int maxline;
  IconButton iconButton;
  TextEditingController textEditingController;
  CustomeTextFormField({
    Key? key,
    required this.textEditingController,
    required this.iconButton,
    required this.text,
    required this.maxline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      maxLines: maxline,
      decoration: InputDecoration(
        suffixIcon: iconButton,
        filled: true,
        hintStyle: TextStyle(color: Colors.grey[400]),
        hintText: text,
        fillColor: Colors.grey[200],
        border: const OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.grey,
        )),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
