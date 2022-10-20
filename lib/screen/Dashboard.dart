import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:testproject/Providers/UserProvider.dart';
import 'package:testproject/screen/ChatPage.dart';
import 'package:testproject/screen/FeedBox.dart';
import 'package:testproject/screen/Post.dart';
import 'package:testproject/screen/login_signup.dart';
import 'package:testproject/Models/UserModel.dart' as model;


// class Dashboard extends StatelessWidget {
//   const Dashboard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MyDashboard();
//   }
// }

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String name = '';//
  String email = '';//




 
//   _getSharedPref() async{
//  //   User user = FirebaseAuth.instance.currentUser!;
//    User? user = FirebaseAuth.instance.currentUser!;
//    // FirebaseAuth.instance.currentUser!;
//     user.then((value){
//       setState(() {
//       //  isEmailVerified = value.isEmailVerified;
//         email = value.email;
//       });
//       FirebaseFirestore.instance.collection('users').where('uid',isEqualTo: value.uid).limit(1).get().then((firestoreData){
//         setState(() {
//           name = firestoreData.docs[0].data()['name'];
//           email = firestoreData.docs[0].data()['email'];
//           // dept   = email.substring(2,4).toUpperCase();
//           // batch  = email.substring(4,6).toUpperCase();
//           // roll   = email.substring(7,email.length).toUpperCase();
//           // int timeNow = DateTime.now().millisecondsSinceEpoch ?? 0;
//           // int timeSignup = firestoreData.documents[0].data['timestamp'] ?? 0;
//           // hoursSpend = (timeNow-timeSignup)/1000/60/60 ?? 0.0;
//         });

//         // if(isEmailVerified == false && hoursSpend > 24){
//         //   showDialog(
//         //     context: context,
//         //     builder: (BuildContext context) {
//         //       // return object of type Dialog
//         //       return AlertDialog(
//         //         title: new Text("Email is not verified!"),
//         //         actions: <Widget>[
//         //           new FlatButton(
//         //             child: new Text("Close"),
//         //             onPressed: () {
//         //               Navigator.of(context).pop();
//         //               exit(0);
//         //             },
//         //           ),
//         //         ],
//         //       );
//         //     },
//         //   );
//         // }
//       });
//     });
//   }



//   @override
//   void initState() {
//     super.initState();
//     // _getNewsTotal();
//     // _getMessage();
//     _getSharedPref();
//  //   BackButtonInterceptor.add(myInterceptor);
//   }
  
  
  
  //  TextEditingController _nameController = TextEditingController();
  // TextEditingController _emailController = TextEditingController();

  // var uuid = Uuid();
  
  // getCustomerName(name) {
  //   this.name = name;
  // }

  // getCustomerMobileNo(email) {
  //   this.email = email;
  // }


// Future _getDataFromDatabase()async{
//  var value = await FirebaseFirestore.instance.collection("users")
//   .doc(FirebaseAuth.instance.currentUser!.uid)
//   .get()
//   .then((value) async {
// if(value.exists){
//   setState(() {
//     name = value.data()!["name"];
//     email = value.data()!["email"];
//   });
// }
//   });
// }

//  Future getCurrentUserData() async{
//     try {
//       DocumentSnapshot ds = await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();
//       String  name = ds.get('name');
//       String email = ds.get('email');
//       return [name,email];
//     }catch(e){
//       print(e.toString());
//       return null;
//     }
//   }


// @override
// void initState(){
//   super.initState();
// _getDataFromDatabase();
// //  getCurrentUserData();
// }

//   @override
//   void initState() {
//     super.initState();
//     // _getNewsTotal();
//     // _getMessage();
//     _getSharedPref();
//  //   BackButtonInterceptor.add(myInterceptor);
//   }

@override
void initState() {
    super.initState();
    getUserData();
  }
  
