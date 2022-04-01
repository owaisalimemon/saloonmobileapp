import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saloonmobileapp/UI/admin/signinchoice.dart';
import 'package:saloonmobileapp/UI/customer/bottomnavbar.dart';
import 'package:saloonmobileapp/UI/customer/filterscreen.dart';
import 'package:saloonmobileapp/UI/customer/homepage.dart';
import 'package:saloonmobileapp/UI/customer/saloonprofile.dart';
import 'package:saloonmobileapp/UI/mainscreen/connect_with_screen.dart';
import 'package:saloonmobileapp/UI/mainscreen/forgetpasswordscreen.dart';
import 'package:saloonmobileapp/UI/mainscreen/loginscreen.dart';

import 'package:saloonmobileapp/UI/mainscreen/onboardingscreen.dart';
import 'package:saloonmobileapp/UI/mainscreen/otpscreen.dart';
import 'package:saloonmobileapp/UI/mainscreen/phonenumberscreen.dart';
import 'package:saloonmobileapp/UI/mainscreen/signup_screen.dart';
import 'package:saloonmobileapp/UI/mainscreen/singinchoice.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Sofia'),
      home: SaloonProfile(),
    );
  }
}
