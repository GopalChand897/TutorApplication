// // import 'package:flutter/material.dart';
// // import 'package:hazir_sain/Services/firebase_auth_methods.dart';
// // import 'package:hazir_sain/Widgets/custom_button.dart';
// // import 'package:provider/provider.dart';
// // import 'package:testproject/Services/firebase_auth_methods.dart';

// // class HomeScreen extends StatelessWidget {
// //   const HomeScreen({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     final user = context.read<FirebaseAuthMethods>().user;  //access the user

// //     return Scaffold(
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           // when user signs anonymously or with phone, there is no email
// //       //    if (!user.isAnonymous && user.phoneNumber == null) Text(user.email!),
// //        //   if (!user.isAnonymous && user.phoneNumber == null)
// //          //   Text(user.providerData[0].providerId),
// //           // display phone number only when user's phone number is not null
// //           if (user.phoneNumber != null) Text(user.phoneNumber!),
// //           // uid is always available for every sign in method
// //           Text(user.uid),
// //           // display the button only when the user email is not verified
// //           // or isnt an anonymous user
// //       //    if (!user.emailVerified && !user.isAnonymous)
// //        if (!user.emailVerified)
// //             CustomButton(
// //               onTap: () {
// //                 context
// //                     .read<FirebaseAuthMethods>()
// //                     .sendEmailVerification(context);
// //               },
// //               text: 'Verify Email',
// //             ),
// //           CustomButton(
// //             onTap: () {
// //               context.read<FirebaseAuthMethods>().signOut(context);
// //             },
// //             text: 'Sign Out',
// //           ),
// //           // CustomButton(
// //           //   onTap: () {
// //           //     context.read<FirebaseAuthMethods>().deleteAccount(context);
// //           //   },
// //           //   text: 'Delete Account',
// //           // ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:testproject/Compnents/CustomButton.dart';
// import 'package:testproject/Services/firebase_auth_methods.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final user = context.read<AuthMethods>().user;  //access the user

//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//        //   if (user.phoneNumber != null) Text(user.phoneNumber!),
//        Text(user.email!),
//           Text(user.uid),
//        if (!user.emailVerified)
//             CustomButton(
//               onTap: () {
//                 context
//                     .read<AuthMethods>()
//                     .sendEmailVerification(context);
//               },
//               text: 'Verify Email',
//             ),
//           CustomButton(
//             onTap: () {
//               context.read<AuthMethods>().signOut(context);
//             },
//             text: 'Sign Out',
//           ),
//           // CustomButton(
//           //   onTap: () {
//           //     context.read<FirebaseAuthMethods>().deleteAccount(context);
//           //   },
//           //   text: 'Delete Account',
//           // ),
//         ],
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:flutter/src/foundation/key.dart';
// // import 'package:flutter/src/widgets/container.dart';
// // import 'package:flutter/src/widgets/framework.dart';

// // class HomeScreen extends StatelessWidget {
// //   const HomeScreen({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: Text("Logged in the ap!"),
// //       ),
// //     );
// //   }
// // }