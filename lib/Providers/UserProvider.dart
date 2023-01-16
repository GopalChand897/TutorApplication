// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:testproject/Models/UserModel.dart';

// class UserProvider with ChangeNotifier {
//   void addUserData({
//     required User currentUser,
//     required String userName,
//     // required String userImage,
//     required String userEmail,
//   }) async {
//     await FirebaseFirestore.instance
//         .collection("usersData")
//         .doc(currentUser.uid)
//         .set(
//       {
//         "userName": userName,
//         "userEmail": userEmail,
//         // "userImage": userImage,
//         "userUid": currentUser.uid,
//       },
//     );
//   }

//   late UserModel currentData;

//   void getUserData() async {
//     UserModel userModel;
//     var value = await FirebaseFirestore.instance
//         .collection("usersData")
//         .doc(FirebaseAuth.instance.currentUser?.uid)
//         .get();
//     if (value.exists) {
//       userModel = UserModel(
//         userEmail: value.get("userEmail"),
//       //  userImage: value.get("userImage"),
//         userName: value.get("userName"),
//         userUid: value.get("userUid"),
//       );
//       currentData = userModel;
//       notifyListeners();
//     }
//   }


// import 'package:flutter/widgets.dart';
// import 'package:testproject/Models/UserModel.dart';
// import 'package:testproject/Services/firebase_auth_methods.dart';

import 'package:flutter/foundation.dart';
import 'package:testproject/Models/UserModel.dart';
import 'package:testproject/Services/firebase_auth_methods.dart';

class UserProvider with ChangeNotifier {
  UserModel? _user;
 //  final AuthMethods _authMethods = AuthMethods();
final AuthMethods _authMethods = AuthMethods();
  UserModel get getUser => _user!;
    // User? get getUser => _user;

  // bool get isLoggedIn => _user != null;

  Future<void> refreshUser() async {
    
     UserModel user = await _authMethods.getUserDetails();
     _user = user;
     notifyListeners();
  }
}

//   UserModel get currentUserData {
//     return currentData;
//   }
// }