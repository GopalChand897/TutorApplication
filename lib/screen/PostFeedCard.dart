  // import 'package:cloud_firestore/cloud_firestore.dart';
  // import 'package:flutter/material.dart';
  // import 'package:testproject/screen/FeedBox.dart';

  // class PostCard extends StatefulWidget {
  //   const PostCard({Key? key}) : super(key: key);

  //   @override
  //   State<PostCard> createState() => _PostCardState();
  // }

  // class _PostCardState extends State<PostCard> {
  //   @override
  //   Widget build(BuildContext context) {
  //     final width = MediaQuery.of(context).size.width;

  //     return Scaffold(
  //     //  backgroundColor:
  //        //   width > webScreenSize ? webBackgroundColor : mobileBackgroundColor,
  //       appBar: 
  //       //width > webScreenSize
  //         //  ? null
  //          // :
  //            AppBar(
  //               // backgroundColor: mobileBackgroundColor,
  //               // centerTitle: false,
  //               // title: SvgPicture.asset(
  //               //   'assets/ic_instagram.svg',
  //               //   color: primaryColor,
  //               //   height: 32,
  //               // ),
  //               actions: [
  //                 IconButton(
  //                   icon: const Icon(
  //                     Icons.messenger_outline,
  //               //      color: primaryColor,
  //                   ),
  //                   onPressed: () {},
  //                 ),
  //               ],
  //             ),
  //       body: StreamBuilder(
  //         stream: FirebaseFirestore.instance.collection('posts').snapshots(),
  //         builder: (context,
  //             AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
  //           if (snapshot.connectionState == ConnectionState.waiting) {
  //             return const Center(
  //               child: CircularProgressIndicator(),
  //             );
  //           }
  //           return ListView.builder(
  //             itemCount: snapshot.data!.docs.length,
  //             itemBuilder: (ctx, index) => Container(
  //               // margin: EdgeInsets.symmetric(
  //               //   horizontal: width > webScreenSize ? width * 0.3 : 0,
  //               //   vertical: width > webScreenSize ? 15 : 0,
  //               // ),
  //               child: PostFeedScreen(
  //                 snap: snapshot.data!.docs[index].data(),
  //               ),
  //             ),
  //           );
  //         },
  //       ),
  //     );
  //   }
  // }