void getUserData() async {// yeh kia logic lagai thee? yeh users k collection se data get karna , to null q aa raha hai? yeh statemanaget k through krrha hu pta nh null q arha h lakin one time ata h data
//matlab dubara chalaon ga sah jay ga? han lakin abi pta nh build hi
  
      FirebaseFirestore.instance.collection('users')
      .where(FirebaseAuth.instance.currentUser!.uid)
      .limit(1)
      .get()
      .then((snap){
       
// DocumentSnapshot snap = await FirebaseFirestore.instance
// .collection('users')
// .doc(FirebaseAuth.instance.currentUser!.uid)
// .get();
// print(snap.data());
//// print((snap.data() as Map<String, dynamic>)['name']);
setState(() {
 name = snap.docs[0].data()['name'];
 email = snap.docs[0].data()['email'];
 // name = (snap.data() as Map<String, dynamic>)['name'];
});
});

}

  @override
  Widget build(BuildContext context) {
model.User user = Provider.of<UserProvider>(context).getUser;

      List<String> avatarUrl = [
    "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
    "https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
    "https://images.unsplash.com/photo-1525879000488-bff3b1c387cf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
  ];
    return Scaffold(
      drawer: new Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
          //  accountName: Text('HaiderAli'),
           accountName: Text('$name'),
            accountEmail: Text('$email'),
          //  accountName: Text(user.name),
          //   accountEmail: Text(user.email),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                // child: Image.network(
                //   'https://www.nicepng.com/maxp/u2q8o0a9u2e6/e6y3',
                //   fit: BoxFit.cover,
                //   width: 90,
                //   height: 90,
                // ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://rare-gallery.com/352962-4k-wallpaper.html')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favorites'),
            onTap: () => null,
          ),
                 ListTile(
            leading: Icon(Icons.group),
            title: Text('Friends'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chat'),
            onTap: () => 
                                                Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  ChatPage())),),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Request'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
              onTap: () {
              Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginSignupScreen();
                    },
                  ),
                );
   },
           // onTap: () => null,
          ),
        ],
      ),
    ),
      appBar: AppBar(
        title: Text("Dashboard"),
                actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu),
          ),
        ],

      ),
//         body: SingleChildScrollView(
//           child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Center(
//         child: Expanded(
//           flex: 2,
//           child: Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
                
//                 const SizedBox(
//                   width: 24,
//                   height: 24,
//                 ),
//                 const Text(
//                   "Hey Haider",
//                   textScaleFactor: 3,
//                 ),
//                 const SizedBox(
//                   width: 12,
//                   height: 12,
//                 ),
//             //  Container(
//             //   width: 250.0,
//             //   child: TextField(
//             //   //  controller: captionController,
//             //     decoration: InputDecoration(
//             //       hintText: "What's in your mind",
//             //       border: InputBorder.none,
//             //     ),
//             //   ),
//             // ),
//             GestureDetector(
//             onTap: () {
//                Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => Post()),
//   );
//             },
//             child: Container(
//               height: 50,
//               width: 600,
//               alignment: Alignment.centerLeft,
//               padding: EdgeInsets.only(left: 12),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(34),
//                 border: Border.all(
//                   color: Colors.grey,
//                   width: 1.5,
//                 ),
//               ),
//               child: Text(
//                 "What's on your mind ?",
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//           ),
//             Divider(),
//                                 Container(
// child: Card(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   const ListTile(
//                     leading: Icon(Icons.person),
//                     title: Text('Fazal Qareem, Nazimabad, karachi.'),
//                     subtitle: Text('I`m a Physics teacher with 5 years of experience holding masters` degree in physics, currently teaching in ssuet.I can help you clear your concepts related to the subject physics.I`ll be teaching from 7:00 to 9:00 pm (5 days a week from monday to friday),Fees: 5,000 PKR, Feel free to shoot me a message, looking forward to hear from you.'),
//                   ),
//                    Row(
//                   children: [
//                     OutlinedButton(
//                       child: const Text("Like"),
//                       onPressed: () => {print("hello")},
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Container(),
//                     ),
//                     OutlinedButton(
//                       child: const Text("Comment"),
//                       onPressed: () => {print("hello")},
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Container(),
//                     ),
//                     OutlinedButton(
//                       child: const Text("Message"),
//                       onPressed: () => {print("hello")},
//                     ),
//                   ],
//                 ),
//                 ],
//                 ),
                
//   ),
//       ),
//       Divider(),
//              Row(
//               children: [
//                 Expanded(
//                   child: Card(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   const ListTile(
//                     leading: Icon(Icons.person),
//                     title: Text('Mathematics'),
//                     subtitle: Text('A math teacher instructs students in the broad field of mathematics. This can include general math and/or any of the fields within mathematics such as algebra, geometry, statistics, and calculus. Math teachers are considered STEM (science, technology, engineering, and mathematics) teachers.'),
//                   ),
//                    Row(
//                   children: [
//                     OutlinedButton(
//                       child: const Text("Like"),
//                       onPressed: () => {print("hello")},
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Container(),
//                     ),
//                     OutlinedButton(
//                       child: const Text("Comment"),
//                       onPressed: () => {print("hello")},
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Container(),
//                     ),
//                     OutlinedButton(
//                       child: const Text("Message"),
//                       onPressed: () => {print("hello")},
//                     ),
//                   ],
//                 ),
//                 ],
//                 ),
                
//   ),
//                 ),
//               ],
//             )
//               ],
//             ),
//           ),
//         ),
//       ),
//     )
//     )
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //First of all we need to creat the post editor
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
             //    color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25.0,
                    //        backgroundImage: NetworkImage(avatarUrl[0]),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: TextField(
                                                                onTap: () {
                                    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Post()));
                                  },
                              // style: TextStyle(
                              //   color: Colors.white,
                              // ),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 25.0),
                                  hintText: "What's on your mind?",
                                  filled: true,
                              //    fillColor: mainGrey,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide.none,
                                  )
                                  ),

                                  //             onTap: () {
