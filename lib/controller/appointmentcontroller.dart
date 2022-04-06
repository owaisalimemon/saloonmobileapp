import 'dart:convert';

import 'package:ars_dialog/ars_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saloonmobileapp/UI/customer/apointmentpage.dart';
import 'package:saloonmobileapp/UI/mainscreen/phonenumberscreen.dart';
import 'package:saloonmobileapp/helper/snackbar.dart';
import 'package:saloonmobileapp/helper/validation.dart';

final getappointment = ChangeNotifierProvider<AppointmentController>((ref) {
  return AppointmentController();
});

class AppointmentController extends ChangeNotifier {
  AppointmentController() {
    getcaneledappointment();
    getawaitingappointment();
    getbookedappointment();
  }
  List<Appointmentdetai> cencelappointments = [];
  List<Appointmentdetai> bookedappointments = [];
  List<Appointmentdetai> awaitingappointments = [];

  List<Appointmentdetai> appointmentlist = [
    Appointmentdetai(
        image: "assets/images/appointmentimage.png",
        saloonname: "Looks Unisex Saloon",
        address: "288 Empola Street, NewYork",
        time: "2:30",
        date: "28 \nSep'20",
        awaibookconf: "Awaiting",
        rating: 4.0,
        appointmentid: "#1235645"),
    Appointmentdetai(
        image: "assets/images/appointmentimage.png",
        saloonname: "Looks Unisex Saloon",
        address: "288 Empola Street, NewYork",
        time: "2:30",
        date: "28 \nSep'20",
        awaibookconf: "Booked",
        rating: 4.0,
        appointmentid: "#1235645"),
    Appointmentdetai(
        image: "assets/images/appointmentimage.png",
        saloonname: "Looks Unisex Saloon",
        address: "288 Empola Street, NewYork",
        time: "2:30",
        date: "28 \nSep'20",
        awaibookconf: "Cancelled",
        rating: 4.0,
        appointmentid: "#1235645"),
    Appointmentdetai(
        image: "assets/images/appointmentimage.png",
        saloonname: "Looks Unisex Saloon",
        address: "288 Empola Street, NewYork",
        time: "2:30",
        date: "28 \nSep'20",
        awaibookconf: "Awaiting",
        rating: 4.0,
        appointmentid: "#1235645"),
    Appointmentdetai(
        image: "assets/images/appointmentimage.png",
        saloonname: "Looks Unisex Saloon",
        address: "288 Empola Street, NewYork",
        time: "2:30",
        date: "28 \nSep'20",
        awaibookconf: "Booked",
        rating: 4.0,
        appointmentid: "#1235645"),
    Appointmentdetai(
        image: "assets/images/appointmentimage.png",
        saloonname: "Looks Unisex Saloon",
        address: "288 Empola Street, NewYork",
        time: "2:30",
        date: "28 \nSep'20",
        awaibookconf: "Cancelled",
        rating: 4.0,
        appointmentid: "#1235645"),
    Appointmentdetai(
        image: "assets/images/appointmentimage.png",
        saloonname: "Looks Unisex Saloon",
        address: "288 Empola Street, NewYork",
        time: "2:30",
        date: "28 \nSep'20",
        awaibookconf: "Booked",
        rating: 4.0,
        appointmentid: "#1235645"),
    Appointmentdetai(
        image: "assets/images/appointmentimage.png",
        saloonname: "Looks Unisex Saloon",
        address: "288 Empola Street, NewYork",
        time: "2:30",
        date: "28 \nSep'20",
        awaibookconf: "Cancelled",
        rating: 4.0,
        appointmentid: "#1235645"),
    Appointmentdetai(
        image: "assets/images/appointmentimage.png",
        saloonname: "Looks Unisex Saloon",
        address: "288 Empola Street, NewYork",
        time: "2:30",
        date: "28 \nSep'20",
        awaibookconf: "Booked",
        rating: 4.0,
        appointmentid: "#1235645"),
    Appointmentdetai(
        image: "assets/images/appointmentimage.png",
        saloonname: "Looks Unisex Saloon",
        address: "288 Empola Street, NewYork",
        time: "2:30",
        date: "28 \nSep'20",
        awaibookconf: "Cancelled",
        rating: 4.0,
        appointmentid: "#1235645"),
  ];

  getcaneledappointment() {
    for (int i = 0; i < appointmentlist.length; i++) {
      if (appointmentlist[i].awaibookconf == "Cancelled") {
        cencelappointments.add(appointmentlist[i]);
      }
    }
  }

  getbookedappointment() {
    for (int i = 0; i < appointmentlist.length; i++) {
      if (appointmentlist[i].awaibookconf == "Booked") {
        bookedappointments.add(appointmentlist[i]);
      }
    }
  }

  getawaitingappointment() {
    for (int i = 0; i < appointmentlist.length; i++) {
      if (appointmentlist[i].awaibookconf == "Awaiting") {
        awaitingappointments.add(appointmentlist[i]);
      }
    }
  }
}
