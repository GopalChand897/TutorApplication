import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:testproject/Services/StorageMethod.dart';
import 'package:testproject/Utils/show_snack_bar.dart';
import 'package:testproject/Models/UserModel.dart' as model;
import 'package:testproject/screen/Dashboard.dart';

//FIREBASE AUTHENTICATION
// class FirebaseAuthMethods {
//   final FirebaseAuth _auth;
//   FirebaseAuthMethods(this._auth);

  // bool _loading = false;
  // String name="";
 // String name = name.nameController;
  // String email = "";
  // String password = "";
  //   final TextEditingController nameController = TextEditingController();
  //   final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

//    User get user => _auth.currentUser!;  //get data from authenticatiobn user
class AuthMethods {
  //++   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
 //  final FirebaseAuth _auth = FirebaseAuth.instance;
//  final FirebaseAuth _auth; 
// AuthMethods(this._auth);
  // get user details
  // Future<model.User> getUserDetails() async {
  //   User currentUser = _auth.currentUser!;

  //   DocumentSnapshot snap =
  //       await _firestore.collection('users').doc(currentUser.uid).get();

  //   return model.User.fromSnap(snap);
  // }

//+++ final FirebaseAuth _auth;
 // UserModel userModel = UserModel();
 // final userRef = FirebaseFirestore.instance.collection("users"); //**Firestore to FirebaseFirestore
  
  //+++ AuthMethods(this._auth);

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User get user => _auth.currentUser!;

  // STATE PERSISTENCE STREAM
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();

//+++ User get user => _auth.currentUser!; 

//      Stream<User?> get authState => FirebaseAuth.instance.authStateChanges(); //if user present or not will give user details
 //+++Stream<User?> get authStateChanges => _auth.authStateChanges();
  




  //     final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

//   // EMAIL SIGN UP
//   Future<void> signUpWithEmail({
//     required String email,
//     required String password,
//     required BuildContext context,
//   }) async {
//      try {  //*
//       await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//           // email: emailController.text,
//           // password: passwordController.text,
//       ).then((response) async{


//         try{
//         await sendEmailVerification(context);
//         //  await response.user?.sendEmailVerification();
//         }catch (e) {
//           print("An error occurred while trying to send email verification");
//           print(context);
//         } 

        
//       //; //*
//       // ).then((value) => {FirebaseFirestore.instance.collection('UserData').doc(value.user?.uid).set({"email":value.user?.email}),});
    
//     //  await sendEmailVerification(context); //*
//   //  }  //*
    

//         //     SharedPreferences prefs = await SharedPreferences.getInstance();
//         // prefs.setString('name',name);
//         // prefs.setString('email',email);
//         // prefs.setString('dept',_dept);
//         // prefs.setString('batch',_batch);
//         // prefs.setString('roll',_roll);

// FirebaseFirestore.instance
//                 .collection('users')
//                 .doc(response.user?.uid)
//                 .set({
//             'name': name, 
//           'email': email,
//           'password': password,
//           'timestamp': DateTime.now().millisecondsSinceEpoch,
//                 });
//         // FirebaseFirestore.instance.collection("users").add({
//         //   'uid': response.user?.uid,
//         //   'name': name, 
//         //   'email': email,
//         //   'password': password,
//         //   'timestamp': DateTime.now().millisecondsSinceEpoch,
//         // });
//         // setState(() {
//         //   _loading = false;
//         // });

//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(
//         //     builder: (context) {
//         //       return HomeScreen();
//         //     },
//         //   ),
//         // );
//       }
// );
//                 Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) {
//               return Dashboard();
//             },
//           ),
//         );
//  }
//     on FirebaseAuthException catch (e) {
//       print(e);
//       // if you want to display your own custom error message
//    /*   if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       } else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       } */
//       showSnackBar(
//           context, e.message!); // Displaying the usual firebase error message
//     }
//  }

//SIGNUP USER
// Future<double> signUpUser({
//     required String email,
//     required String password,
//     required String username,  
//    // required BuildContext context,
//    }) async { 
// String res = "Some error Occurred";
//     try{
// if(email.isNotEmpty ||
//           password.isNotEmpty ||
//           username.isNotEmpty 
//           // bio.isNotEmpty ||
//           // file != null
//           ){
//             await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//           // email: emailController.text,
//           // password: passwordController.text,
//       ).then((response) async{
//         try{
//          await response.user?.sendEmailVerification();
//         //  await sendEmailVerification();
//         }              on FirebaseAuthException catch (e) {
//       print(e);
//       showSnackBar(
//             context,res); 
//     }
// model.User user = model.User(
// uid: response.user!.uid,
// name: username,
// email: email,
// );
//             await _firestore
//             .collection("users")
//             .doc(response.user!.uid)
//             .set(user.toJson());
//         //  FirebaseFirestore.instance.collection("users")
//         //  .add(user.toJson(),);
//       });
// }
//     }      on FirebaseAuthException catch (e) {
//       print(e);
//       showSnackBar(
//           context, e.message!); 
//    }
//    return e;
//    }



   //old
  //          try{
  // await _auth.createUserWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //         // email: emailController.text,
  //         // password: passwordController.text,
  //     ).then((response) async{


        // try{
        //  await response.user?.sendEmailVerification();
        // //  await sendEmailVerification();
        // }
    //         on FirebaseAuthException catch (e) {
    //   print(e);
    //   showSnackBar(
    //       context, e.message!); 
    // }

  
// model.User user = model.User(
// uid: response.user!.uid,
// name: name,
// email: email,
// );
        //  FirebaseFirestore.instance.collection("users")
        //  .add(user.toJson(),);
  //    }
//);
        //         Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       return Dashboard();
        //     },
        //   ),
        // );
       // }
    //         on FirebaseAuthException catch (e) {
    //   print(e);
    //   showSnackBar(
    //       context, e.message!); 
    // }

