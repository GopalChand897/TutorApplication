import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testproject/Models/UserModel.dart';
import 'package:testproject/Providers/UserProvider.dart';
import 'package:testproject/Services/FireStoreMethods.dart';
import 'package:testproject/Utils/show_snack_bar.dart';
import 'package:testproject/screen/Dashboard.dart';
class Post extends StatefulWidget {
  // const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  String name = '';
  // bool isLoading = false;

  final TextEditingController _descriptionController = TextEditingController();
 
void post(String uid,
String name) async {
// setState(() {
//   isLoading = true;
// });

try {
String res = await FireStoreMethods().uploadPost(
        _descriptionController.text,
        selectedValue!,
        //_file!,
        uid,
        name,
      //  profImage,
      );
            if (res == "success") {
        // setState(() {
        //   isLoading = false;
        // });
        showSnackBar(
          context,
          'Posted!',
        );
       // clearImage();
Navigator.pop(context);
    //                 Navigator.push(
    // context,
    //     MaterialPageRoute(
    //       builder: (context) => const Dashboard(),
    //     ),
    //   );
      } else {
//         setState(() {
//   isLoading = false;
// });
        showSnackBar(context, res);
      }
} catch(e){
      showSnackBar(
        context,
        e.toString(),
      );
}
}
 
   @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }


  var userData = {};
   bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }
    getData() async {
    setState(() {
      isLoading = true;
    });
    try {
      var snap = await FirebaseFirestore.instance
          .collection('users')
        //  .doc(widget.uid)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      // get post lENGTH
      // var postSnap = await FirebaseFirestore.instance
      //     .collection('posts')
      //     .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
      //     .get();

      // postLen = postSnap.docs.length;
      userData = snap.data()!;
      // followers = snap.data()!['followers'].length;
      // following = userSnap.data()!['following'].length;
      // isFollowing = userSnap
      //     .data()!['followers']
      //     .contains(FirebaseAuth.instance.currentUser!.uid);
      setState(() {});
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
    }
    setState(() {
      isLoading = false;
    });
  }


  String? selectedValue = null;
  final _dropdownFormKey = GlobalKey<FormState>();

final GlobalKey<FormState> _form = GlobalKey<FormState>();

