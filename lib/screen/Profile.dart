import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:testproject/Helper/UIHelper.dart';
import 'package:testproject/Models/UserModel.dart'; 
import 'package:testproject/Utils/show_snack_bar.dart';
import 'package:testproject/screen/Dashboard.dart';
class Profile extends StatefulWidget {
  // final UserModel userModel;
  // final User firebaseUser;
  
  // const Profile({
  //   Key? key, 
  // required this.userModel, required this.firebaseUser
  // }) : super(key: key);
    final UserModel userModel;
  final User firebaseUser;

    const Profile({Key? key, 
  required this.userModel,
   required this.firebaseUser
   }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {


// TextEditingController nameController = TextEditingController();
// TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
TextEditingController bioController = TextEditingController();

   late User user;
  bool _nameValid = true;
  bool _usernameValid = true;
  bool _bioValid = true;

  Uint8List? _image;
  // String name = '';
// File? _pickedImage;
Widget buildButton({
required String title,
required IconData icon,
required VoidCallback onClicked,
}) 
=> ElevatedButton(style: ElevatedButton.styleFrom(
  minimumSize: const Size.fromHeight(56),
  primary: Colors.white,
  onPrimary: Colors.black,
  textStyle: const TextStyle(fontSize: 20),
),
child: Row(children: [
Icon(icon,size: 28),
const SizedBox(width: 16),
Text(title),
],),
onPressed: onClicked,
);
void _pickedImage() {
   showDialog<ImageSource>(
      context: this.context,
      builder: (context) => AlertDialog(
         content: Text("Choose image source"),
         actions: [
 buildButton(
  title: 'Pick From Gallery', 
  icon: Icons.image_outlined, 
  
  onClicked: pickImage,
 ),
 const SizedBox(height: 24),
 buildButton(
  title: 'Pick From Camera', 
  icon: Icons.camera_alt_outlined, 
  onClicked: pickImageC,
 ),
            // ElevatedButton(
            //    child: Text("Camera"), 
            //    onPressed: () => Navigator.pop(context,
            //     pickImage()
            //    //ImageSource.camera
            //    ),
            // ),
            // ElevatedButton(
            //    child: Text("Gallery"), 
            //    onPressed: () => Navigator.pop(context, pickImageC()
            //    //ImageSource.gallery
            //    ),
            // ),
         ]
      ),
   );
  //  .then((ImageSource source) async {
  //     if (source != null) {
  //        final pickedFile = await ImagePicker().getImage(source: source);
  //        setState(() => _pickedImage = File(pickedFile.path));
  //     }
  // });
}
File? image;

Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image == null) return; 

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if(image == null) return;

      final imageTemp = File(image.path);
//  var newFile = await imageTemp.writeAsBytes();
//  await newFile.create();
      setState(() => this.image = imageTemp
      
      );
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }




  //  var userData = {};
  // bool isLoading = false;

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }
  //   getData() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   try {
  //     var snap = await FirebaseFirestore.instance
  //         .collection('users')
  //       //  .doc(widget.uid)
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .get();

  //     // get post lENGTH
  //     // var postSnap = await FirebaseFirestore.instance
  //     //     .collection('posts')
  //     //     .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
  //     //     .get();

  //     // postLen = postSnap.docs.length;
  //     userData = snap.data()!;
  //     // followers = snap.data()!['followers'].length;
  //     // following = userSnap.data()!['following'].length;
  //     // isFollowing = userSnap
  //     //     .data()!['followers']
  //     //     .contains(FirebaseAuth.instance.currentUser!.uid);
  //     setState(() {});
  //   } catch (e) {
  //     showSnackBar(
  //       context,
  //       e.toString(),
  //     );
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }

// String name = '';
// String username = '';

