//https://doctorcodetutorial.blogspot.com/2020/09/make-flutter-clone-app-ui-suing-flutter.html
import 'package:flutter/material.dart';

//the feed box will have for parameters :
// the user name , the user avatar, the pub date, the content text and content img
Widget feedBox(
  //  String avatarUrl, 
  // String userName, String date,
  //   String contentText, String contentImg
    ) {
  var contentText='I`m a Physics teacher with 5 years of experience holding masters` degree in physics, currently teaching in ssuet.I can help you clear your concepts related to the subject physics.I`ll be teaching from 7:00 to 9:00 pm (5 days a week from monday to friday),Fees: 5,000 PKR, Feel free to shoot me a message, looking forward to hear from you.';
  return Container(
    margin: EdgeInsets.only(bottom: 20.0),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.white,
     
      // color: Color(0xFF262626),
    ),
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
              //   backgroundImage: NetworkImage(avatarUrl),
                radius: 25.0,
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("name",
                   //   userName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children:[
                        Icon(Icons.location_pin),
                    Text("Karachi,Pakistan",
                 //     date,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ), ]),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          if (contentText != "")
            Text(
              contentText,
              style: TextStyle(
                color: Colors.black,
                 fontSize: 16.0
                 ),
            ),
          SizedBox(
            height: 10.0,
          ),
        //  if (contentImg != "") Image.network(contentImg),
          SizedBox(
            height: 10.0,
          ),
          Divider(
            thickness: 1.5,
            color: Color(0xFF505050),
          ),
          Row(
            children: [
              actionButton(Icons.thumb_up, "Like", Color(0xFF505050)),
              actionButton(Icons.comment, "Reply", Color(0xFF505050)),
              actionButton(Icons.share, "Share", Color(0xFF505050)),
            ],
          )
        ],
      ),
    ),
  );
}


Widget actionButton(IconData icon, String actionTitle, Color iconColor) {
  return Expanded(
    child: ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(
        icon,
        color: iconColor,
      ),
      label: Text(
        actionTitle,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}