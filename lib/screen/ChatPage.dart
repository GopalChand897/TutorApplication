import 'package:flutter/material.dart';
import 'package:testproject/Models/ChatModel.dart';
import 'package:testproject/Widgets/ConversationList.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //SingleChildScrollView --> scrollable
      body: SingleChildScrollView(
       // child: Center(child: Text("Chat")),
       //BouncingScrollPhysics --> bouncing effect when a user's scrolling reaches the end or beginning
      physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                                    IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back,color: Colors.black,),
                ),
                SizedBox(width: 2,),
                    Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                    // Container(
                    //   padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
                    //   height: 30,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(30),
                    //     color: Colors.pink[50],
                    //   ),
                    //   child: Row(
                    //     children: <Widget>[
                    //       Icon(Icons.add,color: Colors.pink,size: 20,),
                    //       SizedBox(width: 2,),
                    //       Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            Padding(
  padding: EdgeInsets.only(top: 16,left: 16,right: 16),
  child: TextField(
    decoration: InputDecoration(
      hintText: "Search...",
      hintStyle: TextStyle(color: Colors.grey.shade600),
      prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
      filled: true,
      fillColor: Colors.grey.shade100,
      contentPadding: EdgeInsets.all(8),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
              color: Colors.grey.shade100
          )
      ),
    ),
  ),
),
ListView.builder(
  itemCount: chatUsers.length,
  shrinkWrap: true,
  padding: EdgeInsets.only(top: 16),
  physics: NeverScrollableScrollPhysics(),
  itemBuilder: (context, index){
    return ConversationList(
      name: chatUsers[index].name,
      messageText: chatUsers[index].messageText,
      imageUrl: chatUsers[index].imageURL,
      time: chatUsers[index].time,
      isMessageRead: (index == 0 || index == 3)?true:false,
    );
  },
),
          ],
        ),
      ),
    );
  }
}


