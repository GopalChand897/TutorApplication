//https://doctorcodetutorial.blogspot.com/2020/09/make-flutter-clone-app-ui-suing-flutter.html
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:testproject/Helper/FirebaseHelper.dart';
import 'package:testproject/Models/PostModel.dart';
import 'package:testproject/Models/UserModel.dart' as model;
import 'package:testproject/Models/UserModel.dart';
import 'package:testproject/Services/FireStoreMethods.dart';
import 'package:testproject/Utils/show_snack_bar.dart';
import 'package:testproject/screen/FilterScreen.dart';

import '../Providers/UserProvider.dart';

class PostFeedScreen extends StatefulWidget {
    final snap;
  const PostFeedScreen({Key? key,
   required this.snap,
  }) : super(key: key);
  //   final UserModel userModel;
  // final User firebaseUser;

  //   const PostFeedScreen({Key? key, 
  // required this.userModel,
  //  required this.firebaseUser
  //  }) : super(key: key);

  @override
  State<PostFeedScreen> createState() => _PostFeedScreenState();
}

class _PostFeedScreenState extends State<PostFeedScreen> {
// Post user = Provider.of<UserProvider>(context).getUser as Post;

  int commentLen = 0;
  bool isLikeAnimating = false;

//   var userData = {};
//   bool isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }
//     getData() async {
//     setState(() {
//       isLoading = true;
//     });
//     try {       
// //++--
//     //       final sp = context.read<SignInProvider>();
//     // sp.getDataFromSharedPreferences();
    
//       var snap = await FirebaseFirestore.instance
//           .collection('users')
//         //  .doc(widget.uid)
//           .doc(FirebaseAuth.instance.currentUser!.uid)
//           .get();

//       // get post lENGTH
//       // var postSnap = await FirebaseFirestore.instance
//       //     .collection('posts')
//       //     .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//       //     .get();

//       // postLen = postSnap.docs.length;
//       userData = snap.data()!;
//       // followers = snap.data()!['followers'].length;
//       // following = userSnap.data()!['following'].length;
//       // isFollowing = userSnap
//       //     .data()!['followers']
//       //     .contains(FirebaseAuth.instance.currentUser!.uid);
//       setState(() {});
//     } catch (e) {
//       showSnackBar(
//         context,
//         e.toString(),
//       );
//     }
//     setState(() {
//       isLoading = false;
//     });
//   }