List<DropdownMenuItem<String>> get dropdownItems{
  List<DropdownMenuItem<String>> menuItems = [
    // DropdownMenuItem(child: Text("USA"),value: "USA"),
    // DropdownMenuItem(child: Text("Canada"),value: "Canada"),
    // DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
    // DropdownMenuItem(child: Text("England"),value: "England"),
DropdownMenuItem(child: Text("Aisha manzil"),value: "Aisha manzil"),
DropdownMenuItem(child: Text("Ancholi"),value: "Ancholi"),
DropdownMenuItem(child: Text("Buffer zone"),value: "Buffer zone"), 
DropdownMenuItem(child: Text("Defence"),value: "Defence"),
DropdownMenuItem(child: Text("Clifton"),value: "Clifton"),  
DropdownMenuItem(child: Text("Gulistan-e-jauhar"),value: "Gulistan-e-jauhar"),
DropdownMenuItem(child: Text("Gulshan-e-iqbal"),value: "Gulshan-e-iqbal"),
DropdownMenuItem(child: Text("Lalukhaith"),value: "Lalukhaith"),
DropdownMenuItem(child: Text("Landi"),value: "Landi"),
DropdownMenuItem(child: Text("Malir"),value: "Malir"), 
DropdownMenuItem(child: Text("Model colony"),value: "Model colony"),
DropdownMenuItem(child: Text("Malir cantt"),value: "Malir cantt"),
DropdownMenuItem(child: Text("Karimbaad"),value: "Karimbaad"), 
DropdownMenuItem(child: Text("Nazimabad"),value: "Nazimabad"), 
DropdownMenuItem(child: Text("Neepa"),value: "Neepa"),
DropdownMenuItem(child: Text("North Karachi"),value: "North Karachi"), 
DropdownMenuItem(child: Text("Quaidabad"),value: "Quaidabad"), 
DropdownMenuItem(child: Text("Sadarr"),value: "Sadarr"),
DropdownMenuItem(child: Text("Shah re Faisal town"),value: "Shah re Faisal town"),
DropdownMenuItem(child: Text("Surabhgoth"),value: "Surabhgoth"),
DropdownMenuItem(child: Text("Water pump"),value: "Water pump"),
  ];
  return menuItems;
}

  @override
  Widget build(BuildContext context) {
      // final User user = Provider.of<UserProvider>(context).getUser;
//  final UserProvider userProvider = Provider.of<UserProvider>(context);
return Scaffold(
            appBar: AppBar(
           //   backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
           //     onPressed: clearImage,
                                 onPressed: () {
    Navigator.pop(context);
    //                                 Navigator.push(
    // context,
    // MaterialPageRoute(builder: (context) =>  Dashboard()));
                    },
              ),
              title: const Text(
                'Create Post',
              ),
              centerTitle: false,
              actions: <Widget>[
                TextButton(
                  //   userProvider.getUser.uid,
                  //   userProvider.getUser.username,
                  //   userProvider.getUser.photoUrl,
                  // ),
onPressed: () {
  if(_form.currentState!.validate() && _dropdownFormKey.currentState!.validate() ) {
  post(
    // userProvider.getUser.uid, userProvider.getUser.name
// user.uid, user.name,
  userData['uid']?? '',
  userData['name']?? '',
  //  userData['email ']?? '',
    );
    return;
    }
},
    //                                   onPressed: () {
    //                                 Navigator.push(
    // context,
    // MaterialPageRoute(builder: (context) =>  Post()));
    //                 },
      // child: Form(
                  child: const Text(
                    "Post",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
             //   )
                ),

              ],
            ),
            // POST FORM
            body: 
            Column(
children: [ 
  // isLoading? LinearProgressIndicator(): 
  // Padding(
  //   padding: EdgeInsets.only(top:0),
  // ),
  // Divider(),
  Container(
    margin: EdgeInsets.only(bottom: 20.0),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.white,
      // color: Color(0xFF262626),
    ),
    child: Padding(
      padding: EdgeInsets.all(15.0),
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
                      // userProvider.getUser.name,
                  // user.name,
                    // userData['name']?? '',
                    userData['name']?? '',
                      //"name",
                   //   userName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                //     Row(
                //       children:[
                //         Icon(Icons.location_pin),
                //     Text("Karachi,Pakistan",
                //  //     date,
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 16.0,
                //         fontWeight: FontWeight.w400,
                //       ),
                //     ), ]),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
        Form(
          key: _form,
          child: 
          TextFormField(
             maxLength: 300,
      //            inputFormatters: [
      //   LengthLimitingTextInputFormatter(100),
      // ],
              controller: _descriptionController,
       decoration: InputDecoration(  
    border: InputBorder.none,  
    hintText: "What's on your mind?"  
  ),
                      validator: (validator) {
                  if (validator!.isEmpty) return 'Please write something';
                  return null;
                } 
  ),
),

  SizedBox(height: 10.0,),
  SizedBox(height: 7),
  Form(
        key: _dropdownFormKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
padding: EdgeInsets.symmetric(horizontal: 16),
        //            height: 60,
        // margin: EdgeInsets.symmetric(
        //   vertical: 20,
        // ),
        // decoration: BoxDecoration(
        //   // color: Color(0xffd2d1e1).withOpacity(.3),
        //   borderRadius: BorderRadius.circular(20),
        // ),
          // padding: const EdgeInsets.all(0.0),
         child: DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                        hint: Text(
              "Please choose an Area",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  //fontWeight: FontWeight.w600
                  ),
            ),
                validator: (value) => value == null ? "Area must be selected" : null,
                dropdownColor: Colors.white,
                value: selectedValue,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValue = newValue!;
                  });
                //  print(selectedValue);
                },
                items: dropdownItems
                ),
                ),
            // ElevatedButton(
            //     onPressed: () {
            //       if (_form.currentState!.validate() && _dropdownFormKey.currentState!.validate()) {
            //         //valid flow
            //       }
            //     },
            //     child: Text("POST")
            //     )
          ],
        )),

          // if (contentText != "")
          //   Text(
          //     contentText,
          //     style: TextStyle(
          //       color: Colors.black,
          //        fontSize: 16.0
          //        ),
          //   ),
          // SizedBox(
          //   height: 50.0,
          // ),
        ],
      ),
    ),
  ),
