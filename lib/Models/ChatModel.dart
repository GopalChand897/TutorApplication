import 'package:flutter/cupertino.dart';

class ChatUsers{
  String name;
  String messageText;
  String imageURL;
  String time;
  
  // String image;
  // String secondaryText;
  // String text;
  ChatUsers(
    {
      required this.name,
      required this.messageText,
      required this.imageURL,
      required this.time, 
      // required this.image,
      // required this.secondaryText,
      // required this.text,
      required String image, 
      required String secondaryText, 
      required String text,
      
      });
}