//       final inputName = TextEditingController();
//     final inputBio = TextEditingController();

  updateProfile(BuildContext context) async {
    Map<String, dynamic> map = Map();
    if (image != null) {
      String url = await uploadImage();
      map['profileImage'] = url;
    }
    // map['name'] = _textEditingController.text;

    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update(map);
    Navigator.pop(context);
  }

  Future<String> uploadImage() async {
    TaskSnapshot taskSnapshot =  await FirebaseStorage.instance
        .ref()
        .child("profile")
        .child(
            //  "${FirebaseAuth.instance.currentUser?.uid}_${basename(image!.path)}"
             FirebaseAuth.instance.currentUser!.uid + "_" + basename(image!.path)
            )
        .putFile(image!);

//  taskSnapshot.ref.getDownloadURL().then((value) => {print(value)});
     return taskSnapshot.ref.getDownloadURL();
  }

  void checkValues(BuildContext context) {
    // setState(() {
    //         nameController.text.trim().length < 3 ||
    //           nameController.text.isEmpty
    //       ? nameController = false as TextEditingController
    //       : nameController = true as TextEditingController;
          
    //                   usernameController.text.trim().length < 3 ||
    //           usernameController.text.isEmpty
    //       ? usernameController = false as TextEditingController
    //       : usernameController = true as TextEditingController;
    //   bioController.text.trim().length > 100
    //       ? _bioValid = false
    //       : _bioValid = true;
    // });
    //     if (_nameValid && _usernameValid && _bioValid) {
    //   FirebaseFirestore.instance.doc(FirebaseAuth.instance.currentUser!.uid).get({
    //     "name": nameController.text,
    //     "bio": bioController.text,
    //   });
    //   SnackBar snackbar = SnackBar(content: Text("Profile updated!"));
    //   _scaffoldKey.currentState.showSnackBar(snackbar);
    // }
    
    String bio = bioController.text.trim();

    if(bio == "" || image == null) {
      print("Please fill all the fields");
      UIHelper.showAlertDialog(context, "Incomplete Data", "Please fill all the fields and upload a profile picture");
    }
    else {
      print("Uploading data..");
      uploadData(context);
    }
  }
   void uploadData(BuildContext context) async {

    // UIHelper.showLoadingDialog(context, "Uploading image..");

    UploadTask uploadTask = FirebaseStorage.instance.ref("profilepictures").child(widget.userModel.uid.toString()).putFile(image!);

    TaskSnapshot snapshot = await uploadTask;

    String? imageUrl = await snapshot.ref.getDownloadURL();
    String? bio = bioController.text.trim();

    widget.userModel.bio = bio;
    widget.userModel.photoUrl = imageUrl;

    await FirebaseFirestore.instance.collection("users").doc(widget.userModel.uid).set(widget.userModel.toMap()).then((value) {
      print("Data uploaded!");
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return Dashboard(userModel: widget.userModel, firebaseUser: widget.firebaseUser);
        }),
      );
    });
  }

// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     FirebaseAuth.instance.currentUser?.uid;
//   //  FirebaseAuth.instance.currentUser!.then((user){
// setState(() {
//   // image;
//    Image.file(image!).image;
// });

//    // });
//   }



  var userData = {};
   bool isLoading = false;

  @override
  void initState() {
    super.initState();
    getData(this.context);
  }
    getData(BuildContext context) async {
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

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Profile"),
      // ),
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
                'Edit Profile',
              ),
              centerTitle: false,
              actions: <Widget>[
IconButton(
                icon: const Icon(Icons.done),
           //     onPressed: clearImage,
                                 onPressed: () {
  // updateProfile(context);
                  checkValues(context);
    //                                 Navigator.push(
    // context,
    // MaterialPageRoute(builder: (context) =>  Dashboard()));
                    },
              ),
              ],
            ),
