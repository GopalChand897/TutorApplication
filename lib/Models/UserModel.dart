// // // import 'package:cloud_firestore/cloud_firestore.dart';
// // // import 'package:firebase_auth/firebase_auth.dart';

// // // class UserModel {
// // // String email;
// // // String uid;
// // // String username;
// // // DateTime timestamp;

// // // UserModel({required this.email, required this.uid, required this.username, required this.timestamp});

// // // Map toMap(UserModel user) {
// // // 	var data = Map<String, dynamic>();

// // // 	data["uid"] = user.uid;
// // // 	data["username"] = user.username;
// // // 	data["email"] = user.email;
// // // 	data["timestamp"] = user.timestamp;

// // // 	return data;
// // // }

// // // // UserModel.fromMap(Map<String, dynamic> mapData) {
// // // // 	this.uid = mapData["uid"];
// // // // 	this.username = mapData["username"];
// // // // 	this.email = mapData["email"];
// // // // }
// // // }


// // class UserModel {
// //   String? uid;
// //   String? email;
// //   String? name;
// //   String? password;

// //   UserModel({this.uid, this.email, this.name, this.password});

// //   // receiving data from server
// //   factory UserModel.fromMap(map) {
// //     return UserModel(
// //       uid: map['uid'],
// //       email: map['email'],
// //       name: map['Name'],
// //       password: map['Password'],
// //     );
// //   }

// //   // sending data to our server
// //   Map<String, dynamic> toMap() {
// //     return {
// //       'uid': uid,
// //       'email': email,
// //       'Name': name,
// //       'Password': password,
// //     };
// //   }
// // }



// // class UserModel {
// //   String userName;
// //   String userEmail;
// //   // String userImage;
// //   String userUid;
// //   UserModel({
// //      required this.userEmail,
// //     // this.userImage,
// //     required this.userName,
// //     required this.userUid,
// //   });
// // }


// import 'package:cloud_firestore/cloud_firestore.dart';

// class User {
//   final String email;
//   final String uid;
//   final String photoUrl;
//   final String name;
//   final String username;
//   final String password;
//   final String bio;
//   // final List followers;
//   // final List following;

//   const User(
//       {required this.name,
//       required this.username,
//       required this.uid,
//       required this.photoUrl,
//       required this.email,
//       required this.password,
//       required this.bio
//       // required this.followers,
//       // required this.following
//       });



//   // Map<String, dynamic> toJson() => {
//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "username": username,
//         "uid": uid,
//         "email": email,
//         "password": password,
//          "photoUrl": photoUrl,
//         "bio": bio,
//         // "followers": followers,
//         // "following": following,
//       };

//   // User.fromMap(Map<String, dynamic> map) {
//     // name = map["name"];
//     // username = map["username"];
//     // uid = map["uid"];
//     // email = map["email"];
//     // password = map["password"];
//     // photoUrl = map["photoUrl"];
//     // bio = map["bio"];
//   // }

//   // Map<String, dynamic> toMap() {
//   //   return {
//       // "name": name,
//       // "username": username,
//       // "uid": uid,
//       // "email": email,
//       // "password": password,
//       // "photoUrl": photoUrl,
//       // "bio": bio,
//   //   };
//   // }
//   static User fromSnap(DocumentSnapshot snap) {
//     var snapshot = snap.data() as Map<String, dynamic>;

//     return User(
//       name: snapshot["name"],
//       username: snapshot["username"],
//       uid: snapshot["uid"],
//       email: snapshot["email"],
//       password: snapshot["password"],
//       photoUrl: snapshot["photoUrl"],
//       bio: snapshot["bio"],
//       // followers: snapshot["followers"],
//       // following: snapshot["following"],
//     );
//   }
// }

//-------------------------
class UserModel {
  String? uid;
  // Map<String, dynamic>?  uid;
  String? name;
  String? username;
  String? email;
  String? password;
  String? photoUrl;
  String? bio;

  UserModel({this.uid, 
  this.name, 
  this.username, this.email, this.password, this.photoUrl, this.bio});
  UserModel.fromMap(Map<String, dynamic> map) {
    uid = map["uid"];
    name = map["name"];
    username = map["username"];
    email = map["email"];
    password = map["password"];
    photoUrl = map["photoUrl"];
    bio = map["bio"];
  }

  Map<String, dynamic> toMap() {
    return {
      "uid": uid,
      "name": name,
      "username": username,
      "email": email,
      "password": password,
      "photoUrl": photoUrl,
      "bio": bio,
    };
  }
  // UserModel.fromMap(Map<String, dynamic> map) {
  //   uid = map["uid"];
  //   fullname = map["fullname"];
  //   email = map["email"];
  //   profilepic = map["profilepic"];
  // }

  // Map<String, dynamic> toMap() {
  //   return {
  //     "uid": uid,
  //     "fullname": fullname,
  //     "email": email,
  //     "profilepic": profilepic,
  //   };
  // }
}