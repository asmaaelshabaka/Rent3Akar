import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../config/constants.dart';

class TextFieldCommon extends StatelessWidget {
  TextFieldCommon(
      this.Controller, this.hintText, this.obsecureText, this.onSaave, this.vaildator);
  final Controller;
  final String hintText;
  final bool obsecureText;
  final void Function(String? value)? onSaave;
  final String Function(String? value) vaildator;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Constants.HorizontalPadding),
        child: TextFormField(
          controller: Controller,
          obscureText: obsecureText,
          onSaved: onSaave,
          validator: vaildator,
          decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400)),
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[500]),
              fillColor: Colors.grey.shade200),
        ),
      ),
    );
  }
}