//             Column(
//                       mainAxisAlignment: MainAxisAlignment.start, 
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//                SizedBox(
//             height: 10.0,
//           ),
          
//           Row(
// children: [
//   CircleAvatar(
//        radius: 25.0,
//               ),
//               SizedBox(
//                 width: 10.0,
//               ),
//               Expanded(
//                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                                  Text("name",
//                    //   userName,
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 18.0,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ],
//               ))
// ],

//           ),
//           Container(
//             child: TextField(
//               controller: _descriptionController,
//        decoration: InputDecoration(  
//     border: InputBorder.none,  
//     hintText: "What's on your mind?"  
//   ),  
//                     //  decoration: InputDecoration(
//                     //               contentPadding: EdgeInsets.only(left: 25.0),
//                     //               hintText: "What's on your mind?",
//                     //               filled: true,
//                     //           //    fillColor: mainGrey,
//                     //               border: OutlineInputBorder(
//                     //                 borderRadius: BorderRadius.circular(30.0),
//                     //                 borderSide: BorderSide.none,
//                     //               )
//                     //               ),
//             ),
//           )
//         ],
//               // children: <Widget>[
//               //   isLoading
//               //       ? const LinearProgressIndicator()
//               //       : const Padding(padding: EdgeInsets.only(top: 0.0)),
//               //   const Divider(),
//               //   Row(
//               //     mainAxisAlignment: MainAxisAlignment.spaceAround,
//               //     crossAxisAlignment: CrossAxisAlignment.start,
//               //     children: <Widget>[
//               //       CircleAvatar(
//               //         backgroundImage: NetworkImage(
//               //           userProvider.getUser.photoUrl,
//               //         ),
//               //       ),
//               //       SizedBox(
//               //         width: MediaQuery.of(context).size.width * 0.3,
//               //         child: TextField(
//               //           controller: _descriptionController,
//               //           decoration: const InputDecoration(
//               //               hintText: "Write a caption...",
//               //               border: InputBorder.none),
//               //           maxLines: 8,
//               //         ),
//               //       ),
//               //       SizedBox(
//               //         height: 45.0,
//               //         width: 45.0,
//               //         child: AspectRatio(
//               //           aspectRatio: 487 / 451,
//               //           child: Container(
//               //             decoration: BoxDecoration(
//               //                 image: DecorationImage(
//               //               fit: BoxFit.fill,
//               //               alignment: FractionalOffset.topCenter,
//               //               image: MemoryImage(_file!),
//               //             )),
//               //           ),
//               //         ),
//               //       ),
//               //     ],
//               //   ),
//               //   const Divider(),
//               // ],
//             ),
          ]
          )
          );
    // return Scaffold(
    //           appBar: AppBar(
    //       title: const Text('Create Post'),
    //     ),
    //     body: Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Center(
    //     child: Expanded(
    //       flex: 2,
    //       child: Center(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
                
    //             const SizedBox(
    //               width: 24,
    //               height: 24,
    //             ),
    //             const Text(
    //               "Hey Haider",
    //               textScaleFactor: 3,
    //             ),
    //             const SizedBox(
    //               width: 12,
    //               height: 12,
    //             ),
    //          Container(
    //           width: 250.0,
    //           child: TextField(
    //           //  controller: captionController,
    //             decoration: InputDecoration(
    //               hintText: "What's in your mind",
    //               border: InputBorder.none,
    //             ),
    //           ),
    //         ),
    //                         Container(
    //               child: Row(children: [
    //                 Expanded(
    //                   flex: 1,
    //                   child: Container(),
    //                 ),
    //                 OutlinedButton(
    //                   child: const Text("Post"),
    //                   onPressed: () => {print("hello")},
    //                 ),
    //               ]),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // )
    // );
  }
}




////*****************************FANCY POST PAGE */
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:testproject/screen/Dashboard.dart';
// import 'dart:math';

// import 'package:testproject/screen/login_signup.dart';

// class Post extends StatefulWidget {
//   @override
//   _PostState createState() => _PostState();
// }

