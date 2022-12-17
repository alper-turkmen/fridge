import 'package:flutter/material.dart';

import '../consts/consts.dart';

class LoginTextFieldWidget extends StatefulWidget {
  final String text;
  final TextEditingController controller;
  const LoginTextFieldWidget({
    required this.text,
    required this.controller,
    super.key,
  });

  @override
  State<LoginTextFieldWidget> createState() => _LoginTextFieldWidgetState();
}

class _LoginTextFieldWidgetState extends State<LoginTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: ColorList.mainColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0), //<-- SEE HERE
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            // vertical: 4.0,
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.text,
            ),
          ),
        ),
      ),
    );
  }
}
