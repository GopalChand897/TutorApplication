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
    List<ChatUsers> chatUsers = [
    ChatUsers(name: "Jane Russel", messageText: "Awesome Setup", imageURL: "images/userImage1.jpeg", time: "Now", image: '', secondaryText: '', text: ''),
    ChatUsers(name: "Glady's Murphy", messageText: "That's Great", image: "images/userImage2.jpeg", time: "Yesterday", text: '', imageURL: '', secondaryText: ''),
    ChatUsers(name: "Jorge Henry", messageText: "Hey where are you?", image: "images/userImage3.jpeg", time: "31 Mar", text: '', imageURL: '', secondaryText: ''),
    ChatUsers(name: "Philip Fox", messageText: "Busy! Call me in 20 mins", image: "images/userImage4.jpeg", time: "28 Mar", text: '', imageURL: '', secondaryText: ''),
    ChatUsers(name: "Debra Hawkins", messageText: "Thankyou, It's awesome", image: "images/userImage5.jpeg", time: "23 Mar", text: '', imageURL: '', secondaryText: ''),
    ChatUsers(name: "Jacob Pena", messageText: "will update you in evening", image: "images/userImage6.jpeg", time: "17 Mar", text: '', imageURL: '', secondaryText: ''),
    ChatUsers(name: "Andrey Jones", messageText: "Can you please share the file?", image: "images/userImage7.jpeg", time: "24 Feb", text: '', imageURL: '', secondaryText: ''),
    ChatUsers(name: "John Wick", messageText: "How are you?", image: "images/userImage8.jpeg", time: "18 Feb", text: '', imageURL: '', secondaryText: ''),
  ];