  // deletePost(String postId) async {
  //   try {
  //     await FireStoreMethods().deletePost(postId);
  //   } catch (err) {
  //     showSnackBar(
  //       context,
  //       err.toString(),
  //     );
  //   }
  // }
  @override
  Widget build(BuildContext context) {
//     final model.UserModel user = Provider.of<UserProvider>(context).getUser;
// final width = MediaQuery.of(context).size.width;
  
  // final Future<model.UserModel?> user = snapshot.FirebaseHelper.docSnap;

//   DateTime now = DateTime.now();
// String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);
   // return feedBox();
  //  var contentText='I`m a Physics teacher with 5 years of experience holding masters` degree in physics, currently teaching in ssuet.I can help you clear your concepts related to the subject physics.I`ll be teaching from 7:00 to 9:00 pm (5 days a week from monday to friday),Fees: 5,000 PKR, Feel free to shoot me a message, looking forward to hear from you.';
   return SafeArea(
child: Container(
    margin: EdgeInsets.only(bottom: 20.0),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.white,
     
      // color: Color(0xFF262626),
    ),
//                child:   StreamBuilder(
//                       stream: FirebaseFirestore.instance.collection('posts').snapshots(),
//         builder: (context,
//             AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//                             return ListView.builder(
//                     itemCount: snapshot.data!.docs.length,
//                     itemBuilder: (context, index) {
//                       UserModel user = UserModel
//                       .fromMap(snapshot.data!.docs[index]
//                       .data() as Map<String, dynamic>);

//                       String uid = user.uid!;

//                       List<String> usersid = uid as List<String>;
//                       usersid.remove(widget.userModel.uid);  //remove our id 

//                       return FutureBuilder(
//                         future: FirebaseHelper.getUserModelById(usersid[0]),
//                         builder: (context, userData) {
//                           if(userData.connectionState == ConnectionState.done) {
//                             if(userData.data != null) {
//                               UserModel showpost = userData.data as UserModel;

//                               return ListTile(
//                                 onTap: () {
//                                                 Navigator.pop(context);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return FilterScreen();
//                     },
//                   ),
//                 );
//                                   // Navigator.push(
//                                   //   context,
//                                   //   MaterialPageRoute(builder: (context) {
//                                   //     return ChatRoomPage(
//                                   //       chatroom: chatRoomModel,
//                                   //       firebaseUser: widget.firebaseUser,
//                                   //       userModel: widget.userModel,
//                                   //       targetUser: targetUser,
//                                   //     );
//                                   //   }),
//                                   // );
//                                 },
                              
//                                 leading: CircleAvatar(
//                                   // backgroundImage: NetworkImage(targetUser.profilepic.toString()),
//                                 ),
                                
//                                 // title: Text(targetUser.fullname.toString()),
//                                 title: Text(showpost.email.toString()),
//                                 subtitle: Text(showpost.email.toString()),
//                                 // subtitle: (chatRoomModel.lastMessage.toString() != "") ? Text(chatRoomModel.lastMessage.toString()) : Text("Say hi to your new friend!", style: TextStyle(
//                                 //   color: Theme.of(context).colorScheme.secondary,
//                                 // ),),
//                               );
//                             }
//                             else {
//                               return Container();
//                             }
//                           }
//                           else {
//                             return Container();
//                           }
//                         },
//                       );
//                     },
//                   );
// //           return ListView.builder(
// //             physics: NeverScrollableScrollPhysics(),
// // shrinkWrap: true,
// //             itemCount: snapshot.data!.docs.length,
// //             itemBuilder: (context, index) 
// //             => Container(
// //               // margin: EdgeInsets.symmetric(
// //               //   horizontal: width > webScreenSize ? width * 0.3 : 0,
// //               //   vertical: width > webScreenSize ? 15 : 0,
// //               // ),
// //               child: PostFeedScreen(
// //                 snap: snapshot.data!.docs[index].data(),
// //               ),
// //             ),
// //           );
//         },
//                 ),
    // child: Padding(
    //   padding: EdgeInsets.all(8.0),
      
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
                    Text(
                    //  snap["name"],
                    widget.snap['name'].toString(),
                    // widget.snap['email'].toString(),
                  // userData['name']?? '',
                      // "name",
                   
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
                    //   Icon(Icons.location_pin),
 //Text(formattedDate,textAlign: TextAlign.center,style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 25.0),)
Text(
  DateFormat.yMMMd().format(widget.snap['datePublished'].toDate(),),

)
                //     Text("Karachi,Pakistan",
                //  //     date,
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 16.0,
                //         fontWeight: FontWeight.w400,
                //       ),
                //     ),
                // Text(widget.snap['datePublished'].toString(),),
                     ]),

                  ],
                ),
              ),
        //                         IconButton(
        //   icon: const Icon(Icons.more_horiz),
        //   onPressed: () => print('More'),
        // ),
        IconButton(
                        onPressed: () {
                          showDialog(
                            useRootNavigator: false,
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: ListView(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    shrinkWrap: true,
                                    children: [
                                      'Delete',
                                    ]
                                        .map(
                                          (e) => InkWell(
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 16),
                                                child: Text(e),
                                              ),
                                              onTap: () {
                                                // deletePost(
                                                //   widget.snap['postId']
                                                //       .toString(),
                                                // );
                                                // remove the dialog box
                                                Navigator.of(context).pop();
                                              }),
                                        )
                                        .toList()),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.more_vert),
                      ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
