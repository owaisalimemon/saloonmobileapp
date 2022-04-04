import 'dart:convert';

import 'package:ars_dialog/ars_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saloonmobileapp/UI/mainscreen/phonenumberscreen.dart';
import 'package:saloonmobileapp/helper/snackbar.dart';
import 'package:saloonmobileapp/helper/validation.dart';

final getsingup = ChangeNotifierProvider<SignupController>((ref) {
  return SignupController();
});

class SignupController extends ChangeNotifier {
  TextEditingController dobcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonenocontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();

  DateTime? selectedDate;

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime(1910),
        lastDate: DateTime(2025));

    if (picked != null) selectedDate = picked;

    notifyListeners();
  }

  Future Signup(BuildContext context) async {
    ProgressDialog progressDialog = ProgressDialog(context);
    progressDialog.show();

    if (Validation().isEmail(emailcontroller.text) == false) {
      progressDialog.dismiss();
      SnackbarWidget().showsnackbar('Email is not valid', context);
      return;
    }

    if (passwordcontroller.text != confirmpasswordcontroller.text) {
      progressDialog.dismiss();
      SnackbarWidget().showsnackbar(
          'Please Enter the right password in confirm password', context);
      return;
    }

    progressDialog.dismiss();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PhoneNumberScreen()),
    );
  }
}
