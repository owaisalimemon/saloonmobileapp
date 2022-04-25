import 'package:flutter/material.dart';
import 'package:saloonmobileapp/UI/customer/chatscree.dart';

class ChatTile extends StatelessWidget {
  ChatTile({Key? key, required this.list, required this.index});

  List<ChatMessage> list;
  int index;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(
          left: width * 0.03,
          right: width * 0.03,
          top: height * 0.02,
          bottom: height * 0.02),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: list[index].messageType == "receiver"
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          list[index].messageType == "receiver"
              ? Container(
                  height: height * 0.06,
                  width: width * 0.15,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image:
                              AssetImage('assets/images/person image (3).png'),
                          fit: BoxFit.cover)),
                )
              : Container(),
          SizedBox(width: width * 0.02),
          Align(
            alignment: (list[index].messageType == "receiver"
                ? Alignment.topLeft
                : Alignment.topRight),
            child: Column(
              crossAxisAlignment: list[index].messageType == "receiver"
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: [
                Container(
                  width: width * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: list[index].messageType == "receiver"
                          ? Radius.circular(0)
                          : Radius.circular(15),
                      bottomRight: list[index].messageType == "receiver"
                          ? Radius.circular(15)
                          : Radius.circular(0),
                    ),
                    gradient: list[index].messageType == "receiver"
                        ? LinearGradient(
                            stops: [
                              0.10,
                              0.90,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFFC4C4C4).withOpacity(0.4),
                              Color(0xFFC4C4C4).withOpacity(0.4),
                            ],
                          )
                        : LinearGradient(
                            stops: [
                              0.10,
                              0.90,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFF68D1FD),
                              Color(0xFF68D1FD),
                            ],
                          ),
                    color: (list[index].messageType == "receiver"
                        ? Colors.grey.shade200
                        : Colors.blue[200]),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Text(
                    list[index].messageContent,
                    style: TextStyle(
                        fontSize: width * 0.05,
                        color: list[index].messageType == "receiver"
                            ? Colors.black
                            : Colors.white),
                  ),
                ),
                SizedBox(height: height * 0.005),
                Text('3:20 pm',
                    style: TextStyle(color: Colors.black.withOpacity(0.64)))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