body: 
SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Flexible(
              //   child: Container(),
              //   flex: 2,
              // ),
              const SizedBox(
                height: 30,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: image != null ? 
                  Image.file(image!).image
                   :
                  // Image.asset('assets/random.png').image,radius:70),
                  Image.network('https://firebasestorage.googleapis.com/v0/b/hometutorapp-e9529.appspot.com/o/constant%2Frandom.png?alt=media&token=2e2b598d-b5c7-4604-a658-889e877faa91').image,radius:70),
                  
    //               image != null
    //                   ? CircleAvatar(
    //                       radius: 64,
    //                       backgroundImage: NetworkImage(
    //                           'https://i.stack.imgur.com/l60Hf.png'),
    //                    //   backgroundImage: FileImage(image),
    //                   // backgroundImage: MemoryImage(image),
    //                     //  backgroundImage: MemoryImage(_image!),
    //                   //    backgroundColor: Colors.red,
    //                     )
    // //                  image != null ? Image.file(
    // // image!,
    // // width: 160,
    // // height: 160,
    // // fit: BoxFit.cover,
    // // )
    //                   : const CircleAvatar(
    //                       radius: 64,
    //                       backgroundImage: NetworkImage(
    //                           'https://i.stack.imgur.com/l60Hf.png'),
    //                       backgroundColor: Colors.red,
    //                     ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                    //  onPressed: selectImage,
                      onPressed: () {
          //  _pickedImage();
                         // Navigator.pop(context);
                          _pickedImage();
                       //  pickImage();
                        // pickImageC();
                      },
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
          //                         Padding(
          //   padding: const EdgeInsets.all(8),
          //   child: Row(
          //     children: [
          //       const SizedBox(  
          //         width: 100,
          //         child: Text(
          //           'Username',
          //       //    style: AppTextStyle.textStyleBoldMedium,
          //         ),
          //       ),
          //       // Text(
          //       //   '${context.appState.user.id} ',
          //       //   style: AppTextStyle.textStyleBoldMedium,
          //       // ),
          //     ],
          //   ),
          // ),

                    Text("Name:  "+
                    userData['name']?? '',
                      style: TextStyle(
                        // color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
              Text("Username:  "+
                    userData['username']?? '',
                      style: TextStyle(
                        // color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

//           Padding(
//             padding: EdgeInsets.all(8),
//        //   child:  Text(userData['name']?? ''),
//           child: 
//           TextField(
// decoration: InputDecoration(
//   labelText: 'Name'
//   //Text(userData['name']?? ''),
//   ),
//   // lkeyboardType: userData['name']?? '',
//           ),
//           ),
         // userData['name']?? '',


//                     Padding(
//             padding: EdgeInsets.all(8),
//           child: TextField(
// decoration: InputDecoration(labelText: 'Username'),
//           ),
//           ),
                              // Padding(
            // padding: EdgeInsets.all(8),
          // child:
  
                      // Padding(
                      //   padding: EdgeInsets.all(16.0),
                      //   child: Column(
                      //     children: <Widget>[
                      //       buildDisplayNameField(),
                      //       buildBioField(),
                      //     ],
                      //   ),
                      // ),

                      
//            TextField(
//             controller: bioController,
// decoration: InputDecoration(helperText: 'name', labelText: 'name'),
//           ),
//                      TextField(
//             controller: bioController,
// decoration: InputDecoration(helperText: 'username',labelText: 'username '),
// 
Column( 
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children:[            
Text("\nSomething About You...", 
// textAlign: TextAlign.start,
),]),         
           TextField(
            controller: bioController,
decoration: InputDecoration(labelText: 'Bio'),
          ),
          // ),
        //  const Divider(color: Colors.grey),
              // TextFieldInput(
              //   hintText: 'Enter your username',
              //   textInputType: TextInputType.text,
              //   textEditingController: _usernameController,
              // ),
              // const SizedBox(
              //   height: 24,
              // ),
              // TextFieldInput(
              //   hintText: 'Enter your email',
              //   textInputType: TextInputType.emailAddress,
              //   textEditingController: _emailController,
              // ),
              // const SizedBox(
              //   height: 24,
              // ),
              // TextFieldInput(
              //   hintText: 'Enter your password',
              //   textInputType: TextInputType.text,
              //   textEditingController: _passwordController,
              //   isPass: true,
              // ),
              // const SizedBox(
              //   height: 24,
              // ),
              // TextButton(
              //   hintText: 'Enter your bio',
              //   textInputType: TextInputType.text,
              //   textEditingController: _bioController,
              // ),
              // const SizedBox(
              //   height: 12,
              // ),
              // Flexible(
              //   child: Container(),
              //   flex: 2,
              // ),
            ],
          ),
        ),
      ),
// Stack(
//   children: [
//           //  CircleAvatar(
//           //             backgroundColor: Colors.grey,
//           //             radius: 40.0,
//           //           //  child: Image.asset('assets/Tutor.jpg'),
//           //          backgroundImage: NetworkImage("https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png"),
//           //             // child: CircleAvatar(
//           //             //   radius: 38.0,
//           //             //   child: ClipOval(
//           //             //   child: Image.asset('assets/Tutor.jpg'),
//           //             //   //  child: Image.file(_image),
//           //             //   ),
//           //             //   backgroundColor: Colors.white,
//           //             // ),
//           //           ),
//           //                          Positioned(
//           //           bottom: -10,
//           //           left: 80,
//           //           child: IconButton(
//           //             onPressed: (){

//           //             }, //selectImage,
//           //             icon: const Icon(Icons.add_a_photo),
//           //           ),
//           //         ),
//         //          CircleAvatar(
//         //   radius: 40,
//         //   backgroundColor: Colors.grey,
//         //   // backgroundImage:
//         //   //     _pickedImage != null ? FileImage(_pickedImage!) : null,
//         // ),
//         const Spacer(),
//  // const FlutterLogo(size: 160),
//    image != null ? Image.file(
//     image!,
//     width: 160,
//     height: 160,
//     fit: BoxFit.cover,
//     )
//    // : const FlutterLogo(size: 160),
//                           : const CircleAvatar(
//                           radius: 64,
//                           backgroundImage: NetworkImage(
//                               'https://i.stack.imgur.com/l60Hf.png'),
//                           backgroundColor: Colors.red,
//                         ),
//                                                     Positioned(
//               bottom: -10,
//              // right: -25,
//               left: 80,
//               child: IconButton(
//                 onPressed: () {},
//     icon: const Icon(Icons.add_a_photo),
//                 // elevation: 2.0,
//                 // fillColor: Color(0xFFF5F6F9),
//                 // child: Icon(Icons.camera_alt_outlined, color: Colors.blue,),
//                 padding: EdgeInsets.all(15.0),
//                 // shape: CircleBorder(),
//               )
//               ), 
              
//                   // Positioned(
//                   //   bottom: -10,
//                   //   left: 80,
//                   //   child: IconButton(
//                   //     onPressed: selectImage,
//                   //     icon: const Icon(Icons.add_a_photo),
//                   //   ),
//                   // )
//     //const Text("No image selected"),
//   // const Text('Image Picker',
//   // style: TextStyle(fontSize: 30,
//   // fontWeight: FontWeight.bold
//   // ),
//   // ),
//         TextButton.icon(
//        //   textColor: Theme.of(context).primaryColor,
//           onPressed: 
//           // (){},
//           _pickedImage,
//           icon: Icon(Icons.image),
//           label: Text('Add Image'),
//         ),
//               //               Positioned(
//               // bottom: 0,
//               // right: -25,
//               // child: RawMaterialButton(
//               //   onPressed: () {},
//               //   elevation: 2.0,
//               //   fillColor: Color(0xFFF5F6F9),
//               //   child: Icon(Icons.camera_alt_outlined, color: Colors.blue,),
//               //   padding: EdgeInsets.all(15.0),
//               //   shape: CircleBorder(),
//               // )
//               // ),
//                           //     CircleAvatar(
//                           //   backgroundColor: Colors.grey,
//                           //   backgroundImage: NetworkImage(
//                           //     userData['photoUrl'],
//                           //   ),
//                           //   radius: 40,
//                           // ),
                          
//           //     const _ChangeProfilePictureButton(),
//           // const Divider(
//           //   color: Colors.grey,
//           // ),
//           Padding(padding: const EdgeInsets.all(8),
//           child: Row(
//             children: [
//                           const SizedBox(
//                   width: 100,
//                   child: Text(
//                     'Name',
//                    // style: AppTextStyle.textStyleBoldMedium,
//                   ),
//                 ),
//                 //                 Text(
//                 //   '${streamagramUser.fullName} ',
//                 //   style: AppTextStyle.textStyleBoldMedium,
//                 // ),
//             ],
//           ),
//           ),
//                     Padding(
//             padding: const EdgeInsets.all(8),
//             child: Row(
//               children: [
//                 const SizedBox(  
//                   width: 100,
//                   child: Text(
//                     'Username',
//                 //    style: AppTextStyle.textStyleBoldMedium,
//                   ),
//                 ),
//                 // Text(
//                 //   '${context.appState.user.id} ',
//                 //   style: AppTextStyle.textStyleBoldMedium,
//                 // ),
//               ],
//             ),
//           ),
//           const Divider(color: Colors.grey),

// ],
// ),
    );
  }
}







