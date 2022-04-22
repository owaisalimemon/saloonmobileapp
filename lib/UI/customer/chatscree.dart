import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloonmobileapp/UI/customer/widgets/chattile.dart';

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}

class ChatScreen extends StatelessWidget {
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xffDA44bb), Color(0xff8921aa)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hi, How are you?", messageType: "receiver"),
    ChatMessage(messageContent: "Awesome and you?", messageType: "sender"),
    ChatMessage(messageContent: "Hi, How are you?", messageType: "receiver"),
    ChatMessage(messageContent: "Awesome and you?", messageType: "sender"),
    ChatMessage(messageContent: "Hi, How are you?", messageType: "receiver"),
    ChatMessage(messageContent: "Awesome and you?", messageType: "sender"),
    ChatMessage(messageContent: "Hi, How are you?", messageType: "receiver"),
    ChatMessage(messageContent: "Awesome and you?", messageType: "sender"),
    ChatMessage(messageContent: "Hi, How are you?", messageType: "receiver"),
    ChatMessage(messageContent: "Awesome and you?", messageType: "sender"),
    ChatMessage(messageContent: "Hi, How are you?", messageType: "receiver"),
    ChatMessage(messageContent: "Awesome and you?", messageType: "sender"),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffEEF5FE),
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff70B4FF),
            )),
        title: Column(
          children: [
            Text(
              'My Appointments',
              style: TextStyle(
                  fontSize: width * 0.05,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'last seen 15 min ago',
              style: TextStyle(
                  fontSize: width * 0.04,
                  color: Color(0xff707070),
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: height * 0.02,
            child: Image.asset(
              "assets/images/chattop.png",
              fit: BoxFit.fill,
            ),
          ),
          Container(
            height: height * 0.815,
            width: width,
            child: ListView.builder(
              itemCount: messages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              itemBuilder: (context, index) {
                return index != 3
                    ? ChatTile(list: messages, index: index)
                    : Padding(
                        padding: EdgeInsets.only(
                            top: height * 0.02, bottom: height * 0.02),
                        child: Center(
                            child: Text(
                          "Today",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      );
              },
            ),
          ),
          Container(
              // height: height * 0.06,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // IconButton(
                  //   icon: Image.asset('asset/images/pin.png'),
                  //   onPressed: () {},
                  // ),

                  Container(
                    width: width * 0.6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.grey, width: 1)),
                    child: TextFormField(
                      controller: TextEditingController(),
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                            vertical: height * 0.018, horizontal: width * 0.05),
                        hintText: 'Enter a message',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/images/Camera.png',
                      scale: width * 0.009999,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/images/Mic.png',
                      scale: width * 0.009999,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {},
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