Text(widget.snap['description'].toString(),),
          // if (contentText != "")
          //   Text(
          //     contentText,
          //     style: TextStyle(
          //       color: Colors.black,
          //        fontSize: 16.0
          //        ),
          //   ),
          SizedBox(
            height: 10.0,
          ),
        //  if (contentImg != "") Image.network(contentImg),
          // SizedBox(
          //   height: 10.0,
          // ),
//const Divider(),
          Divider(
            thickness: 1.5,
            color: Color(0xFF505050),
          ),
   Column(
      children: [
     //   Row(
          // children: [
          //   Container(
          //     padding: const EdgeInsets.all(4.0),
            //  decoration: BoxDecoration(
             //   color: Palette.facebookBlue,
              //  shape: BoxShape.circle,
          //    ),
              // child: const Icon(
              //   Icons.thumb_up,
              //   size: 10.0,
              //   color: Colors.white,
              // ),
        //    ),
            // const SizedBox(width: 4.0),
            // Expanded(
            //   child: Text('Likes',
            //   //  '${post.likes}',
            //     style: TextStyle(
            //       color: Colors.grey[600],
            //     ),
            //   ),
            // ),
            // Text('Comments',
            // //  '${post.comments} Comments',
            //   style: TextStyle(
            //     color: Colors.grey[600],
            //   ),
            // ),
            // const SizedBox(width: 8.0),
            // Text('Shares',
            //  // '${post.shares} Shares',
            //   style: TextStyle(
            //     color: Colors.grey[600],
            //   ),
            // )
        //   ],
        // ),
        // const Divider(),
        // Row(
        //   children: [
        //     IconButton(
        //       onPressed: (){},
        //        icon: Icon(
        //         Icons. ,
        //         // color: Colors.red,
        //        ),
        //        ),
        //                    IconButton(
        //       onPressed: (){},
        //        icon: Icon(
        //         Icons.mode_comment_outlined,
        //         // color: Colors.red,
        //        ),
        //        ),
        //                    IconButton(
        //       onPressed: (){},
        //        icon: Icon(
        //         Icons.favorite_border,
        //         // color: Colors.red,
        //        ),
        //        ),
        //   ],
        // ),
                Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                // color: Palette.facebookBlue,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 4.0),
            Expanded(
              child: Text(
                // '${post.likes}',
             '100 Likes',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
      Expanded(
              child:
            Text(
              // '${post.comments} Comments',
              '200 Comments',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),),
            // const SizedBox(width: 8.0),
          //       Expanded(
          //     child:  Text(
          //     // '${post.shares} Shares',
          //  'Favourites',
          //     style: TextStyle(
          //       color: Colors.grey[600],
          //     ),
          //   ))
          ],
        ),
        const Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(
                //  MdiIcons.thumbUpOutline,
                Icons.thumb_up_alt_outlined,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Like',
              onTap: () => print('Like'),
            ),
            _PostButton(
              icon: Icon(
                // MdiIcons.commentOutline,
              Icons.mode_comment_outlined,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Comment',
              onTap: () =>
              //  print('Comment'),
            {
                            //     if (!myList.contains(currentMovie)) {
                            //   context
                            //       .read<PostProvider>()
                            //       .addToList(currentMovie);
                            // } else {
                            //   context
                            //       .read<PostProvider>()
                            //       .removeFromList(currentMovie);
                            // }
            }
            ),
            // _PostButton(
            //   icon: Icon(
            //      MdiIcons.chatOutline,
            //     color: Colors.grey[600],
            //     size: 20.0,
            //   ),
            //   label: 'Contact',
            //   onTap: () => print('Contact'),
            // ),
                        _PostButton(
              icon: Icon(
                //  MdiIcons.heart,
              Icons.favorite_border,
                color: Colors.grey[600],
                size: 20.0,
              ),
              label: 'Favourite',
              onTap: () => print('Favourite'),
            ),
        //     // _PostButton(
        //     //   icon: Icon(
        //     //     MdiIcons.shareOutline,
        //     //     color: Colors.grey[600],
        //     //     size: 25.0,
        //     //   ),
        //     //   label: 'Share',
        //     //   onTap: () => print('Share'),
        //     // ),
        //   ],
        // ),
      ],
    ),
    // Container(
    //   padding: EdgeInsets.symmetric(horizontal: 16),
    //   child: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [Text('12',style: Theme.of(context).textTheme.bodyText2,),],
    //   ),
    // ),
          //    //DESCRIPTION AND NUMBER OF COMMENTS
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       DefaultTextStyle(
          //           style: Theme.of(context)
          //               .textTheme
          //               .subtitle2!
          //               .copyWith(fontWeight: FontWeight.w800),
          //           child: Text(
          //             // '${widget.snap['likes'].length} likes',
          //           '100 likes',
          //             style: Theme.of(context).textTheme.bodyText2,
          //           )),
          //       Container(
          //         width: double.infinity,
          //         padding: const EdgeInsets.only(
          //           top: 8,
          //         ),
          //         // child: RichText(
          //         //   text: TextSpan(
          //         //     // style: const TextStyle(color: primaryColor),
          //         //     children: [
          //         //       TextSpan(
          //         //         text: widget.snap['username'].toString(),
          //         //         style: const TextStyle(
          //         //           fontWeight: FontWeight.bold,
          //         //         ),
          //         //       ),
          //         //       TextSpan(
          //         //         text: ' ${widget.snap['description']}',
          //         //       ),
          //         //     ],
          //         //   ),
          //         // ),
          //       ),
          //       InkWell(
          //         child: Container(
          //           child: Text(
          //             // 'View all $commentLen comments',
          //         'View all 200 comments',
          //             style: const TextStyle(
          //               fontSize: 16,
          //               // color: secondaryColor,
          //             ),
          //           ),
          //           padding: const EdgeInsets.symmetric(vertical: 4),
          //         ),
          //         onTap: () => null,
          //         //  Navigator.of(context).push(
          //         //   MaterialPageRoute(
          //         //     builder: (context) => CommentsScreen(
          //         //       postId: widget.snap['postId'].toString(),
          //         //     ),
          //         //   ),
          //         // ),
          //       ),
          //       // Container(
          //       //   child: Text(
          //       //     DateFormat.yMMMd()
          //       //         .format(widget.snap['datePublished'].toDate()),
          //       //     style: const TextStyle(
          //       //       // color: secondaryColor,
          //       //     ),
          //       //   ),
          //       //   padding: const EdgeInsets.symmetric(vertical: 4),
          //       // ),
          //     ],
          //   ),
          // )

          // Row(
          //   children: [
          //     actionButton(Icons.thumb_up, "Like", Color(0xFF505050)),
          //     actionButton(Icons.comment, "Reply", Color(0xFF505050)),
          //     actionButton(Icons.share, "Share", Color(0xFF505050)),
          //   ],
          // ),
        ],
      ),
    // ),
  ],
   )
   )
   );
  }
}

