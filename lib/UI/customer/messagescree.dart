import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:saloonmobileapp/UI/customer/chatscree.dart';

class Msgdetail {
  String image;
  String saloonname;
  String lastmsg;
  int noofmsg;
  bool online;
  String time;
  bool fav;

  Msgdetail(
      {required this.image,
      required this.saloonname,
      required this.lastmsg,
      required this.noofmsg,
      required this.online,
      required this.time,
      required this.fav});
}

class MessageScreen extends StatelessWidget {
  List<Msgdetail> msgdetail = [
    Msgdetail(
        image: 'assets/images/person image (4).png',
        saloonname: "Looks UniSex Saloon",
        lastmsg: "How much are the charges?",
        noofmsg: 0,
        online: true,
        time: "09.40am",
        fav: false),
    Msgdetail(
        image: 'assets/images/person image (1).png',
        saloonname: "Jordan Saloon",
        lastmsg: "Where are you from?",
        noofmsg: 7,
        online: false,
        time: "09.12am",
        fav: false),
    Msgdetail(
        image: 'assets/images/person image (2).png',
        saloonname: "HairAway",
        lastmsg: "Hello! :)",
        noofmsg: 0,
        online: true,
        time: "Yesterday",
        fav: false),
    Msgdetail(
        image: 'assets/images/person image (7).png',
        saloonname: "Jordans",
        lastmsg: "Yeah I’ll let you know when I’m around",
        noofmsg: 0,
        online: false,
        time: "Yesterday",
        fav: true),
    Msgdetail(
        image: 'assets/images/person image (3).png',
        saloonname: "SplitEnds",
        lastmsg: "Hey! how you doing today? I wanna come",
        noofmsg: 0,
        online: true,
        time: "16 Sep 2016",
        fav: false),
    Msgdetail(
        image: 'assets/images/person image (5).png',
        saloonname: "Depilex",
        lastmsg: "Whats the price?",
        noofmsg: 0,
        online: true,
        time: "14 Sep 2016",
        fav: false),
    Msgdetail(
        image: 'assets/images/person image (6).png',
        saloonname: "SmartHair",
        lastmsg: "You free today for the cut?",
        noofmsg: 0,
        online: true,
        time: "14 Sep 2016",
        fav: false),
  ];
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Icon(
          Icons.search_rounded,
          color: Colors.grey.shade700,
          size: width * 0.1,
        ),
        centerTitle: false,
        title: TextFormField(
            controller: TextEditingController(),
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: 'Search',
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: msgdetail.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChatScreen()),
                        );
                      },
                      horizontalTitleGap: width * 0.02,
                      minVerticalPadding: height * 0.001,
                      leading: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: width * 0.15,
                            width: width * 0.15,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(msgdetail[index].image),
                                    fit: BoxFit.cover)),
                          ),
                          msgdetail[index].fav
                              ? Positioned(
                                  top: 0,
                                  right: 0,
                                  child: Image.asset(
                                      'assets/images/favicon.png',
                                      scale: width * 0.009),
                                )
                              : SizedBox(),
                          msgdetail[index].online
                              ? Positioned(
                                  bottom: 0,
                                  child: Container(
                                      height: height * 0.02,
                                      width: width * 0.12,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Color(0xff54D586)),
                                      child: Center(
                                        child: Text("Online",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: width * 0.03)),
                                      )),
                                )
                              : SizedBox()
                        ],
                      ),
                      title: Row(
                        children: [
                          Text(
                            msgdetail[index].saloonname,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: width * 0.045,
                                fontWeight: FontWeight.w600),
                          ),
                          msgdetail[index].noofmsg != 0
                              ? Padding(
                                  padding: EdgeInsets.only(left: width * 0.03),
                                  child: Container(
                                    height: width * 0.05,
                                    width: width * 0.05,
                                    decoration: BoxDecoration(
                                      color: Color(0xffF24E86),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        msgdetail[index].noofmsg.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ],
                      ),
                      subtitle: Text(
                        msgdetail[index].lastmsg,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: width * 0.038),
                      ),
                      trailing: Container(
                        width: width * 0.2,
                        alignment: Alignment.topRight,
                        child: Text(
                          msgdetail[index].time,
                          style: TextStyle(
                              color: Colors.grey, fontSize: width * 0.032),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