//                Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) =>  Post()),
                            ),
                          ),
                        ],
                      ),
                  //     SizedBox(
                  //       height: 5.0,
                  //     ),
                      Divider(
                   //     color: mainGrey,
                        thickness: 1.5,
                      ),
                      //Now we will create a Row of three button
                      Row(
                        children: [
                          // actionButton(
                          //     Icons.live_tv, "Live", Color(0xFFF23E5C)),
                          // actionButton(
                          //     Icons.image, "Picture", Color(0xFF58C472)),
                          // actionButton(Icons.insert_emoticon, "Activity",
                          //     Color(0xFFF8C03E)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              //We have finished the Post editor now let's create
              //the story's timeline
              // let's first create a new file for the custom widget
              //now let's buil the container
              // SizedBox(
              //   height: 10.0,
              // ),
              // Container(
              //   height: 160.0,
              //   width: double.infinity,
              //   child: ListView(
              //     scrollDirection: Axis.horizontal,
              //     children: [
              //       // storyTile(avatarUrl[0], storyUrl[0], "Ling chang"),
              //       // storyTile(avatarUrl[1], storyUrl[1], "Ling chang"),
              //       // storyTile(avatarUrl[2], storyUrl[2], "Ling chang"),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 20.0,
              // ),
              feedBox(),
              feedBox(),
              feedBox(),
              feedBox(),
              feedBox(),
              //Now let's create the news feed
              //first we will make the custom container of the feed
              //Ok let's test our widget
              // feedBox(
              //   avatarUrl[0], 
              // "Doctor code", "6 min",
              //     "I just wrote something", ""),
              // feedBox(
              //   avatarUrl[1],
              //    "Joseph Joestar", "6 min",
              //     "It's pretty good I like it", 
              //    // storyUrl[2]
              //     ),
              // feedBox(
              //   avatarUrl[2],
              //    "Giorno giovana", "Yesterday",
              //     "I'm Giorno Giovana and I have a Dream", 
              //     //storyUrl[1]
              //     ),
            ],
          ),
        ),
      ),
      //       bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Colors.red,
      //   unselectedItemColor: Colors.grey.shade600,
      //   selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      //   unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
      //   type: BottomNavigationBarType.fixed,
      //   // ignore: prefer_const_literals_to_create_immutables
      //   items: [
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.message),
      //       label: 'Chat',
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.group_work),
      //       label: 'Channels',
      //     ),
      //     const BottomNavigationBarItem(
      //       icon: Icon(Icons.account_box),
      //       label: 'Profile',
      //     ),
      //   ],
      // ),
    );
  }
}
// class Dashboard extends StatelessWidget {
//   const Dashboard({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//       List<String> avatarUrl = [
//     "https://images.unsplash.com/photo-1518806118471-f28b20a1d79d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80",
//     "https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
//     "https://images.unsplash.com/photo-1522075469751-3a6694fb2f61?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=80",
//     "https://images.unsplash.com/photo-1525879000488-bff3b1c387cf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80",
//   ];
//     return Scaffold(
//       drawer: new Drawer(
//       child: ListView(
//         // Remove padding
//         padding: EdgeInsets.zero,
//         children: [
//           UserAccountsDrawerHeader(
//             accountName: Text('HaiderAli'),
//             accountEmail: Text('haiderali_zaidi@outlook.com'),
//             currentAccountPicture: CircleAvatar(
//               child: ClipOval(
//                 // child: Image.network(
//                 //   'https://www.nicepng.com/maxp/u2q8o0a9u2e6/e6y3',
//                 //   fit: BoxFit.cover,
//                 //   width: 90,
//                 //   height: 90,
//                 // ),
//               ),
//             ),
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               image: DecorationImage(
//                   fit: BoxFit.fill,
//                   image: NetworkImage(
//                       'https://rare-gallery.com/352962-4k-wallpaper.html')),
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.favorite),
//             title: Text('Favorites'),
//             onTap: () => null,
//           ),
//           ListTile(
//             leading: Icon(Icons.person),
//             title: Text('Friends'),
//             onTap: () => null,
//           ),
//           ListTile(
//             leading: Icon(Icons.share),
//             title: Text('Share'),
//             onTap: () => null,
//           ),
//           ListTile(
//             leading: Icon(Icons.notifications),
//             title: Text('Request'),
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.settings),
//             title: Text('Settings'),
//             onTap: () => null,
//           ),
//           ListTile(
//             leading: Icon(Icons.description),
//             title: Text('Policies'),
//             onTap: () => null,
//           ),
//           Divider(),
//           ListTile(
//             title: Text('Exit'),
//             leading: Icon(Icons.exit_to_app),
//               onTap: () {
//               Navigator.pop(context);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return LoginSignupScreen();
//                     },
//                   ),
//                 );
//    },
//            // onTap: () => null,
//           ),
//         ],
//       ),
//     ),
//       appBar: AppBar(
//         title: Text("Dashboard"),
//                 actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.search),
//           ),
//           IconButton(
//             onPressed: () {},
//             icon: Icon(Icons.menu),
//           ),
//         ],

