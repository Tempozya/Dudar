import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  final Icon icon;
  final String? mask;
  final TextEditingController controller;
  final VoidCallback actionOnTap;
  final bool? capitalize;

  AppTextField({
    required this.hint,
    required this.controller,
    required this.icon,
    required this.actionOnTap,
    this.mask,
    this.capitalize,
  });

  @override
  Widget build(BuildContext context) {
    var maskFormatter = new MaskTextInputFormatter(
        mask: mask,
        filter: {"#": RegExp('[0-9]')},
        type: MaskAutoCompletionType.lazy);
    return Stack(
      children: [
        TextField(
          textCapitalization: capitalize == true
              ? TextCapitalization.words
              : TextCapitalization.none,
          inputFormatters: [maskFormatter],
          onTap: actionOnTap,
          controller: controller,
          style: TextStyle(
              color: Color.fromARGB(200, 0, 0, 0),
              fontFamily: 'RobotoBold',
              fontSize: 14),
          decoration: InputDecoration(
              fillColor: Color.fromARGB(66, 184, 184, 184),
              filled: true,
              hintText: hint,
              hintStyle:
                  TextStyle(color: Colors.black38, fontFamily: 'RobotoBold'),
              prefixIcon: icon,
              iconColor: Colors.black,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 54, 81, 230)))),
        ),
      ],
    );
  }
}