  // }

  // EMAIL LOGIN
  // Future<void> loginUser({
  //   required String email,
  //   required String password,
  //   required BuildContext context,
  // }) async {
  //   try {
  //  if(
  //   email.isNotEmpty ||
  //         password.isNotEmpty 
  //         ){
  //                 await _auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     ).then((response)  async {
  //     //;
  //       if (!_auth.currentUser!.emailVerified) {  //IF CURTRENT USER NOT VERIFIED
  //       await response.user?.sendEmailVerification();
  //         }
  //         });}
  
  //   }
  //    on FirebaseAuthException catch (e) {
  //     showSnackBar(context, e.message!); // Displaying the error message
  //   }
  // }


  // get user details
  Future<model.UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;

   // DocumentSnapshot documentSnapshot =
   DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();


//  if(snap.data() != null) {
//       userModel = UserModel.fromMap(docSnap.data() as Map<String, dynamic>);
//       //  userModel = User.toJson() as User?;
//     }
 //   return model.User.fromSnap(documentSnapshot);
  return model.UserModel.fromMap(snap.data() as Map<String, dynamic>);
  }
  

  
 // Signing Up User

  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
    required String username,
    // required String bio, 
   // required Uint8List file,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||password.isNotEmpty ||name.isNotEmpty || username.isNotEmpty
          // ||
          // bio.isNotEmpty ||
          // file != null
          ) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        
        );

        // String photoUrl =
        //     await StorageMethods().uploadImageToStorage('profilePics', file, false);
      // final getimage = <String>[];
      // @override
      // void onReady(){
      //   super.onReady();
      // }
      //  getRandomImage() async{
      //   List<String> imgName = ["random"];
      //   try{
      //   for(var img in imgName){
      //   final photoUrl=
      //       await Get.find<StorageMethods>().getImage(img);
      //  getimage.add(photoUrl);
      //   }
      //   } catch(e){print(e);}
      //  }

        // String photoUrl =
        //     await StorageMethods().getImage('profilePics', file, false);
// .then((value) {
//   var userUpdateInfo = UserUpdatedInfo();
//   userUpdateInfo.photoUrl = 'https://firebasestorage.googleapis.com/v0/b/hometutorapp-e9529.appspot.com/o/constant%2Frandom.png?alt=media&token=2e2b598d-b5c7-4604-a658-889e877faa91';
// }
// );
        model.UserModel user = model.UserModel(
          // name: name,
          username: username,
          uid: cred.user!.uid,
          photoUrl: "",
          email: email,
          password: password,
          bio: "",
          // followers: [],
          // following: [],
        );

        // adding user in our database
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(user.toMap());
//.set(user.toMap());
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }

  // logging in user
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // logging in user with email and password
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
  // EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Display error message
    }
  }


//ADD USER DATA TO DATABASE
  //  Future<void> addUserToDB(
  //     {required String uid, required String username, required String email, required DateTime timestamp}) async {

  //   await userRef.document(uid).setData(userModel.toMap(userModel));  //DOCUMENT TO DOC, SETDATA TO SET
  // }
  
  //GET USER DATA FROM DATABASE
  // Future<UserModel> getUserFromDB({required String uid}) async {
  //   final DocumentSnapshot doc = await userRef.doc(uid).get();
  
  //   //print(doc.data());
  
  //   return UserModel.fromMap(doc.data());
  // }
    
   //SIGN OUT
  // Future<void> signOut() async {
  //   await _auth.signOut();
  // }


  // // GOOGLE SIGN IN
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
  //     if (kIsWeb) {
  //       GoogleAuthProvider googleProvider = GoogleAuthProvider();

  //       googleProvider
  //           .addScope('https://www.googleapis.com/auth/contacts.readonly');

  //       await _auth.signInWithPopup(googleProvider);
  //     } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
          // Create a new credential
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );
          //TO GET USER D AND USER DETAILS
          UserCredential userCredential =
              await _auth.signInWithCredential(credential);

              //       User userCredential =
              // (await _auth.signInWithCredential(credential)).user!;
              //save values in userCredential
    

       }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }
  // // FACEBOOK SIGN IN
  Future<void> signInWithFacebook(BuildContext context) async {
  
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
final userData = await FacebookAuth.instance.getUserData();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      await _auth.signInWithCredential(facebookAuthCredential);

await FirebaseFirestore.instance.collection('users').add({
  'email': userData['email'],
  'profileImage': userData['profileImage'],
  'name': userData['name'],
});

// Navigator.of(context).pushAndRemoveUntil(
//   MaterialPageRoute(builder: (_)=>Dashboard()),
//  (route) => false);

    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // SIGN OUT
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }



  // postDetailsToFirestore() async {
  //   // calling our firestore
  //   // calling our user model
  //   // sedning these values

  //  // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //   User? user = _auth.currentUser;

  //   UserModel userModel = UserModel();

  //   // writing all the values
  //   userModel.email = user!.email;
  //   userModel.uid = user.uid;
  //   userModel.name = nameController.text;
  //   userModel.email = emailController.text;
  //   userModel.password = passwordController.text;

  //   await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc(user.uid)
  //       .set(userModel.toMap());
  //  // Fluttertoast.showToast(msg: "Account created successfully :) ");

  //   // Navigator.pushAndRemoveUntil(
  //   //     (context),
  //   //     MaterialPageRoute(builder: (context) => HomeScreen()),
  //   //     (route) => false);
  // }

 //  }
}
