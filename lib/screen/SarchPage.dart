// import 'dart:developer';

// // import 'package:chatapp/main.dart';
// // import 'package:chatapp/models/ChatRoomModel.dart';
// // import 'package:chatapp/models/UserModel.dart';
// // import 'package:chatapp/pages/ChatRoomPage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:testproject/Models/ChatRoomModel.dart';
// import 'package:testproject/Models/UserModel.dart';
// import 'package:testproject/Providers/UserProvider.dart';
// import 'package:testproject/main.dart';
// import 'package:testproject/screen/ChatRoomPage.dart';
// import 'package:testproject/Models/UserModel.dart' as model;

// class SearchPage extends StatefulWidget {
//   // final UserModel userModel;
//   // final User firebaseUser;

//   // const SearchPage({Key? key, 
//   // required this.userModel,
//   // required this.firebaseUser,
//   // // required this.userModel, required this.firebaseUser
//   // }) : super(key: key);

//   @override
//   _SearchPageState createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {

//   TextEditingController searchController = TextEditingController();


// //if new chat room or old chat room
//    Future<ChatRoomModel?> getChatroomModel(UserModel targetUser) async {
//     ChatRoomModel? chatRoom;

//     QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("chatrooms")
//       // .where("participants.${widget.userModel.uid}", isEqualTo: true)
//     .where("participants.${targetUser.uid}", isEqualTo: true).get();

//      if(snapshot.docs.length > 0) {
//       // Fetch the existing one
//   //     var docData = snapshot.docs[0].data();
//   //     ChatRoomModel existingChatroom = ChatRoomModel.fromMap(docData as Map<String, dynamic>);

//   //     chatRoom = existingChatroom;
//       log("Chatroom Alred Created!");
//      }
//      else {
//        // Create a new one
//        ChatRoomModel newChatroom = ChatRoomModel(
//          chatroomid: uuid.v1(),
//          lastMessage: "",
//          participants: {
//           //  widget.userModel.uid.toString(): true,
//           targetUser.uid.toString(): true,
//          },
//        );

//   //     await FirebaseFirestore.instance.collection("chatrooms").doc(newChatroom.chatroomid).set(newChatroom.toMap());

//   //     chatRoom = newChatroom;

//   //     log("New Chatroom Created!");
//   log("Chatroom Not Created!");
//      }

