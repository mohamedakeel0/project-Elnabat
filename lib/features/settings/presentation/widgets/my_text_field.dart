import 'package:final_project/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  TextEditingController? txt = new TextEditingController();
  bool r;

  MyTextField({required this.txt, required this.r});

  Widget build(BuildContext context) {
    return TextField(
      //keyboardType: TextInputType.visiblePassword,
      controller: txt,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      readOnly: r,
      decoration: InputDecoration(
        fillColor: MyColors.mainColor,
        filled: true,
      ),
    );
  }
}