//       ),
// //         body: SingleChildScrollView(
// //           child: Padding(
// //       padding: const EdgeInsets.all(8.0),
// //       child: Center(
// //         child: Expanded(
// //           flex: 2,
// //           child: Center(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
                
// //                 const SizedBox(
// //                   width: 24,
// //                   height: 24,
// //                 ),
// //                 const Text(
// //                   "Hey Haider",
// //                   textScaleFactor: 3,
// //                 ),
// //                 const SizedBox(
// //                   width: 12,
// //                   height: 12,
// //                 ),
// //             //  Container(
// //             //   width: 250.0,
// //             //   child: TextField(
// //             //   //  controller: captionController,
// //             //     decoration: InputDecoration(
// //             //       hintText: "What's in your mind",
// //             //       border: InputBorder.none,
// //             //     ),
// //             //   ),
// //             // ),
// //             GestureDetector(
// //             onTap: () {
// //                Navigator.push(
// //     context,
// //     MaterialPageRoute(builder: (context) => Post()),
// //   );
// //             },
// //             child: Container(
// //               height: 50,
// //               width: 600,
// //               alignment: Alignment.centerLeft,
// //               padding: EdgeInsets.only(left: 12),
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(34),
// //                 border: Border.all(
// //                   color: Colors.grey,
// //                   width: 1.5,
// //                 ),
// //               ),
// //               child: Text(
// //                 "What's on your mind ?",
// //                 style: TextStyle(
// //                   color: Colors.black,
// //                 ),
// //               ),
// //             ),
// //           ),
// //             Divider(),
// //                                 Container(
// // child: Card(
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: <Widget>[
// //                   const ListTile(
// //                     leading: Icon(Icons.person),
// //                     title: Text('Fazal Qareem, Nazimabad, karachi.'),
// //                     subtitle: Text('I`m a Physics teacher with 5 years of experience holding masters` degree in physics, currently teaching in ssuet.I can help you clear your concepts related to the subject physics.I`ll be teaching from 7:00 to 9:00 pm (5 days a week from monday to friday),Fees: 5,000 PKR, Feel free to shoot me a message, looking forward to hear from you.'),
// //                   ),
// //                    Row(
// //                   children: [
// //                     OutlinedButton(
// //                       child: const Text("Like"),
// //                       onPressed: () => {print("hello")},
// //                     ),
// //                     Expanded(
// //                       flex: 1,
// //                       child: Container(),
// //                     ),
// //                     OutlinedButton(
// //                       child: const Text("Comment"),
// //                       onPressed: () => {print("hello")},
// //                     ),
// //                     Expanded(
// //                       flex: 1,
// //                       child: Container(),
// //                     ),
// //                     OutlinedButton(
// //                       child: const Text("Message"),
// //                       onPressed: () => {print("hello")},
// //                     ),
// //                   ],
// //                 ),
// //                 ],
// //                 ),
                
// //   ),
// //       ),
// //       Divider(),
// //              Row(
// //               children: [
// //                 Expanded(
// //                   child: Card(
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: <Widget>[
// //                   const ListTile(
// //                     leading: Icon(Icons.person),
// //                     title: Text('Mathematics'),
// //                     subtitle: Text('A math teacher instructs students in the broad field of mathematics. This can include general math and/or any of the fields within mathematics such as algebra, geometry, statistics, and calculus. Math teachers are considered STEM (science, technology, engineering, and mathematics) teachers.'),
// //                   ),
// //                    Row(
// //                   children: [
// //                     OutlinedButton(
// //                       child: const Text("Like"),
// //                       onPressed: () => {print("hello")},
// //                     ),
// //                     Expanded(
// //                       flex: 1,
// //                       child: Container(),
// //                     ),
// //                     OutlinedButton(
// //                       child: const Text("Comment"),
// //                       onPressed: () => {print("hello")},
// //                     ),
// //                     Expanded(
// //                       flex: 1,
// //                       child: Container(),
// //                     ),
// //                     OutlinedButton(
// //                       child: const Text("Message"),
// //                       onPressed: () => {print("hello")},
// //                     ),
// //                   ],
// //                 ),
// //                 ],
// //                 ),
                
// //   ),
// //                 ),
// //               ],
// //             )
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     )
// //     )
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               //First of all we need to creat the post editor
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//              //    color: Colors.white,
//                   borderRadius: BorderRadius.circular(12.0),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 8.0, vertical: 10.0),
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           CircleAvatar(
//                             radius: 25.0,
//                     //        backgroundImage: NetworkImage(avatarUrl[0]),
//                           ),
//                           SizedBox(
//                             width: 10.0,
//                           ),
//                           Expanded(
//                             child: TextField(
//                               // style: TextStyle(
//                               //   color: Colors.white,
//                               // ),
//                               decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.only(left: 25.0),
//                                   hintText: "What's on your mind?",
//                                   filled: true,
//                               //    fillColor: mainGrey,
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30.0),
//                                     borderSide: BorderSide.none,
//                                   )
//                                   ),
//                                   onTap: () {
//                                     Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) =>  Post()));
//                                   },
//                                   //             onTap: () {
// //                Navigator.push(
// //     context,
// //     MaterialPageRoute(builder: (context) =>  Post()),
//                             ),
//                           ),
//                         ],
//                       ),
//                   //     SizedBox(
//                   //       height: 5.0,
//                   //     ),
//                       Divider(
//                    //     color: mainGrey,
//                         thickness: 1.5,
//                       ),
//                       //Now we will create a Row of three button
//                       Row(
//                         children: [
//                           // actionButton(
//                           //     Icons.live_tv, "Live", Color(0xFFF23E5C)),
//                           // actionButton(
//                           //     Icons.image, "Picture", Color(0xFF58C472)),
//                           // actionButton(Icons.insert_emoticon, "Activity",
//                           //     Color(0xFFF8C03E)),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               //We have finished the Post editor now let's create
//               //the story's timeline
//               // let's first create a new file for the custom widget
//               //now let's buil the container
//               // SizedBox(
//               //   height: 10.0,
//               // ),
//               // Container(
//               //   height: 160.0,
//               //   width: double.infinity,
//               //   child: ListView(
//               //     scrollDirection: Axis.horizontal,
//               //     children: [
//               //       // storyTile(avatarUrl[0], storyUrl[0], "Ling chang"),
//               //       // storyTile(avatarUrl[1], storyUrl[1], "Ling chang"),
//               //       // storyTile(avatarUrl[2], storyUrl[2], "Ling chang"),
//               //     ],
//               //   ),
//               // ),
//               // SizedBox(
//               //   height: 20.0,
//               // ),
//               feedBox(),
//               feedBox(),
//               feedBox(),
//               feedBox(),
//               feedBox(),
//               //Now let's create the news feed
//               //first we will make the custom container of the feed
//               //Ok let's test our widget
//               // feedBox(
//               //   avatarUrl[0], 
//               // "Doctor code", "6 min",
//               //     "I just wrote something", ""),
//               // feedBox(
//               //   avatarUrl[1],
//               //    "Joseph Joestar", "6 min",
//               //     "It's pretty good I like it", 
//               //    // storyUrl[2]
//               //     ),
//               // feedBox(
//               //   avatarUrl[2],
//               //    "Giorno giovana", "Yesterday",
//               //     "I'm Giorno Giovana and I have a Dream", 
//               //     //storyUrl[1]
//               //     ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:testproject/NavBar.dart';
// import 'package:testproject/screen/Post.dart';
// import 'package:testproject/screen/login_signup.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({Key? key}) : super(key: key);

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//    //   drawer: NavBar(),
//         drawer: new  Drawer(
//       child: ListView(
//         // Remove padding
//         padding: EdgeInsets.zero,
//         children: [
//           UserAccountsDrawerHeader(
//             accountName: Text('HaiderAli'),
//             accountEmail: Text('haiderali_zaidi@outlook.com'),
//             currentAccountPicture: CircleAvatar(
//               child: ClipOval(
//                 // child: Image.network(
//                 //   'https://www.nicepng.com/maxp/u2q8o0a9u2e6/e6y3',
//                 //   fit: BoxFit.cover,
//                 //   width: 90,
//                 //   height: 90,
//                 // ),
//               ),
//             ),
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               image: DecorationImage(
//                   fit: BoxFit.fill,
//                   image: NetworkImage(
//                       'https://rare-gallery.com/352962-4k-wallpaper.html')),
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.favorite),
//             title: Text('Favorites'),
//             onTap: () => null,
//           ),
//           ListTile(
//             leading: Icon(Icons.person),
//             title: Text('Friends'),
//             onTap: () => null,
//           ),
//           ListTile(
//             leading: Icon(Icons.share),
//             title: Text('Share'),
//             onTap: () => null,
//           ),
//           ListTile(
//             leading: Icon(Icons.notifications),
//             title: Text('Request'),
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.settings),
//             title: Text('Settings'),
//             onTap: () => null,
//           ),
//           ListTile(
//             leading: Icon(Icons.description),
//             title: Text('Policies'),
//             onTap: () => null,
//           ),
//           Divider(),
//           ListTile(
//             title: Text('Exit'),
//             leading: Icon(Icons.exit_to_app),
//               onTap: () {
//               Navigator.pop(context);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return LoginSignupScreen();
//                     },
//                   ),
//                 );
//    },
//            // onTap: () => null,
//           ),
//         ],
//       ),
//     ),

