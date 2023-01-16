// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:testproject/Models/ChatModel.dart';
// import 'package:testproject/Models/ChatRoomModel.dart';
// import 'package:testproject/Models/UserModel.dart';
// import 'package:testproject/Widgets/ConversationList.dart';
// import 'package:testproject/screen/SarchPage.dart';

// class ConversationPage extends StatefulWidget {

//   //   final UserModel userModel;
//   // final User firebaseUser;

//   //   const ConversationPage({Key? key, 
//   // required this.userModel,
//   //  required this.firebaseUser
//   //  }) : super(key: key);

//   @override
//   _ConversationPageState createState() => _ConversationPageState();
// }

// class _ConversationPageState extends State<ConversationPage> {

//    List<ChatUsers> Users = chatUsers;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //SingleChildScrollView --> scrollable
//       body: SingleChildScrollView(
//        // child: Center(child: Text("Chat")),
//        //BouncingScrollPhysics --> bouncing effect when a user's scrolling reaches the end or beginning
//       physics: BouncingScrollPhysics(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             SafeArea(
//               child: Padding(
//                 padding: EdgeInsets.only(
//                   //left: 16,
//                 right: 16,top: 10),
//                 child: Row(
//                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                                     IconButton(
//                   onPressed: (){
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(Icons.arrow_back,color: Colors.black,),
//                 ),
//                 SizedBox(width: 2,),
//                     Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
//                     // Container(
//                     //   padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
//                     //   height: 30,
//                     //   decoration: BoxDecoration(
//                     //     borderRadius: BorderRadius.circular(30),
//                     //     color: Colors.pink[50],
//                     //   ),
//                     //   child: Row(
//                     //     children: <Widget>[
//                     //       Icon(Icons.add,color: Colors.pink,size: 20,),
//                     //       SizedBox(width: 2,),
//                     //       Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
//                     //     ],
//                     //   ),
//                     // )
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//   padding: EdgeInsets.only(top: 16,left: 16,right: 16),
//   child: TextField(
//     //  onChanged: (value) async {
//     //                 ChatRoomModel? chatroomModel = await getChatroomModel(searchedUser);

//     //                         if(chatroomModel != null) {
//     //                           Navigator.pop(context);
//     //                           Navigator.push(context, MaterialPageRoute(
//     //                             builder: (context) {
//     //                               return ChatRoomPage(
//     //                                 targetUser: searchedUser,
//     //                                 userModel: widget.userModel,
//     //                                 firebaseUser: widget.firebaseUser,
//     //                                 chatroom: chatroomModel,
//     //                               );
//     //                             }
//     //                           ));
//     //                         }
//     // setState(() {  });
//     //  },
//     decoration: InputDecoration(
//       hintText: "Search...",
//       hintStyle: TextStyle(color: Colors.grey.shade600),
//       prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
//       filled: true,
//       fillColor: Colors.grey.shade100,
//       contentPadding: EdgeInsets.all(8),
//       enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(
//               color: Colors.grey.shade100
//           )
//       ),
     
//     ),
//   ),
// ),
//             // Padding(
//             //   padding: const EdgeInsets.symmetric(horizontal: 20),
//             //   child: Row(
//             //     children: [
//             //       Expanded(
//             //           child: Container(
//             //         height: 50,
//             //         padding: const EdgeInsets.symmetric(horizontal: 10),
//             //         decoration: BoxDecoration(
//             //             borderRadius: BorderRadius.circular(15),
//             //             color: Colors.white),
//             //         child: TextField(
//             //             onChanged: (value) {
//             //               setState(() {
//             //                 Users = chatUsers
//             //                     .where((element) => element.name
//             //                         .toLowerCase()
//             //                         .contains(value.toLowerCase()))
//             //                     .toList();
//             //               });
//             //             },
//             //             decoration: InputDecoration(
//             //                 prefixIcon: const Icon(
//             //                   Icons.search_rounded,
//             //                   color: Colors.grey,
//             //                 ),
//             //                 enabledBorder: InputBorder.none,
//             //                 focusedBorder: InputBorder.none,
//             //                 hintText: 'Search',
//             //                 hintStyle:
//             //                     GoogleFonts.poppins(color: Colors.grey))),
//             //       )),
//             //       // const SizedBox(width: 10),
//             //       // Container(
//             //       //     padding: const EdgeInsets.all(10),
//             //       //     decoration: BoxDecoration(
//             //       //         borderRadius: BorderRadius.circular(15), 
//             //       //         // color: grey
//             //       //         ),
//             //       //     child: const Icon(
//             //       //       Icons.tune_rounded,
//             //       //       color: Colors.green,
//             //       //     ))
//             //     ],
//             //   ),
//             // ),
// ListView.builder(
//   itemCount: chatUsers.length,
//   shrinkWrap: true,
//   padding: EdgeInsets.only(top: 16),
//   physics: NeverScrollableScrollPhysics(),
//   itemBuilder: (context, index){
//     return ConversationList(
//       name: chatUsers[index].name,
//       messageText: chatUsers[index].messageText,
//       imageUrl: chatUsers[index].imageURL,
//       time: chatUsers[index].time,
//       isMessageRead: (index == 0 || index == 3)?true:false,
//     );
//   },
// ),
//           ],
//         ),
//       ),
//         floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) {
//             return SearchPage(
//                 //  userModel: widget.userModel, firebaseUser: widget.firebaseUser
//               );
//           }));
//         },
//         child: Icon(Icons.search),
//       ),
//     );
//   }
// }


