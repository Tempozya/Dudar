import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final Icon icon;
  final String hint;
  final VoidCallback helpOnTap;
  final Widget helpContent;
  final bool obscureText;
  final TextEditingController controller;

  AppTextField({
    required this.icon,
    required this.hint,
    required this.helpOnTap,
    required this.helpContent,
    required this.obscureText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                TextStyle(color: Colors.black38, fontFamily: 'RobotoBold'),
            prefixIcon: icon,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
            ),
          ),
        ),
        if (helpContent != null && helpOnTap != null)
          Container(
            height: 48,
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: helpOnTap,
                child: helpContent,
              ),
            ),
          )
      ],
    );
  }
}
