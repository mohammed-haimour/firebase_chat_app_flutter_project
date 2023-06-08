import 'package:firebase_chat_app/core/utils/constants.dart';
import 'package:firebase_chat_app/features/chat/data/model/message_model.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';

class GetterBubble extends StatelessWidget {
  const GetterBubble({Key? key, required this.userMessage}) : super(key: key);
  final MessageModel userMessage ;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical:  2),
      // alignment: Alignment.topRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BubbleSpecialThree(
            text: userMessage.message ,
            color: Colors.white70,
            tail: true,
            isSender: true,
            textStyle: TextStyle(
                color: myBlack,
                fontSize: 16
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(userMessage.date , style: TextStyle(color: myGrey , fontSize: 8),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text("From  : ${userMessage.email}" , style: const TextStyle(color: Colors.blue , fontSize: 10),),
          )
        ],
      ),

    );
  }
}