// class _PostState extends State<Post> {
//   late DateTime backButtonPressTime;
//   final ScrollController _scrollController = ScrollController();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Stack(
//           children: [
//             NestedScrollView(
//               physics: const BouncingScrollPhysics(),
//               controller: _scrollController,
//               headerSliverBuilder:
//                   (BuildContext context, bool innerBoxScrolled) {
//                 return <Widget>[
//                   SliverAppBar(
//                     expandedHeight: 60,
//                     backgroundColor: Colors.transparent,
//                     elevation: 0,
//                     // pinned: true,
//                     // floating: true,
//                     automaticallyImplyLeading: false,
//                     flexibleSpace: LayoutBuilder(
//                       builder:
//                           (BuildContext context, BoxConstraints constraints) {
//                         return FlexibleSpaceBar(
//                           // collapseMode: CollapseMode.parallax,
//                           background: GestureDetector(
//                             onTap: () async {},
//                             child: Column(
//                               children: [
//                                 Container(
//                                   padding: EdgeInsets.only(right: 15),
//                                   height: 60,
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     children: [
//                                       GestureDetector(
//                                         child: Container(
//                                           height: 40,
//                                           width: 40,
//                                           decoration: BoxDecoration(
//                                               color: Colors.grey.shade300,
//                                               borderRadius:
//                                                   BorderRadius.circular(21.0)),
//                                           child: Icon(
//                                             CupertinoIcons.search,
//                                             size: 24,
//                                           ),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       GestureDetector(
//                                         onTap: () => Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                    Dashboard()
//                                                     )),
//                                         child: Container(
//                                             height: 42,
//                                             width: 42,
//                                             decoration: BoxDecoration(
//                                                 color: Colors.grey.shade300,
//                                                 borderRadius:
//                                                     BorderRadius.circular(
//                                                         21.0)),
//                                             child: CircleAvatar(
//                                               backgroundImage: AssetImage(
//                                                   "assets/photo.png"),
//                                             )),
//                                       )
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                   SliverAppBar(
//                     automaticallyImplyLeading: false,
//                     pinned: true,
//                     backgroundColor: Colors.white,
//                     elevation: 0,
//                     stretch: true,
//                     toolbarHeight: 65,
//                     title: Align(
//                       alignment: Alignment.centerRight,
//                       child: AnimatedBuilder(
//                           animation: _scrollController,
//                           builder: (context, child) {
//                             return GestureDetector(
//                               child: AnimatedContainer(
//                                 width: (!_scrollController.hasClients ||
//                                         _scrollController
//                                                 // ignore: invalid_use_of_protected_member
//                                                 .positions
//                                                 .length >
//                                             1)
//                                     ? MediaQuery.of(context).size.width
//                                     : max(
//                                         MediaQuery.of(context).size.width -
//                                             _scrollController.offset
//                                                 .roundToDouble(),
//                                         MediaQuery.of(context).size.width - 80),
//                                 height: 45.0,
//                                 duration: const Duration(milliseconds: 100),
//                                 padding: EdgeInsets.all(10),
//                                 // margin: EdgeInsets.zero,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(18.0),
//                                   color: Colors.grey.shade300,
//                                   boxShadow: const [
//                                     BoxShadow(
//                                       color: Colors.black26,
//                                       blurRadius: 3.0,
//                                       offset: Offset(1, 1),
//                                       // shadow direction: bottom right
//                                     )
//                                   ],
//                                 ),
//                                 child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         "What's on your mind?",
//                                         // style: TextStyle(
//                                         //   fontSize: 16.0,
//                                         //   color: Theme.of(context)
//                                         //       .textTheme
//                                         //       .caption
//                                         //       .color,
//                                         //   fontWeight: FontWeight.normal,
//                                         // ),
//                                       ),
//                                     ]),
//                               ),
//                               onTap: () => print("click"),
//                             );
//                           }),
//                     ),
//                   ),
//                 ];
//               },
//               body: Container(
//                 //color: Color(0xf1f1f1),
//                 child: SingleChildScrollView(
//                   physics: NeverScrollableScrollPhysics(),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.only(
//                             left: 15, right: 15, top: 5, bottom: 10),
//                         color: Colors.white,
//                         child: Row(
//                           children: [
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Color(0xfff55181),
//                                   borderRadius: BorderRadius.circular(18),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Color(0xfff55181).withOpacity(.4),
//                                       blurRadius: 5.0,
//                                       offset: Offset(0, 10),
//                                       // shadow direction: bottom right
//                                     )
//                                   ]),
//                               width: 145,
//                               height: 38,
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(
//                                     CupertinoIcons.video_camera_solid,
//                                     color: Colors.white,
//                                   ),
//                                   SizedBox(
//                                     width: 3,
//                                   ),
//                                   Text(
//                                     "Live",
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               width: 8,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Color(0xff50cf9a),
//                                   borderRadius: BorderRadius.circular(18),
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Color(0xff50cf9a).withOpacity(.4),
//                                       blurRadius: 5.0,
//                                       offset: Offset(0, 10),
//                                       // shadow direction: bottom right
//                                     )
//                                   ]),
//                               width: 145,
//                               height: 38,
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(
//                                     Icons.photo_rounded,
//                                     color: Colors.white,
//                                   ),
//                                   SizedBox(
//                                     width: 3,
//                                   ),
//                                   Text(
//                                     "Photo",
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               width: 8,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.grey.shade300,
//                                   borderRadius: BorderRadius.circular(20)),
//                               width: 56,
//                               height: 38,
//                               child: Icon(Icons.more_horiz),
//                             )
//                           ],
//                         ),
//                       ),
//                       Container(
//                         padding: EdgeInsets.only(top: 10, left: 15, bottom: 10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Stories",
//                               style: TextStyle(fontSize: 26),
//                             ),
//                             SingleChildScrollView(
//                               scrollDirection: Axis.horizontal,
//                               child: Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   // CreateStory(
//                                   //   imageAsset: "assets/photo.png",
//                                   // ),
//                                   SizedBox(
//                                     width: 4,
//                                   ),
//                                   // Story(
//                                   //   firstName: "Dhia",
//                                   //   lastName: "Ben Hamouda",
//                                   //   storyAsset: "assets/stories/storydhia.jpg",
//                                   //   userAsset: "assets/dhia.jpg",
//                                   // ),
//                                   SizedBox(
//                                     width: 4,
//                                   ),
//                                   // Story(
//                                   //   firstName: "Mehdi",
//                                   //   lastName: "Behira",
//                                   //   storyAsset: "assets/stories/storymehdi.jpg",
//                                   //   userAsset: "assets/mehdi.jpg",
//                                   // ),
//                                   SizedBox(
//                                     width: 4,
//                                   ),
//                                   // Story(
//                                   //   firstName: "Eya",
//                                   //   lastName: "Loukil",
//                                   //   storyAsset: "assets/stories/storyeya.jpg",
//                                   //   userAsset: "assets/eya.jpg",
//                                   // ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 6,
//                         child: Container(
//                           color: Color(0xfff1f1f1),
//                         ),
//                       ),
//                       Container(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             Container(
//                                 padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
//                                 child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Container(
//                                         child: Row(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             CircleAvatar(
//                                               backgroundImage: AssetImage(
//                                                   "assets/hassen.jpg"),
//                                             ),
//                                             SizedBox(
//                                               width: 7,
//                                             ),
//                                             Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Text(
//                                                   "Hassen Chouaddah",
//                                                   style: TextStyle(
//                                                       fontWeight:
//                                                           FontWeight.w500,
//                                                       fontSize: 16),
//                                                 ),
//                                                 Text(
//                                                   "24m",
//                                                   style: TextStyle(
//                                                       color:
//                                                           Colors.grey.shade500),
//                                                 )
//                                               ],
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                       IconButton(
//                                           icon: Icon(Icons.more_vert_rounded),
//                                           onPressed: () => print("more")),
//                                     ])),
//                             SizedBox(height: 5),
//                             Container(
//                                 padding: EdgeInsets.only(left: 15, right: 15),
//                                 child: Text("My colorful shots today 🐕",
//                                     style: TextStyle(fontSize: 14))),
//                             SizedBox(height: 5),
//                             // GridAlbum(
//                             //   firstPhoto: "assets/first.png",
//                             //   secondPhoto: "assets/green.jpg",
//                             //   thirdPhoto: "assets/third.jpg",
//                             // )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Builder(
//               builder: (context) => Padding(
//                 padding: const EdgeInsets.only(top: 10.0, left: 10.0),
//                 child: Image.asset(
//                   "assets/logo.png",
//                   height: 45,
//                   width: 45,
//                 ),
//               ),
//             ),
//         //    BottomNavbar()
//           ],
//         ),
//       ),
//     );
//   }
// }