import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class CustomeTextfild extends StatelessWidget {
  CustomeTextfild(
      {required this.obscure,
      required this.hint,
      required this.controller,
      required this.icon});

  bool obscure;
  String hint;
  TextEditingController controller;
  String icon;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.8,
      height: height * 0.07,
      decoration: new BoxDecoration(
          color: ColorsX.greyBackground,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: TextFormField(
          style: TextStyle(color: ColorsX.subBlack),
          textAlignVertical: TextAlignVertical.center,
          obscureText: obscure,
          controller: controller,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'please enter the field';
            }
            return null;
          },
          minLines: 1,
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
            ),
            prefixIcon: Image.asset(
              icon,
            ),
            hintText: hint,
            hintStyle: TextStyle(color: ColorsX.subBlack),
          ),
        ),
      ),
    );
  }
}