// //--------------
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import "package:flutter/material.dart";
// import 'package:testproject/Models/UserModel.dart';
// import 'package:testproject/Utils/show_snack_bar.dart';
// import 'package:testproject/screen/Dashboard.dart';

// class EditProfile extends StatefulWidget {
//   // final String currentUserId;

//   EditProfile(
//     // {required this.currentUserId}
//     );

//   @override
//   _EditProfileState createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   TextEditingController displayNameController = TextEditingController();
//   TextEditingController bioController = TextEditingController();
//   bool isLoading = false;
//   late User user;
//   bool _displayNameValid = true;
//   bool _bioValid = true;

//   @override
//   void initState() {
//     super.initState();
//     getUser();
//   }

//   getUser() async {
//     setState(() {
//       isLoading = true;
//     });
//     DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc().get();
//     user = User.fromSnap(doc);
//     displayNameController.text = user.name;
//     bioController.text = user.bio;
//     setState(() {
//       isLoading = false;
//     });
//   }

//   Column buildDisplayNameField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//             padding: EdgeInsets.only(top: 12.0),
//             child: Text(
//               "Display Name",
//               style: TextStyle(color: Colors.grey),
//             )),
//         TextField(
//           controller: displayNameController,
//           decoration: InputDecoration(
//             hintText: "Update Display Name",
//             errorText: _displayNameValid ? null : "Display Name too short",
//           ),
//         )
//       ],
//     );
//   }