//          appBar: AppBar(
//         title: Text("Dashboard"),
//       //    currentPage == 0 ? "SSUET Sports" : currentPage == 1 ? "Feeds" : currentPage == 2 ? "Departments" : "Profile"),
//         backgroundColor: Color(0xff67388c),),
//       //  actions: [
//           // IconButton(
//           //   icon: isEmailVerified ? Icon(Icons.mark_email_read) : Icon(Icons.warning),
//           //   onPressed: (){
//           //     showDialog(
//           //       context: context,
//           //       builder: (BuildContext context) {
//           //         return AlertDialog(
//           //           title: new Text(isEmailVerified ? "Email is verified!": "Email is not verified!"),
//           //           content: new Text("Please verify your email within ${24-hoursSpend.ceil()} hours!"),
//           //           actions: <Widget>[
//           //             new ElevatedButton(
//           //               child: new Text("Close"),
//           //               onPressed: () {
//           //                 Navigator.of(context).pop();
//           //               },
//           //             ),
//           //           ],
//           //         );
//           //       },
//           //     );
//           //   },
//           // ),
//           // IconButton(
//           //   icon: Badge(
//           //     badgeContent: Text(totalNoti.toString(), style: TextStyle(color: Colors.white),),
//           //     showBadge: true,
//           //     child:  Icon(Icons.notifications),
//           //   ),
//           //   onPressed: (){
//           //     Navigator.push(
//           //       context,
//           //       MaterialPageRoute(
//           //         builder: (context) {
//           //           return NotificationPage();
//           //         },
//           //       ),
//           //     );
//           //   },
//           // ),
//       //  ],
//      // ),
//         body: Column(
//           children: [
//       Container(
//        padding: const EdgeInsets.all(20.0),
//       child: Center(
//         child: Expanded(
//           flex: 2,
//           child: Center(
//            child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
                
