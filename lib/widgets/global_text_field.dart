import 'package:flutter/material.dart';

import '../../../../constants/colors/palette.dart';
import '../../../../constants/fonts/fonts.dart';

class TextFieldGlobal extends StatelessWidget {
  const TextFieldGlobal({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.formKey,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: TextFormField(
        cursorColor: Palette.primaryColor,
        controller: controller,
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'Pelase enter a valid name';
          }
          return null;
        },
        style: TextStyle(
            fontFamily: AppFontStyle.poppins,
            fontSize: 12,
            fontWeight: FontWeight.normal),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12),
          // fillColor: Color(0xffF4F6F8),
          // focusColor: Color(0xffF4F6F8),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Palette.athensGray)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Palette.athensGray)),
        ),
      ),
    );
  }
}