//the feed box will have for parameters :
// the user name , the user avatar, the pub date, the content text and content img
// Widget feedBox(
//   //  String avatarUrl, 
//   // String userName, String date,
//   //   String contentText, String contentImg
//     ) {
//   var contentText='I`m a Physics teacher with 5 years of experience holding masters` degree in physics, currently teaching in ssuet.I can help you clear your concepts related to the subject physics.I`ll be teaching from 7:00 to 9:00 pm (5 days a week from monday to friday),Fees: 5,000 PKR, Feel free to shoot me a message, looking forward to hear from you.';
//   return Container(
//     margin: EdgeInsets.only(bottom: 20.0),
//     width: double.infinity,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(12.0),
//                                   color: Colors.white,
     
//       // color: Color(0xFF262626),
//     ),
//     child: Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start, 
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               CircleAvatar(
//               //   backgroundImage: NetworkImage(avatarUrl),
//                 radius: 25.0,
//               ),
//               SizedBox(
//                 width: 10.0,
//               ),
//               Expanded(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       snap['username'],
//                       //"name",
//                    //   userName,
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5.0,
//                     ),
//                 //     Row(
//                 //       children:[
//                 //         Icon(Icons.location_pin),
//                 //     Text("Karachi,Pakistan",
//                 //  //     date,
//                 //       style: TextStyle(
//                 //         color: Colors.black,
//                 //         fontSize: 16.0,
//                 //         fontWeight: FontWeight.w400,
//                 //       ),
//                 //     ), ]),
//                   ],
//                 ),
//               ),
//                                 IconButton(
//           icon: const Icon(Icons.more_horiz),
//           onPressed: () => print('More'),
//         ),
//             ],
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           if (contentText != "")
//             Text(
//               contentText,
//               style: TextStyle(
//                 color: Colors.black,
//                  fontSize: 16.0
//                  ),
//             ),
//           SizedBox(
//             height: 10.0,
//           ),
//         //  if (contentImg != "") Image.network(contentImg),
//           // SizedBox(
//           //   height: 10.0,
//           // ),
// //const Divider(),
//           Divider(
//             thickness: 1.5,
//             color: Color(0xFF505050),
//           ),
//    Column(
//       children: [
//      //   Row(
//           // children: [
//           //   Container(
//           //     padding: const EdgeInsets.all(4.0),
//             //  decoration: BoxDecoration(
//              //   color: Palette.facebookBlue,
//               //  shape: BoxShape.circle,
//           //    ),
//               // child: const Icon(
//               //   Icons.thumb_up,
//               //   size: 10.0,
//               //   color: Colors.white,
//               // ),
//         //    ),
//             // const SizedBox(width: 4.0),
//             // Expanded(
//             //   child: Text('Likes',
//             //   //  '${post.likes}',
//             //     style: TextStyle(
//             //       color: Colors.grey[600],
//             //     ),
//             //   ),
//             // ),
//             // Text('Comments',
//             // //  '${post.comments} Comments',
//             //   style: TextStyle(
//             //     color: Colors.grey[600],
//             //   ),
//             // ),
//             // const SizedBox(width: 8.0),
//             // Text('Shares',
//             //  // '${post.shares} Shares',
//             //   style: TextStyle(
//             //     color: Colors.grey[600],
//             //   ),
//             // )
//         //   ],
//         // ),
//         // const Divider(),
//         Row(
//           children: [
//             _PostButton(
//               icon: Icon(
//                  MdiIcons.thumbUpOutline,
//                 color: Colors.grey[600],
//                 size: 20.0,
//               ),
//               label: 'Like',
//               onTap: () => print('Like'),
//             ),
//             _PostButton(
//               icon: Icon(
//                 MdiIcons.commentOutline,
//                 color: Colors.grey[600],
//                 size: 20.0,
//               ),
//               label: 'Comment',
//               onTap: () => print('Comment'),
//             ),
//             _PostButton(
//               icon: Icon(
//                 MdiIcons.shareOutline,
//                 color: Colors.grey[600],
//                 size: 25.0,
//               ),
//               label: 'Share',
//               onTap: () => print('Share'),
//             ),
//           ],
//         ),
//       ],
//     ),
//           // Row(
//           //   children: [
//           //     actionButton(Icons.thumb_up, "Like", Color(0xFF505050)),
//           //     actionButton(Icons.comment, "Reply", Color(0xFF505050)),
//           //     actionButton(Icons.share, "Share", Color(0xFF505050)),
//           //   ],
//           // ),
//         ],
//       ),
//     ),
//   );
// }


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


class _PostButton extends StatelessWidget {
   final Icon icon;
   final String label;
   final Function onTap;

  const _PostButton({
    Key? key,
     required this.icon,
     required this.label,
     required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
       //   onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 icon,
                const SizedBox(width: 4.0),
             //   Text(label),
              Text(label)
              ],
            ),
          ),
        ),
      ),
    );
  }
}