//   Column buildBioField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.only(top: 12.0),
//           child: Text(
//             "Bio",
//             style: TextStyle(color: Colors.grey),
//           ),
//         ),
//         TextField(
//           controller: bioController,
//           decoration: InputDecoration(
//             hintText: "Update Bio",
//             errorText: _bioValid ? null : "Bio too long",
//           ),
//         )
//       ],
//     );
//   }

//   updateProfileData() {
//     setState(() {
//       displayNameController.text.trim().length < 3 ||
//               displayNameController.text.isEmpty
//           ? _displayNameValid = false
//           : _displayNameValid = true;
//       bioController.text.trim().length > 100
//           ? _bioValid = false
//           : _bioValid = true;
//     });

//   //   if (_displayNameValid && _bioValid) {
//   //     FirebaseFirestore.instance.collection('users').doc(widget.currentUserId).updateData({
//   //       "name": displayNameController.text,
//   //       "bio": bioController.text,
//   //     });
//   // showSnackBar(context, "Profile updated!", //Colors.red
//   //     );
//   //     // SnackBar snackbar = SnackBar(content: Text("Profile updated!"));
//   //     // _scaffoldKey.currentState.showSnackBar(snackbar);
//   //   }
//   }

//   logout() 
//   // async  
//   {
//     // await googleSignIn.signOut();
//     Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text(
//           "Edit Profile",
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//         actions: <Widget>[
//           IconButton(
//             onPressed: () => Navigator.pop(context),
//             icon: Icon(
//               Icons.done,
//               size: 30.0,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//       body: 
//       // isLoading
//       //     ? CircularProgressIndicator()
//           // :
//            ListView(
//               children: <Widget>[
//                 Container(
//                   child: Column(
//                     children: <Widget>[
//                       Padding(
//                         padding: EdgeInsets.only(
//                           top: 16.0,
//                           bottom: 8.0,
//                         ),
//                         child: CircleAvatar(
//                           radius: 50.0,
//                           // backgroundImage:
//                           //     CachedNetworkImageProvider(user.photoUrl),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(16.0),
//                         child: Column(
//                           children: <Widget>[
//                             buildDisplayNameField(),
//                             buildBioField(),
//                           ],
//                         ),
//                       ),
//                       ElevatedButton(
//                         onPressed: updateProfileData,
//                         child: Text(
//                           "Update Profile",
//                           style: TextStyle(
//                             // color: Theme.of(context).primaryColor,
//                           color: Colors.white,
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.all(16.0),
//                         child: ElevatedButton.icon(
//                           onPressed: logout,
//                           icon: Icon(Icons.cancel, color: Colors.white),
//                           label: Text(
//                             "Logout",
//                             style: TextStyle(color: Colors.red, fontSize: 20.0),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//     );
//   }
// }
// //--------------

// //---------------------------------------------------------------------------------
// import 'dart:developer';
// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:testproject/Helper/UIHelper.dart';
// import 'package:testproject/Models/UserModel.dart';
// import 'package:testproject/screen/Dashboard.dart';