//                 const SizedBox(
//                   width: 24,
//                   height: 24,
//                 ),
//                 const Text(
//                   "Hey Haider",
//                   textScaleFactor: 3,
//                 ),
//                 const SizedBox(
//                   width: 12,
//                   height: 12,
//                 ),
//             //  Container(
//             //   width: 250.0,
//             //   child: TextField(
//             //   //  controller: captionController,
//             //     decoration: InputDecoration(
//             //       hintText: "What's in your mind",
//             //       border: InputBorder.none,
//             //     ),
//             //   ),
//             // ),
//             GestureDetector(
//             onTap: () {
//                Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) =>  Post()),
//   );
//             },
//             child:                             Container(
//                                 padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
//                                 child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       // Container(
//                                       //   child: Row(
//                                       //     crossAxisAlignment:
//                                       //         CrossAxisAlignment.start,
//                                       //     children: [
//                                             // CircleAvatar(
//                                             //   radius: 20,
//                                             //   backgroundImage: AssetImage(
//                                             //       "assets/hassen.jpg"),
//                                             // ),
//                                             // SizedBox(
//                                             //   width: 7,
//                                             // ),
//                                             // Column(
//                                             //   crossAxisAlignment:
//                                             //       CrossAxisAlignment.start,
//                                             //   children: [
//                                                  Container(
//                                             //                   height: 50,
//               // width: 600,
//               // alignment: Alignment.centerLeft,
//               // padding: EdgeInsets.only(left: 12),
//                                                  decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(34),
//                 border: Border.all(
//                   color: Colors.grey,
//                   width: 1.5,
//                 ),
//               ),
//               child: Text(
//                 "What's on your mind ?",
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//               ),),
//                                                 // Text(
//                                                 //   "Hassen Chouaddah",
//                                                 //   style: TextStyle(
//                                                 //       fontWeight:
//                                                 //           FontWeight.w500,
//                                                 //       fontSize: 16),
//                                                 // ),
//                                                 // Text(
//                                                 //   "24m",
//                                                 //   style: TextStyle(
//                                                 //       color:
//                                                 //           Colors.grey.shade500),
//                                                 // )
//                                             //   ],
//                                             // )
//                                     //       ],
//                                     //     ),
//                                     //   ),
//                                     //   // IconButton(
//                                     //   //     icon: Icon(Icons.more_vert_rounded),
//                                     //   //     onPressed: () => print("more")),
//                                      ]
//                                     )),
//             // child: Container(
//             //   height: 50,
//             //   width: 600,
//             //   alignment: Alignment.centerLeft,
//             //   padding: EdgeInsets.only(left: 12),
//             //   decoration: BoxDecoration(
//             //     color: Colors.white,
//             //     borderRadius: BorderRadius.circular(34),
//             //     border: Border.all(
//             //       color: Colors.grey,
//             //       width: 1.5,
//             //     ),
//             //   ),
//             //   child: Text(
//             //     "What's on your mind ?",
//             //     style: TextStyle(
//             //       color: Colors.black,
//             //     ),
//             //   ),
//             // ),
//           ),
//              ],
//            ),
//          ),
//        ),
//      ),
//         ),
//             Divider(),
//                                 SingleChildScrollView(  
// child: Container(
//               child: Card(
//                 child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   const ListTile(
//                     leading: Icon(Icons.person),
//                     title: Text('Fazal Qareem, Nazimabad, karachi.'),
//                     subtitle: Text('I`m a Physics teacher with 5 years of experience holding masters` degree in physics, currently teaching in ssuet.I can help you clear your concepts related to the subject physics.I`ll be teaching from 7:00 to 9:00 pm (5 days a week from monday to friday),Fees: 5,000 PKR, Feel free to shoot me a message, looking forward to hear from you.'),
//                   ),
//                             Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   makeLike(),
//                   Transform.translate(
//                     offset: Offset(-5, 0),
//                 //    child: makeLove()
//                   ),
//                   SizedBox(width: 5,),
//                   Text("2.5K", style: TextStyle(fontSize: 15, color: Colors.grey[800]),)
//                 ],
//               ),
//               Text("400 Comments", style: TextStyle(fontSize: 13, color: Colors.grey[800]),)
//             ],
//           ),
//           SizedBox(height: 20,),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               makeLikeButton(isActive: true),
//            //   makeCommentButton(),
//              // makeShareButton(),
//             ],
//           ),
//                 //    Row(
//                 //   children: [
//                 //     OutlinedButton(
//                 //       child: const Text("Like"),
//                 //       onPressed: () => {print("hello")},
//                 //     ),
//                 //     Expanded(
//                 //       flex: 1,
//                 //       child: Container(),
//                 //     ),
//                 //     OutlinedButton(
//                 //       child: const Text("Comment"),
//                 //       onPressed: () => {print("hello")},
//                 //     ),
//                 //     Expanded(
//                 //       flex: 1,
//                 //       child: Container(),
//                 //     ),
//                 //     OutlinedButton(
//                 //       child: const Text("Message"),
//                 //       onPressed: () => {print("hello")},
//                 //     ),
//                 //   ],
//                 // ),
//                 ],
//                 ),
// ), 
//   ),
//       ),
//       Divider(),
//              Row(
//               children: [
//                 Expanded(
//                   child: Card(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: <Widget>[
//                   const ListTile(
//                     leading: Icon(Icons.person),
//                     title: Text('Mathematics'),
//                     subtitle: Text('A math teacher instructs students in the broad field of mathematics. This can include general math and/or any of the fields within mathematics such as algebra, geometry, statistics, and calculus. Math teachers are considered STEM (science, technology, engineering, and mathematics) teachers.'),
//                   ),
//                    Row(
//                   children: [
//                     OutlinedButton(
//                       child: const Text("Like"),
//                       onPressed: () => {print("hello")},
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Container(),
//                     ),
//                     OutlinedButton(
//                       child: const Text("Comment"),
//                       onPressed: () => {print("hello")},
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: Container(),
//                     ),
//                     OutlinedButton(
//                       child: const Text("Message"),
//                       onPressed: () => {print("hello")},
//                     ),
//                   ],
//                 ),
//                 ],
//                 ),
                
