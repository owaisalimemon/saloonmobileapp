import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saloonmobileapp/controller/saloonscontroller.dart';
import 'package:saloonmobileapp/extrahelper/colors.dart';

class AppointmentPage extends ConsumerWidget {
  AppointmentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    var controller = watch(getsaloon);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: height * 0.27,
              width: width,
              child: Image.asset(
                "assets/images/shortback.png",
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.07,
              ),
              child: Column(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