// class Profile extends StatefulWidget {
//   // final UserModel userModel;
//   // final User firebaseUser;

//   const Profile({Key? key, 
//   // required this.userModel, required this.firebaseUser
//   }) : super(key: key);

//   @override
//   _ProfileState createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {

// late File imageFile; //store img 
//   TextEditingController fullNameController = TextEditingController();

//   void selectImage(ImageSource source) async {
//     XFile? pickedFile = await ImagePicker().pickImage(source: source);

//     if(pickedFile != null) {
//       cropImage(pickedFile);
//     }
//   }

//   void cropImage(XFile file) async {
//     File? croppedImage = await ImageCropper.cropImage(
//       sourcePath: file.path,
//       aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
//       compressQuality: 20
//     );

//     if(croppedImage != null) {
//       setState(() {
//         imageFile = croppedImage;
//       });
//     }
//   }

//   void showPhotoOptions() {
//     showDialog(context: context, builder: (context) {
//       return AlertDialog(
//         title: Text("Upload Profile Picture"),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [

//             ListTile(
//               onTap: () {
//                 // Navigator.pop(context);
//                 selectImage(ImageSource.gallery);
//               },
//               leading: Icon(Icons.photo_album),
//               title: Text("Select from Gallery"),
//             ),

//             ListTile(
//               onTap: () {
//                 // Navigator.pop(context);
//                 selectImage(ImageSource.camera);
//               },
//               leading: Icon(Icons.camera_alt),
//               title: Text("Take a photo"),
//             ),

//           ],
//         ),
//       );
//     });
//   }

//   // void checkValues() {
//   //   String fullname = fullNameController.text.trim();

//   //   if(fullname == "" || imageFile == null) {
//   //     print("Please fill all the fields");
//   //     UIHelper.showAlertDialog(context, "Incomplete Data", "Please fill all the fields and upload a profile picture");
//   //   }
//   //   else {
//   //     log("Uploading data..");
//   //     // uploadData();
//   //   }
//   // }

//   // void uploadData() async {

//   //   UIHelper.showLoadingDialog(context, "Uploading image..");

//   //   UploadTask uploadTask = FirebaseStorage.instance.ref("profilepictures").child(widget.userModel.uid.toString()).putFile(imageFile!);

//   //   TaskSnapshot snapshot = await uploadTask;

//   //   String? imageUrl = await snapshot.ref.getDownloadURL();
//   //   String? name = fullNameController.text.trim();

//   //   // widget.userModel.fullname = fullname;
//   //   // widget.userModel.profilepic = imageUrl;
//   //   widget.userModel.name = name;
//   //   widget.userModel.photoUrl = imageUrl;
//   //   await FirebaseFirestore.instance.collection("users").doc(widget.userModel.uid).set(widget.userModel.toMap()).then((value) {
//   //     log("Data uploaded!");
//   //     Navigator.popUntil(context, (route) => route.isFirst);
//   //     Navigator.pushReplacement(
//   //       context,
//   //       MaterialPageRoute(builder: (context) {
//   //         return Dashboard(userModel: widget.userModel, firebaseUser: widget.firebaseUser);
//   //       }),
//   //     );
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         automaticallyImplyLeading: false,
//         title: Text("Complete Profile"),
//       ),
//       body: SafeArea(
//         child: Container(
//           padding: EdgeInsets.symmetric(
//             horizontal: 40
//           ),
//           child: ListView(
//             children: [

//               SizedBox(height: 20,),

//               CupertinoButton(
//                 onPressed: () {
//                   showPhotoOptions();
//                 },
//                 padding: EdgeInsets.all(0),
//                 child: CircleAvatar(
//                   radius: 60,
//                   // backgroundImage: (imageFile != null) ? FileImage(imageFile!) : null,
//                   // child: (imageFile == null) ? Icon(Icons.person, size: 60,) : null,
//                 ),
//               ),

//               SizedBox(height: 20,),

//               TextField(
//                 controller: fullNameController,
//                 decoration: InputDecoration(
//                   labelText: "Full Name",
//                 ),
//               ),

//               SizedBox(height: 20,),

//               CupertinoButton(
//                 onPressed: () {
//                   // checkValues();
//                 },
//                 color: Theme.of(context).colorScheme.secondary,
//                 child: Text("Submit"),
//               ),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }