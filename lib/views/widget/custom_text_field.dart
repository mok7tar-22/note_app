
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.controller,required this.hint, this.maxLines=1});

  final String hint;
  final int maxLines;
  final TextEditingController controller;

  // final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value != null&&value.isNotEmpty ) {
          return null;
        } else {
          return "'Field is required '";
        }
      },
      // cursorColor: kPrimaryColor,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        border: buildBorder(),
        enabledBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          8,
        ),
        borderSide: const BorderSide(
          color: Colors.white,
        ));
  }
}