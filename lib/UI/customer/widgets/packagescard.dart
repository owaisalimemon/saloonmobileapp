// import 'package:flutter/material.dart';

// import 'package:saloonmobileapp/controller/saloonscontroller.dart';

// class PackagesCard extends StatelessWidget {
//   PackagesCard({required this.index, required this.controller});
//   int index;
//   SaloonController controller;

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return Padding(
//       padding: EdgeInsets.only(left: index == 0 ? width * 0.075 : width * 0.03),
//       child: GestureDetector(
//         onTap: () {
//           print("clicked");
//         },
//         child: Card(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           elevation: 5,
//           child: Container(
//               height: height * 0.25,
//               width: width * 0.75,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Colors.red,
//                   image: DecorationImage(
//                       image:
//                           AssetImage(controller.packagesandoffer[index].image),
//                       fit: BoxFit.fill)),
//               child: Container(
//                 height: height * 0.25,
//                 width: width * 0.75,
//                 decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.4),
//                     borderRadius: BorderRadius.circular(15)),
//                 child: Stack(
//                   children: [
//                     Positioned(
//                         top: height * 0.03,
//                         right: width * 0.015,
//                         child: Text(
//                           controller.packagesandoffer[index].percentoff
//                                   .toString() +
//                               "% \nOff",
//                           style: TextStyle(
//                               fontSize: width * 0.1,
//                               color: Color(0xffFF770E),
//                               fontWeight: FontWeight.bold),
//                         )),
//                     Positioned(
//                       top: height * 0.12,
//                       right: width * 0.03,
//                       child: Container(
//                         height: height * 0.04,
//                         width: width * 0.18,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(15),
//                             color: controller.packagesandoffer[index].active
//                                 ? Color(0xff56D91F)
//                                 : Colors.red),
//                         child: Center(
//                             child: Text(
//                                 controller.packagesandoffer[index].active
//                                     ? "Active"
//                                     : "Deactive",
//                                 style: TextStyle(
//                                     fontSize: width * 0.04,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white))),
//                       ),
//                     ),
//                     Positioned(
//                         top: height * 0.18,
//                         right: width * 0.03,
//                         child: Text(
//                           "Valid only",
//                           style: TextStyle(
//                               fontSize: width * 0.04,
//                               color: Colors.white,
//                               fontWeight: FontWeight.normal),
//                         )),
//                     Positioned(
//                         top: height * 0.21,
//                         right: width * 0.03,
//                         child: Text(
//                           controller.packagesandoffer[index].validtill,
//                           style: TextStyle(
//                               fontSize: width * 0.04,
//                               color: Colors.white,
//                               fontWeight: FontWeight.normal),
//                         )),
//                     Positioned(
//                         top: height * 0.02,
//                         left: width * 0.03,
//                         child: Text(
//                           "Deal",
//                           style: TextStyle(
//                               fontSize: width * 0.04,
//                               color: Colors.white,
//                               fontWeight: FontWeight.normal),
//                         )),
//                     Positioned(
//                         top: height * 0.04,
//                         left: width * 0.03,
//                         child: Text(
//                           controller.packagesandoffer[index].dealno,
//                           style: TextStyle(
//                               fontSize: width * 0.04,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         )),
//                     Positioned(
//                         top: height * 0.09,
//                         left: width * 0.03,
//                         child: Text(
//                           controller.packagesandoffer[index].deal,
//                           style: TextStyle(
//                               fontSize: width * 0.05,
//                               color: Colors.white,
//                               fontWeight: FontWeight.normal),
//                         )),
//                     Positioned(
//                         top: height * 0.12,
//                         left: width * 0.03,
//                         child: Text(
//                           controller.packagesandoffer[index].name,
//                           style: TextStyle(
//                               fontSize: width * 0.055,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                         )),
//                     Positioned(
//                         bottom: height * 0.06,
//                         left: width * 0.03,
//                         child: Text(
//                           "Price",
//                           style: TextStyle(
//                               fontSize: width * 0.05,
//                               color: Colors.white,
//                               fontWeight: FontWeight.normal),
//                         )),
//                     Positioned(
//                         bottom: height * 0.03,
//                         left: width * 0.03,
//                         child: RichText(
//                           text: TextSpan(children: [
//                             TextSpan(
//                               text: controller.packagesandoffer[index].price
//                                       .toString() +
//                                   "\$",
//                               style: TextStyle(
//                                   fontSize: width * 0.05,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             TextSpan(
//                               text: "   4̶0̶0̶\$",
//                               style: TextStyle(
//                                   fontSize: width * 0.05,
//                                   color: Color(0xffF35162),
//                                   fontWeight: FontWeight.bold),
//                             )
//                           ]),
//                         )),
//                   ],
//                 ),
//               )),
//         ),
//       ),
//     );
//   }
// }