//   ),
//                 ),
//               ],
//             )
//             //  ],
//         //    ),
//       //    ),
//        // ),
//     //  ),
//       ],
//     ),
//           bottomNavigationBar: FancyBottomNavigation(
//         inactiveIconColor: Colors.grey,
//         activeIconColor: Color(0xFF67388c),
//         circleColor: Colors.white,
//         textColor: Color(0xFF67388c),
//         tabs: [
//           TabData(iconData: Icons.home,title: "Home",),
//           TabData(iconData: Icons.whatshot,title: "Games",),
//           TabData(iconData: Icons.spa, title: "Departments"),
//         ],
//         initialSelection: 0,
//      //   key: bottomNavigationKey,
//         onTabChangedListener: (position) {
//           // setState(() {
//           //   currentPage = position;
//           // });
//         },
//       ),
//     );
//   }
//   }
//   Widget makeLike() {
//     return Container(
//       width: 25,
//       height: 25,
//       decoration: BoxDecoration(
//         color: Colors.blue,
//         shape: BoxShape.circle,
//         border: Border.all(color: Colors.white)
//       ),
//       child: Center(
//         child: Icon(Icons.thumb_up, size: 12, color: Colors.white),
//       ),
//     );
//   }
//     Widget makeLikeButton({isActive}) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.grey,),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Icon(Icons.thumb_up, color: isActive ? Colors.blue : Colors.grey, size: 18,),
//             SizedBox(width: 5,),
//             Text("Like", style: TextStyle(color: isActive ? Colors.blue : Colors.grey),)
//           ],
//         ),
//       ),
//     );
//   }
// // class Dashboard extends StatelessWidget {
// //   const Dashboard({Key? key}) : super(key: key);