//--------------------------------
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:testproject/Models/ChatModel.dart';
// import 'package:testproject/Models/ChatRoomModel.dart';
// import 'package:testproject/Models/UserModel.dart';
// import 'package:testproject/Widgets/ConversationList.dart';
// import 'package:testproject/screen/SarchPage.dart';

// class ConversationPage extends StatefulWidget {

//     final UserModel userModel;
//   final User firebaseUser;

//     const ConversationPage({Key? key, 
//   required this.userModel,
//    required this.firebaseUser
//    }) : super(key: key);

//   @override
//   _ConversationPageState createState() => _ConversationPageState();
// }

// class _ConversationPageState extends State<ConversationPage> {

//    List<ChatUsers> Users = chatUsers;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //SingleChildScrollView --> scrollable
//       body: SingleChildScrollView(
//        // child: Center(child: Text("Chat")),
//        //BouncingScrollPhysics --> bouncing effect when a user's scrolling reaches the end or beginning
//       physics: BouncingScrollPhysics(),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             SafeArea(
//               child: Padding(
//                 padding: EdgeInsets.only(
//                   //left: 16,
//                 right: 16,top: 10),
//                 child: Row(
//                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                                     IconButton(
//                   onPressed: (){
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(Icons.arrow_back,color: Colors.black,),
//                 ),
//                 SizedBox(width: 2,),
//                     Text("Conversations",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
//                     // Container(
//                     //   padding: EdgeInsets.only(left: 8,right: 8,top: 2,bottom: 2),
//                     //   height: 30,
//                     //   decoration: BoxDecoration(
//                     //     borderRadius: BorderRadius.circular(30),
//                     //     color: Colors.pink[50],
//                     //   ),
//                     //   child: Row(
//                     //     children: <Widget>[
//                     //       Icon(Icons.add,color: Colors.pink,size: 20,),
//                     //       SizedBox(width: 2,),
//                     //       Text("Add New",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
//                     //     ],
//                     //   ),
//                     // )
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//   padding: EdgeInsets.only(top: 16,left: 16,right: 16),
//   child: TextField(
//     //  onChanged: (value) async {
//     //                 ChatRoomModel? chatroomModel = await getChatroomModel(searchedUser);

//     //                         if(chatroomModel != null) {
//     //                           Navigator.pop(context);
//     //                           Navigator.push(context, MaterialPageRoute(
//     //                             builder: (context) {
//     //                               return ChatRoomPage(
//     //                                 targetUser: searchedUser,
//     //                                 userModel: widget.userModel,
//     //                                 firebaseUser: widget.firebaseUser,
//     //                                 chatroom: chatroomModel,
//     //                               );
//     //                             }
//     //                           ));
//     //                         }
//     // setState(() {  });
//     //  },
//     decoration: InputDecoration(
//       hintText: "Search...",
//       hintStyle: TextStyle(color: Colors.grey.shade600),
//       prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
//       filled: true,
//       fillColor: Colors.grey.shade100,
//       contentPadding: EdgeInsets.all(8),
//       enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(20),
//           borderSide: BorderSide(
//               color: Colors.grey.shade100
//           )
//       ),
     
