import 'package:firebase_chat_app/core/utils/constants.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String massage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(massage , style: TextStyle(color: myBlack),),
    ),
  );
}