//   //   return chatRoom;
//    }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Search"),
//       ),
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.symmetric(
//             horizontal: 20,
//             vertical: 10,
//           ),
//           child: Column(
//             children: [

//               TextField(
//                 controller: searchController,
//                 decoration: InputDecoration(
//                   labelText: "Name"
//                 ),
//               ),

//               SizedBox(height: 20,),

//               CupertinoButton(
//                 onPressed: () {
//                   setState(() {});
//                 },
//                 color: Theme.of(context).colorScheme.secondary,
//                 child: Text("Search"),
//               ),

//               SizedBox(height: 20,),

//               StreamBuilder(
//                 stream: FirebaseFirestore.instance.collection("users").where("name", isEqualTo: searchController.text)
//                   // .where("name", isNotEqualTo: widget.userModel.name) //not search our(login) name
//                  .snapshots(),
//                 builder: (context, snapshot) { 
//                   if(snapshot.connectionState == ConnectionState.active) {
//                     if(snapshot.hasData) {
//                       QuerySnapshot dataSnapshot = snapshot.data as QuerySnapshot;

//                       if(dataSnapshot.docs.length > 0) {
//             Map<String, dynamic> userMap = dataSnapshot.docs[0].data() as Map<String, dynamic>;

//                           model.UserModel searchedUser = model.UserModel.fromMap(userMap);
//                         // model.User searchedUser = model.User.fromSnap(userMap);
// //  model.User searchedUser = model.User.fromSnap(userMap);
// // final model.User user = Provider.of<UserProvider>(context).getUser;

//                         return ListTile(
//                   //  title: Text(user.name),
//                   //  subtitle: Text(user.email),
//                   //          title: Text(searchedUser.name!),
//                   //  subtitle: Text(searchedUser.email!),
//                           onTap: () async {
//                             // ChatRoomModel? chatroomModel = await getChatroomModel(searchedUser);

//                             // if(chatroomModel != null) {
//                             //   Navigator.pop(context);
//                             //   Navigator.push(context, MaterialPageRoute(
//                             //     builder: (context) {
//                             //       return ChatRoomPage(
//                             //         targetUser: searchedUser,
//                             //         userModel: widget.userModel,
//                             //         firebaseUser: widget.firebaseUser,
//                             //         chatroom: chatroomModel,
//                             //       );
//                             //     }
//                             //   ));
//                             // }
         
//     ChatRoomModel? chatRoomModel = await getChatroomModel(searchedUser);   
//                           //   Navigator.pop(context);
//                           //   Navigator.push(context, MaterialPageRoute(builder:
//                           //   (context){
//                           //   return ChatRoomPage(
//                           //     targetUser: searchedUser, 
//                           //     userModel: widget.userModel, 
//                           //     firebaseUser: widget.firebaseUser, 
//                           //     chatroom: null,
//                           //   );
//                           //   } 
//                           //   ));
//                            },
//                           leading: CircleAvatar(
//                             // backgroundImage: NetworkImage(searchedUser.profilepic!),
//                             backgroundColor: Colors.grey[500],
//                           ),
//                           // title: Text(searchedUser.name!),
//                           title: Text(searchedUser.email!),
//                           subtitle: Text(searchedUser.email!),
//                           trailing: Icon(Icons.keyboard_arrow_right),
//                         );
//                       }
//                       else {
//                         return Text("No results found!");
//                       }
                      
//                     }
//                     else if(snapshot.hasError) {
//                       return Text("An error occured!");
//                     }
//                     else {
//                       return Text("No results found!");
//                     }
//                   }
//                   else {
//                     return CircularProgressIndicator();
//                   }
//                 }
//               ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



//--------------------------
import 'dart:developer';

// import 'package:chatapp/main.dart';
// import 'package:chatapp/models/ChatRoomModel.dart';
// import 'package:chatapp/models/UserModel.dart';
// import 'package:chatapp/pages/ChatRoomPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testproject/Models/ChatRoomModel.dart';
import 'package:testproject/Models/UserModel.dart';
import 'package:testproject/Providers/UserProvider.dart';
import 'package:testproject/main.dart';
import 'package:testproject/screen/ChatRoomPage.dart';
import 'package:testproject/Models/UserModel.dart' as model;

class SearchPage extends StatefulWidget {
  final UserModel userModel;
  final User firebaseUser;

  const SearchPage({Key? key, 
  required this.userModel,
  required this.firebaseUser,
  // required this.userModel, required this.firebaseUser
  }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController searchController = TextEditingController();


//if new chat room or old chat room
   Future<ChatRoomModel?> getChatroomModel(UserModel targetUser) async {
     ChatRoomModel? chatRoom;

    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("chatrooms")
       .where("participants.${widget.userModel.uid}", isEqualTo: true)
    .where("participants.${targetUser.uid}", isEqualTo: true).get();

     if(snapshot.docs.length > 0) {
//       // Fetch the existing one
      var docData = snapshot.docs[0].data();
      ChatRoomModel existingChatroom = ChatRoomModel.fromMap(docData as 
      Map<String, dynamic>);

      chatRoom = existingChatroom;
      //  log("Chatroom Alred Created!");
      }
      else {
//        // Create a new one
        ChatRoomModel newChatroom = ChatRoomModel(
         chatroomid: uuid.v1(),
         lastMessage: "",
         participants: {
            widget.userModel.uid.toString(): true,
          targetUser.uid.toString(): true,
         },
        );

      await FirebaseFirestore.instance.collection("chatrooms").doc
      (newChatroom.chatroomid).set(newChatroom.toMap());

      chatRoom = newChatroom;

      log("New Chatroom Created!");
  //  log("Chatroom Not Created!");
      }

    return chatRoom;
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [

              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  labelText: "Name"
                ),
              ),

              SizedBox(height: 20,),

              CupertinoButton(
                onPressed: () {
                  setState(() {});
                },
                color: Theme.of(context).colorScheme.secondary,
                child: Text("Search"),
              ),

              SizedBox(height: 20,),

              StreamBuilder(
                stream: FirebaseFirestore.instance.collection("users").where("name", isEqualTo: searchController.text)
                    .where("name", isNotEqualTo: widget.userModel.name) //not search our(login) name
                 .snapshots(),
                builder: (context, snapshot) { 
                  if(snapshot.connectionState == ConnectionState.active) {
                    if(snapshot.hasData) {
                      QuerySnapshot dataSnapshot = snapshot.data as QuerySnapshot;

                      if(dataSnapshot.docs.length > 0) {
            Map<String, dynamic> userMap = dataSnapshot.docs[0].data() as Map<String, dynamic>;

                          model.UserModel searchedUser = model.UserModel.fromMap(userMap);
                        // model.User searchedUser = model.User.fromSnap(userMap);
//  model.User searchedUser = model.User.fromSnap(userMap);
// final model.User user = Provider.of<UserProvider>(context).getUser;

                        return ListTile(
                  //  title: Text(user.name),
                  //  subtitle: Text(user.email),
                  //          title: Text(searchedUser.name!),
                  //  subtitle: Text(searchedUser.email!),
                          onTap: () async {
// Navigator.pop(context);
// Navigator.push(context, MaterialPageRoute(builder: (context){
//   return ChatRoomPage(

//   );
// }));
                            // ChatRoomModel? chatroomModel = await getChatroomModel(searchedUser);
     ChatRoomModel? chatroomModel = await 
     getChatroomModel(searchedUser);   
                            if(chatroomModel != null) {
                              Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return ChatRoomPage(
                                    targetUser: searchedUser,
                                    userModel: widget.userModel,
                                    firebaseUser: widget.firebaseUser,
                                    chatroom: chatroomModel,
                                  );
                                }
                              ));
                            }
         

   //await getChatroomModel(searchedUser);
                            // Navigator.pop(context);
                            // Navigator.push(context, MaterialPageRoute(builder:
                            // (context){
                            // return ChatRoomPage(
                            //   targetUser: searchedUser, 
                            //   userModel: widget.userModel, 
                            //   firebaseUser: widget.firebaseUser, 
                            //   chatroom: ,
                            // );
                            // } 
                            // ));
                           },
                          leading: CircleAvatar(
                            // backgroundImage: NetworkImage(searchedUser.profilepic!),
                            backgroundColor: Colors.grey[500],
                          ),
                          title: Text(searchedUser.name!),
                          subtitle: Text(searchedUser.email!),
                          trailing: Icon(Icons.keyboard_arrow_right),
                        );
                      }
                      else {
                        return Text("No results found!");
                      }
                      
                    }
                    else if(snapshot.hasError) {
                      return Text("An error occured!");
                    }
                    else {
                      return Text("No results found!");
                    }
                  }
                  else {
                    return CircularProgressIndicator();
                  }
                }
              ),

            ],
          ),
        ),
      ),
    );
  }
}