//     ),
//   ),
// ),
//             // Padding(
//             //   padding: const EdgeInsets.symmetric(horizontal: 20),
//             //   child: Row(
//             //     children: [
//             //       Expanded(
//             //           child: Container(
//             //         height: 50,
//             //         padding: const EdgeInsets.symmetric(horizontal: 10),
//             //         decoration: BoxDecoration(
//             //             borderRadius: BorderRadius.circular(15),
//             //             color: Colors.white),
//             //         child: TextField(
//             //             onChanged: (value) {
//             //               setState(() {
//             //                 Users = chatUsers
//             //                     .where((element) => element.name
//             //                         .toLowerCase()
//             //                         .contains(value.toLowerCase()))
//             //                     .toList();
//             //               });
//             //             },
//             //             decoration: InputDecoration(
//             //                 prefixIcon: const Icon(
//             //                   Icons.search_rounded,
//             //                   color: Colors.grey,
//             //                 ),
//             //                 enabledBorder: InputBorder.none,
//             //                 focusedBorder: InputBorder.none,
//             //                 hintText: 'Search',
//             //                 hintStyle:
//             //                     GoogleFonts.poppins(color: Colors.grey))),
//             //       )),
//             //       // const SizedBox(width: 10),
//             //       // Container(
//             //       //     padding: const EdgeInsets.all(10),
//             //       //     decoration: BoxDecoration(
//             //       //         borderRadius: BorderRadius.circular(15), 
//             //       //         // color: grey
//             //       //         ),
//             //       //     child: const Icon(
//             //       //       Icons.tune_rounded,
//             //       //       color: Colors.green,
//             //       //     ))
//             //     ],
//             //   ),
//             // ),
// ListView.builder(
//   itemCount: chatUsers.length,
//   shrinkWrap: true,
//   padding: EdgeInsets.only(top: 16),
//   physics: NeverScrollableScrollPhysics(),
//   itemBuilder: (context, index){
//     return ConversationList(
//       name: chatUsers[index].name,
//       messageText: chatUsers[index].messageText,
//       imageUrl: chatUsers[index].imageURL,
//       time: chatUsers[index].time,
//       isMessageRead: (index == 0 || index == 3)?true:false,
//     );
//   },
// ),
//           ],
//         ),
//       ),
//         floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context) {
//             return SearchPage(
//                   userModel: widget.userModel, firebaseUser: widget.firebaseUser
//               );
//           }));
//         },
//         child: Icon(Icons.search),
//       ),
//     );
//   }
// }



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testproject/Helper/FirebaseHelper.dart';
import 'package:testproject/Models/ChatModel.dart';
import 'package:testproject/Models/ChatRoomModel.dart';
import 'package:testproject/Models/UserModel.dart';
import 'package:testproject/Pages/LoginPage.dart';
import 'package:testproject/Widgets/ConversationList.dart';
import 'package:testproject/screen/ChatRoomPage.dart';
import 'package:testproject/screen/SarchPage.dart';

class ConversationPage extends StatefulWidget {

    final UserModel userModel;
  final User firebaseUser;

    const ConversationPage({Key? key, 
  required this.userModel,
   required this.firebaseUser
   }) : super(key: key);

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Conversation"),
        // actions: [
        //   IconButton(
        //     onPressed: () async {
        //       await FirebaseAuth.instance.signOut();
        //       Navigator.popUntil(context, (route) => route.isFirst);
        //       Navigator.pushReplacement(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) {
        //             return LoginPage();
        //           }
        //         ),
        //       );
        //     },
        //     icon: Icon(Icons.exit_to_app),
        //   ),
        // ],
      ),
      body: SafeArea(
        child: Container(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
            .collection("chatrooms")
            .where("participants.${widget.userModel.uid}", isEqualTo: true)
            // .orderBy("createdon"
            // // , descending: true
            // )
            .snapshots(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.active) {
                if(snapshot.hasData) {
                  QuerySnapshot chatRoomSnapshot = snapshot.data as QuerySnapshot;

                  return ListView.builder(
                    itemCount: chatRoomSnapshot.docs.length,
                    itemBuilder: (context, index) {
                      ChatRoomModel chatRoomModel = ChatRoomModel
                      .fromMap(chatRoomSnapshot.docs[index]
                      .data() as Map<String, dynamic>);

                      Map<String, dynamic> participants = chatRoomModel.participants!;

                      List<String> participantKeys = participants.keys.toList();
                      participantKeys.remove(widget.userModel.uid);  //remove our id 

                      return FutureBuilder(
                        future: FirebaseHelper.getUserModelById(participantKeys[0]),
                        builder: (context, userData) {
                          if(userData.connectionState == ConnectionState.done) {
                            if(userData.data != null) {
                              UserModel targetUser = userData.data as UserModel;

                              return ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return ChatRoomPage(
                                        chatroom: chatRoomModel,
                                        firebaseUser: widget.firebaseUser,
                                        userModel: widget.userModel,
                                        targetUser: targetUser,
                                      );
                                    }),
                                  );
                                },
                                leading: CircleAvatar(
                                  // backgroundImage: NetworkImage(targetUser.profilepic.toString()),
                                ),
                                // title: Text(targetUser.fullname.toString()),
                                // title: Text(targetUser.name.toString()),
                                title: Text(targetUser.name.toString()),
                                subtitle: (chatRoomModel.lastMessage.toString() != "") ? Text(chatRoomModel.lastMessage.toString()) : Text("Say hi to your new friend!", style: TextStyle(
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                                ),
                              );
                            }
                            else {
                              return Container();
                            }
                          }
                          else {
                            return Container();
                          }
                        },
                      );
                    },
                  );
                }
                else if(snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                else {
                  return Center(
                    child: Text("No Conversation"),
                    
                  );
                }
              }
              else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SearchPage(userModel: widget.userModel, firebaseUser: widget.firebaseUser);
          }));
        },
        child: Icon(Icons.search),
      ),
    );
  }
}