// //   @override

// // }



// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/src/foundation/key.dart';
// // import 'package:flutter/src/widgets/framework.dart';
// // import 'package:testproject/screen/Post.dart';

// // class Dashboard extends StatelessWidget {
// //   const Dashboard({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         body: Padding(
// //       padding: const EdgeInsets.all(8.0),
// //       child: Center(
// //         child: Expanded(
// //           flex: 2,
// //           child: Center(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
                
// //                 const SizedBox(
// //                   width: 24,
// //                   height: 24,
// //                 ),
// //                 const Text(
// //                   "Hey Haider",
// //                   textScaleFactor: 3,
// //                 ),
// //                 const SizedBox(
// //                   width: 12,
// //                   height: 12,
// //                 ),
// //             //  Container(
// //             //   width: 250.0,
// //             //   child: TextField(
// //             //   //  controller: captionController,
// //             //     decoration: InputDecoration(
// //             //       hintText: "What's in your mind",
// //             //       border: InputBorder.none,
// //             //     ),
// //             //   ),
// //             // ),
// //             GestureDetector(
// //             onTap: () {
// //                Navigator.push(
// //     context,
// //     MaterialPageRoute(builder: (context) => Post()),
// //   );
// //             },
// //             child: Container(
// //               height: 50,
// //               width: 600,
// //               alignment: Alignment.centerLeft,
// //               padding: EdgeInsets.only(left: 12),
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(34),
// //                 border: Border.all(
// //                   color: Colors.grey,
// //                   width: 1.5,
// //                 ),
// //               ),
// //               child: Text(
// //                 "What's on your mind ?",
// //                 style: TextStyle(
// //                   color: Colors.black,
// //                 ),
// //               ),
// //             ),
// //           ),
// //             Divider(),
// //                                 Container(
// // child: Card(
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: <Widget>[
// //                   const ListTile(
// //                     leading: Icon(Icons.person),
// //                     title: Text('Fazal Qareem, Nazimabad, karachi.'),
// //                     subtitle: Text('I`m a Physics teacher with 5 years of experience holding masters` degree in physics, currently teaching in ssuet.I can help you clear your concepts related to the subject physics.I`ll be teaching from 7:00 to 9:00 pm (5 days a week from monday to friday),Fees: 5,000 PKR, Feel free to shoot me a message, looking forward to hear from you.'),
// //                   ),
// //                    Row(
// //                   children: [
// //                     OutlinedButton(
// //                       child: const Text("Like"),
// //                       onPressed: () => {print("hello")},
// //                     ),
// //                     Expanded(
// //                       flex: 1,
// //                       child: Container(),
// //                     ),
// //                     OutlinedButton(
// //                       child: const Text("Comment"),
// //                       onPressed: () => {print("hello")},
// //                     ),
// //                     Expanded(
// //                       flex: 1,
// //                       child: Container(),
// //                     ),
// //                     OutlinedButton(
// //                       child: const Text("Message"),
// //                       onPressed: () => {print("hello")},
// //                     ),
// //                   ],
// //                 ),
// //                 ],
// //                 ),
                
// //   ),
// //       ),
// //       Divider(),
// //              Row(
// //               children: [
// //                 Expanded(
// //                   child: Card(
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: <Widget>[
// //                   const ListTile(
// //                     leading: Icon(Icons.person),
// //                     title: Text('Mathematics'),
// //                     subtitle: Text('A math teacher instructs students in the broad field of mathematics. This can include general math and/or any of the fields within mathematics such as algebra, geometry, statistics, and calculus. Math teachers are considered STEM (science, technology, engineering, and mathematics) teachers.'),
// //                   ),
// //                    Row(
// //                   children: [
// //                     OutlinedButton(
// //                       child: const Text("Like"),
// //                       onPressed: () => {print("hello")},
// //                     ),
// //                     Expanded(
// //                       flex: 1,
// //                       child: Container(),
// //                     ),
// //                     OutlinedButton(
// //                       child: const Text("Comment"),
// //                       onPressed: () => {print("hello")},
// //                     ),
// //                     Expanded(
// //                       flex: 1,
// //                       child: Container(),
// //                     ),
// //                     OutlinedButton(
// //                       child: const Text("Message"),
// //                       onPressed: () => {print("hello")},
// //                     ),
// //                   ],
// //                 ),
// //                 ],
// //                 ),
                
// //   ),
// //                 ),
// //               ],
// //             )
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     ));
// //   }
// // }
