// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_icons/flutter_icons.dart';
// import 'package:provider/provider.dart';
// import 'package:rounded_loading_button/rounded_loading_button.dart';
// import 'package:testproject/Compnents/CustomTextField.dart';
// import 'package:testproject/Models/UserModel.dart';
// import 'package:testproject/OnBoarding.dart';
// import 'package:testproject/Providers/InternetProvider.dart';
// import 'package:testproject/Providers/SignInProvider.dart';
// import 'package:testproject/Services/firebase_auth_methods.dart';
// import 'package:testproject/Utils/show_snack_bar.dart';
// import 'package:testproject/config/palette.dart';
// import 'package:testproject/screen/Dashboard.dart';
// import 'package:testproject/Models/UserModel.dart' as model;
// import 'package:testproject/screen/Post.dart';
// import 'package:testproject/screen/ResetPassword.dart';
// import 'package:testproject/screen/chatpg.dart';


// // final FirebaseAuth _auth = FirebaseAuth.instance;
// // final FirebaseFirestore _firestore = FirebaseFirestore.instance;



// class LoginSignupScreen extends StatefulWidget {
// // final DocumentSnapshot user

//   // final UserModel userModel;
//   // final User firebaseUser;

//   // const LoginSignupScreen({Key? key, required this.userModel, required this.firebaseUser}) : super(key: key);

//    const LoginSignupScreen({Key? key}) : super(key: key);

//   @override
//   // ignore: library_private_types_in_public_api
//   _LoginSignupScreenState createState() => _LoginSignupScreenState();
// }

// class _LoginSignupScreenState extends State<LoginSignupScreen> {

//  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
//   final RoundedLoadingButtonController googleController =
//       RoundedLoadingButtonController();
//   final RoundedLoadingButtonController facebookController =
//       RoundedLoadingButtonController();
//   bool _isObscure3 = true;
//   bool visible = false;
//     bool _loading = false;
//   String name = "";
//   String email = "";
//   String password = "";
//   //   final TextEditingController nameController = TextEditingController();
//   //   final TextEditingController emailController = TextEditingController();
//   // final TextEditingController passwordController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _usernameController = TextEditingController();
//   final TextEditingController _confirmpasswordController = TextEditingController();
//   bool _isLoading = false;
  
// final GlobalKey<FormState> _form = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     super.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _nameController.dispose();
//     _usernameController.dispose();
//     _confirmpasswordController.dispose();
//   }

// //     void signUpUser() async {
// //     // set loading to true
// //     setState(() {
// //       _isLoading = true;
// //     });
// //   // signup user using our authmethodds
// //     //double res =
// //      await AuthMethods().signUpUser(
// //         email: _emailController.text,
// //         password: _passwordController.text,
// //         username: _usernameController.text,
// //         // bio: _bioController.text,
// //         // file: _image!, 
// //       //  context: context,
// //         );
// //     // if string returned is sucess, user has been created
// //     // if (res == "success") {
// //     //   setState(() {
// //     //     _isLoading = false;
// //     //   });
// //                 Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) {
// //               return Dashboard();
// //             },
// //           ),
// //         );
// //       // navigate to the home screen
// //       // Navigator.of(context).pushReplacement(
// //       //   MaterialPageRoute(
// //       //     builder: (context) => const Dashboard(
// //       //       // mobileScreenLayout: MobileScreenLayout(),
// //       //       // webScreenLayout: WebScreenLayout(),
// //       //     ),
// //       //   ),
// //       // );
// //     // } else {
// //     //   setState(() {
// //     //     _isLoading = false;
// //     //   });
// //     //   // show the error
// //     //   showSnackBar(context, res);
// //     // }
// //   }

// //     void loginUser() async {
// //     setState(() {
// //       _isLoading = true;
// //     });
// //  //   String res =
// //      await AuthMethods().loginUser(
// //         email: _emailController.text,
// //         password: _passwordController.text, 
// //         //context: context
// //         );

// //    Navigator.push(
// //       context,
// //           MaterialPageRoute(
// //             builder: (context) {
// //               return Dashboard();
// //             },
// //           ),
// //         );

// //     // if (e == 'success') {
// //     //   Navigator.of(context).pushAndRemoveUntil(
// //     //       MaterialPageRoute(
// //     //         builder: (context) => const Dashboard(
// //     //           // mobileScreenLayout: MobileScreenLayout(),
// //     //           // webScreenLayout: WebScreenLayout(),
// //     //         ),
// //     //       ),
// //     //       (route) => false);

// //     //   setState(() {
// //     //     _isLoading = false;
// //     //   });
// //     // } else {
// //     //   setState(() {
// //     //     _isLoading = false;
// //     //   });
// //     //   showSnackBar(context, "No user exists");
// //     // }
// //   }
//   // void _showDialog(msg) {
//   //   showDialog(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       // return object of type Dialog
//   //       return AlertDialog(
//   //         title: new Text(msg),
//   //         // content: new Text("Alert Dialog body"),
//   //         actions: <Widget>[
//   //           // usually buttons at the bottom of the dialog
//   //           new ElevatedButton(
//   //             child: new Text("Close"),
//   //             onPressed: () {
//   //               Navigator.of(context).pop();
//   //             },
//   //           ),
//   //         ],
//   //       );
//   //     },
//   //   );
//   // }

// //  void signUpUser(name,email,password) async {
// //+++
// //  void signUpUser() async {      
// //     //context.read<FirebaseAuthMethods>().signUpWithEmail(
// //    // context.read<FirebaseAuthMethods>()
    
// //     /*
// //     await AuthMethods(FirebaseAuth.instance)
// //      .signUpWithEmail(
// //       // name:nameController.text,
// //       email: emailController.text,
// //           // email: emailController.text,
// //           password: passwordController.text,
// //           context: context,
// //         ); 
// //         */
// //         try{
// //   await _firebaseAuth.createUserWithEmailAndPassword(
// //         email: email,
// //         password: password,
// //           // email: emailController.text,
// //           // password: passwordController.text,
// //       ).then((response) async{


// //         try{
// //          await response.user?.sendEmailVerification();
// //         //  await sendEmailVerification();
// //         }
// //             on FirebaseAuthException catch (e) {
// //       print(e);
// //       showSnackBar(
// //           context, e.message!); 
// //     }

// //         // catch (e) {
// //         //   print("An error occurred while trying to send email verification");
// //         //   print(context);
// //         // } 
// // // FirebaseFirestore.instance
// // //                 .collection('users')
// // //                 .doc(response.user?.uid)
// // //                 .set({
// // //             'name': name, 
// // //           'email': email,
// // //           'password': password,
// // //           'timestamp': DateTime.now().millisecondsSinceEpoch,
// // //                 });

// //         // SharedPreferences prefs = await SharedPreferences.getInstance();
// //         // prefs.setString('name',name);
// //         // prefs.setString('email',email);
        
// //         // FirebaseFirestore.instance.collection("users").add({
// //         //   'uid': response.user?.uid,
// //         //   'name': name, 
// //         //   'email': email,
// //         //   'password': password,
// //         //   'timestamp': DateTime.now().millisecondsSinceEpoch,
// //         // });
// //         // setState(() {
// //         //   _loading = false;
// //         // });

// // model.User user = model.User(
// // uid: response.user!.uid,
// // name: name,
// // email: email,
// // );
// //          FirebaseFirestore.instance.collection("users")
// //          .add(user.toJson(),);

// //         // Navigator.push(
// //         //   context,
// //         //   MaterialPageRoute(
// //         //     builder: (context) {
// //         //       return HomeScreen();
// //         //     },
// //         //   ),
// //         // );
// //       }
// // );
// //                 Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) {
// //               return Dashboard();
// //             },
// //           ),
// //         );
// //         }
// //             on FirebaseAuthException catch (e) {
// //       print(e);
// //       showSnackBar(
// //           context, e.message!); 
// //     }

// //         //         Navigator.push(
// //         //   context,
// //         //   MaterialPageRoute(
// //         //     builder: (context) {
// //         //       return NavBar();
// //         //     },
// //         //   ),
// //         // );
// //       //   .then((response) async{


// //       //   // try {
// //       //   //   await response.user.sendEmailVerification();
// //       //   // } catch (e) {
// //       //   //   print("An error occurred while trying to send email verification");
// //       //   //   print(e.message);
// //       //   // } 

// //       //   SharedPreferences prefs = await SharedPreferences.getInstance();
// //       //   prefs.setString('name',name);
// //       //   prefs.setString('email',email);

// //       //   FirebaseFirestore.instance.collection("users").add({
// //       //  //   'uid': response.user.uid,
// //       //     'name': name,
// //       //     'email': email,
// //       //     'password': password,
// //       //     'timestamp': DateTime.now().millisecondsSinceEpoch,
// //       //   });
// //       //   setState(() {
// //       //     _loading = false;
// //       //   });

// //       //   Navigator.push(
// //       //     context,
// //       //     MaterialPageRoute(
// //       //       builder: (context) {
// //       //         return Dashboard();
// //       //       },
// //       //     ),
// //       //   );
// //       // });


        
// //         //        Navigator.push(
// //         //   context,
// //         //   MaterialPageRoute(
// //         //     builder: (context) {
// //         //     //  return HomeScreen();
// //         //     return HomeScreen();
// //         //     },
// //         //   ),
// //         // );
// //   } //+++

// //+++
// //   void loginUser() async {
// //    // context.read<FirebaseAuthMethods>().loginWithEmail(
// //     // context.read<AuthMethods>()
// //  /*
// //      AuthMethods(FirebaseAuth.instance)
// //      .loginWithEmail(
// //           email: emailController.text,
// //           password: passwordController.text,
// //           context: context,
// //         );
// //         //         Navigator.push(
// //         //   context,
// //         //   MaterialPageRoute(
// //         //     builder: (context) {
// //         //       return NavBar();
// //         //     },
// //         //   ),
// //         // );
// //         */
// //         try{
// //       await _firebaseAuth.signInWithEmailAndPassword(
// //         email: email,
// //         password: password,
// //       ).then((response)  async {
// //       //;
// //         if (!_firebaseAuth.currentUser!.emailVerified) {  //IF CURTRENT USER NOT VERIFIED
// //         await response.user?.sendEmailVerification();
// //       } 
// //                     Navigator.push(
// //           context,
// //           MaterialPageRoute(
// //             builder: (context) {
// //               return Dashboard();
// //             },
// //           ),
// //         );
// //         });
// //         }
// //       on FirebaseAuthException catch (e) {
// //       showSnackBar(context, e.message!); // Displaying the error message
// //     }
// //   }
// //+++
//   bool isSignupScreen = true;
//   bool isMale = true;
//   bool isRememberMe = false;
  
//   // get emailController => RoundedInputField(hintText: "Your Name", controller: emailController);
//   // final TextEditingController nameController = TextEditingController();
//   // final TextEditingController emailController = TextEditingController();
//   // final TextEditingController passwordController = TextEditingController();

// final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   // void signUpUser() async {
//   //   //context.read<FirebaseAuthMethods>().signUpWithEmail(
//   //  // context.read<FirebaseAuthMethods>()
//   //    FirebaseAuthMethods(FirebaseAuth.instance)
//   //    .signUpWithEmail(
//   //         email: emailController.text,
//   //         password: passwordController.text,
//   //         context: context,
//   //       );
//   //       //        Navigator.push(
//   //       //   context,
//   //       //   MaterialPageRoute(
//   //       //     builder: (context) {
//   //       //     //  return HomeScreen();
//   //       //     return HomeScreen();
//   //       //     },
//   //       //   ),
//   //       // );
//   // }

//   // String name = "";
//   // String email = "";
//   // String password = "";
//   void signUpUser() async {
//     // set loading to true
//     setState(() {
//       _isLoading = true;
//     });

//     // signup user using our authmethodds
//     String res = await AuthMethods().signUpUser(
//         email: _emailController.text,
//         password: _passwordController.text,
//         name: _nameController.text,
//         username: _usernameController.text,
//         // bio: _bioController.text,
//         // file: _image!
//         );
//     // if string returned is sucess, user has been created
//     if (res == "success") {
//       setState(() {
//         _isLoading = false;
//       });
//       // navigate to the home screen
//      // Navigator.of(context).pushReplacement(
//                Navigator.push(
//     context,
//         MaterialPageRoute(
//           builder: (context) => const Dashboard(
//               // userModel: userModel, 
//               //                 firebaseUser: firebaseUser, 

              
//           //  uid: FirebaseAuth.instance.currentUser!.uid,
//             //uid: FirebaseAuth.instance.currentUser.uid,
//             // mobileScreenLayout: MobileScreenLayout(),
//             // webScreenLayout: WebScreenLayout(),
//           ),
//         ),
//       );
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//       // show the error
//       showSnackBar(context, res);
//     } 
//   }

// void loginUser() async {
//     setState(() {
//       _isLoading = true;
//     });
//     String res = await AuthMethods().loginUser(
//         email: _emailController.text, password: _passwordController.text);
//     if (res == 'success') {
//     //  Navigator.of(context).pushAndRemoveUntil(
//                   Navigator.push(
//     context,
//           MaterialPageRoute(
//             builder: (context) => 
//             const
//              Dashboard(  
//                       // userModel: userModel, 
//                       //         firebaseUser: firebaseUser,
                      
                       
//               // mobileScreenLayout: MobileScreenLayout(),
//               // webScreenLayout: WebScreenLayout(),
//             ),
//             // chatpage(
//             //   email: email,
//             // ),
//           ),
//         //  (route) => false
//           );

//       setState(() {
//         _isLoading = false;
//       });
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//       showSnackBar(context, res);
//     }
//   }
    
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Palette.backgroundColor,
//       body: Stack(
//         children: [
//           Positioned(
//             top: 0,
//             right: 0,
//             left: 0,
//             child: Container(
//               height: 300,
//               // decoration: const BoxDecoration(
//               //     image: DecorationImage(
//               //         image: AssetImage("images/background.jpg"),
//               //         fit: BoxFit.fill)),
//               child: Container(
//                 padding: EdgeInsets.only(top: 90, left: 20),
//                 color: Color(0xFF3b5999).withOpacity(.85),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     RichText(
//                       text: TextSpan(
//                           text: "Welcome",
//                           style: TextStyle(
//                             fontSize: 25,
//                             letterSpacing: 2,
//                             color: Colors.yellow[700]!,
//                           ),
//                           children: [
//                             TextSpan(
//                               text: isSignupScreen ? " you! It is lovely to have you among us!," : " Back,",
//                               style: TextStyle(
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.yellow[700]!,
//                               ),
//                             )
//                           ]),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       isSignupScreen
//                           ? "Signup to Continue"
//                           : "Signin to Continue",
//                       style: TextStyle(
//                         letterSpacing: 1,
//                         color: Colors.white,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // Trick to add the shadow for the submit button
//       //   buildBottomHalfContainer(true),
//           //Main Contianer for Login and Signup
//         AnimatedPositioned(
//             duration: Duration(milliseconds: 700),
//             curve: Curves.bounceInOut,
//             top: isSignupScreen ? 200 : 230,
//             child: AnimatedContainer(
//               duration: Duration(milliseconds: 700),
//               curve: Curves.bounceInOut,
//               height: isSignupScreen ? 530 : 530,
//               padding: EdgeInsets.all(20),
//               width: MediaQuery.of(context).size.width - 40,
//               margin: EdgeInsets.symmetric(horizontal: 20),
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(15),
//                   boxShadow: [
//                     BoxShadow(
//                         color: Colors.black.withOpacity(0.3),
//                         blurRadius: 15,
//                         spreadRadius: 5),
//                   ]),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isSignupScreen = false;
//                             });
//                           },
//                           child: Column(
//                             children: [
//                               Text(
//                                 "LOGIN",
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: !isSignupScreen
//                                         ? Palette.activeColor
//                                         : Palette.textColor1),
//                               ),
//                               if (!isSignupScreen)
//                                 Container(
//                                   margin: EdgeInsets.only(top: 5),
//                                   height: 2,
//                                   width: 55,
//                                   color: Colors.orange,
//                                 )
//                             ],
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isSignupScreen = true;
//                             });
//                           },
//                           child: Column(
//                             children: [
//                               Text(
//                                 "SIGNUP",
//                                 style: TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                     color: isSignupScreen
//                                         ? Palette.activeColor
//                                         : Palette.textColor1),
//                               ),
//                               if (isSignupScreen)
//                                 Container(
//                                   margin: EdgeInsets.only(top: 3),
//                                   height: 2,
//                                   width: 55,
//                                   color: Colors.orange,
//                                 )
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                     if (isSignupScreen) buildSignupSection() ,
//                     if (!isSignupScreen) buildSigninSection(),
                
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           // Trick to add the submit button
//          // buildBottomHalfContainer(false),
//           // Bottom buttons
//           // Positioned(
//           //   top: MediaQuery.of(context).size.height - 100,
//           //   right: 0,
//           //   left: 0,
//           //   child: Column(
//           //     children: [
//           //     //  Text(isSignupScreen ? "Or Signup with" : "Or Signin with"),
//           //       Container(
//           //         margin: EdgeInsets.only(right: 20, left: 20, top: 15),
//           //         child: Row(
//           //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           //           children: [
//           //             buildTextButton(
//           //               MaterialCommunityIcons.facebook,
//           //                 "Facebook", Palette.facebookColor),
//           //             buildTextButton(
//           //               MaterialCommunityIcons.google_plus,
//           //                 "Google", Palette.googleColor),
//           //           ],
//           //         ),
//           //       )
//           //     ],
//           //   ),
//           // )
//         ],
//       ),
//     );
//   }

//   Container buildSigninSection() {

//     return Container(
//       margin: EdgeInsets.only(top: 20),
//       child: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20),
//             child: TextFormField(
//               //        onChanged: (value) {
//               //   email = value;
//               // },
//              // controller: emailController,
//          decoration: InputDecoration(labelText: 'Enter your email'),
//          //     hintText: 'Enter your email',
//              controller: _emailController,
//             ),
//           ),
//           const SizedBox(height: 20),
//           Container(
//             margin: const EdgeInsets.symmetric(horizontal: 20),
//             child: TextFormField(
//               //         onChanged: (value) {
//               //   password = value;
//               // },
//              // controller: passwordController,
//           decoration: InputDecoration(
//                    suffixIcon: IconButton(
//                                 icon: Icon(_isObscure3
//                                     ? Icons.visibility
//                                     : Icons.visibility_off),
//                                 onPressed: () {
//                                   setState(() {
//                                     _isObscure3 = !_isObscure3;
//                                   });
//                                 }),
//             labelText: 'Enter your password'
            
//             ),
//           //    hintText: 'Enter your password',
//               controller: _passwordController,
//               obscureText: _isObscure3,
//             //  isPass: true,
//             ),
//           ),
//           // const SizedBox(height: 40),
//           // buildTextField(Icons.mail_outline, "info@demouri.com", false, true),
//           // buildTextField(
//           //     MaterialCommunityIcons.lock_outline, "**********", true, false),
//               TextButton(
//                 child: Text('Forgot Password?'),
//                 onPressed: () {
//                            Navigator.of(context).push(
//                   MaterialPageRoute(builder: (context) => ResetScreen()),
//                 );
//                 //    Navigator.pop(context);
//                 // Navigator.push(
//                 //   context,
//                 //   MaterialPageRoute(
//                 //     builder: (context) {
//                 //       return NavBar();
//                 //     },
//                 //   ),
//                 // );
//                 },
//               //   child:           TextButton(
//               // //  child: Text('Forgot Password?'),
//               //   onPressed: () => 
//               //   Navigator.of(context).push(
//               //     MaterialPageRoute(builder: (context) => ResetScreen()),
//               //   ),
//               // ),
//                 // Text("Forgot Password?",
//                 //     style: TextStyle(fontSize: 12, color: Palette.textColor1)),
//               ),
//                         ElevatedButton(
//             onPressed: loginUser,
//             style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all(Colors.blue),
//               textStyle: MaterialStateProperty.all(
//                 const TextStyle(color: Colors.white),
//               ),
//               minimumSize: MaterialStateProperty.all(
//                 Size(MediaQuery.of(context).size.width / 2.5, 50),
//               ),
//             ),
//             child: const Text(
//               "Login",
//               style: TextStyle(color: Colors.white, fontSize: 16),
//             ),
//           ),
//           SizedBox(height: 20.0),
//           Column(
//       children: <Widget>[
//         Text(
//           '- OR -',
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//         SizedBox(height: 20.0),
//         Text(
//           'Sign in with',
//         //  style: kLabelStyle,
//         ),
//       ],
//     ),
//          //     Positioned(
//             // top: MediaQuery.of(context).size.height - 100,
//             // right: 0,
//             // left: 0,
//             //child:
//             SizedBox(height: 20.0),
//              Column(
//               children: [
//               //  Text(isSignupScreen ? "Or Signup with" : "Or Signin with"),
//                 Container(
//                  // margin: EdgeInsets.only(right: 20, left: 20, top: 15),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       buildTextButton(
//                         MaterialCommunityIcons.facebook,
//                           "Facebook", Palette.facebookColor),
//                       buildTextButton(
//                         MaterialCommunityIcons.google_plus,
//                           "Google", Palette.googleColor),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//       //       Row(
//       //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       //  children:[ 
//       //   Text("Don't Have and account ?"),
//       //   TextButton(
//       //           child: Text('Sign Up'),
//       //           onPressed: () {
//       //                      Navigator.of(context).push(
//       //             MaterialPageRoute(builder: (context) => ResetScreen()),
//       //           ); 
//       //           },)
//       //           ],
//       //       ),
//                             Row(
//             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             mainAxisAlignment: MainAxisAlignment.center,
//        children:[ 
//               Container(
//                     child: const Text(
//                       "Don't Have and account?"
//                     ),
//                     padding: const EdgeInsets.symmetric(vertical: 8),
//                   ),
//                   GestureDetector(
//                     onTap: () => Navigator.of(context).push(
//                       // MaterialPageRoute(
//                       //   builder: (context) => Post(),
//                       // ),
//                         MaterialPageRoute(
//                         builder: (context) => OnBoarding(),),
//                     ),
//                     child: Container(
//                       child: const Text(
//                         ' Sign Up.',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       padding: const EdgeInsets.symmetric(vertical: 8),
//                     ),
//                   ),
//                 ],
//             ),
//             // AlreadyHaveAnAccountCheck(
//             //   press: () {
//             //     Navigator.pop(context);
//             //     Navigator.push(
//             //       context,
//             //       MaterialPageRoute(
//             //         builder: (context) {
//             //           return Post();
//             //         },
//             //       ),
//             //     );
//             //   },
//             // ),

//         //  )
//        //   Row(
//         //    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          //   children: [
//               // Row(
//               //   children: [
//               //     Checkbox(
//               //       value: isRememberMe,
//               //       activeColor: Palette.textColor2,
//               //       onChanged: (value) {
//               //         setState(() {
//               //           isRememberMe = !isRememberMe;
//               //         });
//               //       },
//               //     ),
//               //     Text("Remember me",
//               //         style: TextStyle(fontSize: 12, color: Palette.textColor1))
//               //   ],
//               // ),

//         //    ],
//         //  ),  
//         ],
//       ),
//     );
//   }

//   Container buildSignupSection() {
//     return Container(
//       margin: EdgeInsets.only(top: 20),
//       child: Form(
//        key: _form,
//        child: Column( 
//         children: [
//           // Container(
//           //   margin: const EdgeInsets.symmetric(horizontal: 20),
//                           Padding(
//                   padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
//             child: TextFormField(
//                 //            onChanged: (value) {
//                 //   name = value;
//                 // },
//              // controller: nameController,
//             decoration: InputDecoration(labelText: 'Your Name'),
//             //  hintText: 'You Name',
//             controller: _nameController,
//                     validator: (validator) {
//                   if (validator!.isEmpty) return 'Please enter name';
//                   return null;
//                 }
//             ),
//           ),
//                                     Padding(
//                   padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
//             child: TextFormField(
//                 //           onChanged: (value) {
//                 //   email = value;
//                 // },
           
//           //   controller: emailController,
//            decoration: InputDecoration(labelText: 'Username'),
//               // hintText: 'Your Email',
//            controller: _usernameController,
//                                validator: (validator) {
//                   if (validator!.isEmpty) return 'Please enter username';
//                   return null;
//                 }
//             ),
//           ),
//           //           const SizedBox(height: 20),
//           // Container(
//           //   margin: const EdgeInsets.symmetric(horizontal: 20),
//                           Padding(
//                   padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
//             child: TextFormField(
//                 //           onChanged: (value) {
//                 //   email = value;
//                 // },
           
//           //   controller: emailController,
//            decoration: InputDecoration(labelText: 'Your Email'),
//               // hintText: 'Your Email',
//            controller: _emailController,
//                                validator: (validator) {
//                   if (validator!.isEmpty) return 'Please enter email';
//                   return null;
//                 }
//             ),
//           ),
//           //                     const SizedBox(height: 20),
//           // Container(
//           //   margin: const EdgeInsets.symmetric(horizontal: 20),
//                           Padding(
//                   padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
//             child: TextFormField(
//                 //           onChanged: (value) {
//                 //   password = value;
//                 // },
//            //   controller: passwordController,
//           decoration: InputDecoration(labelText: 'Your Password'),
//           //    hintText: 'Your Password',
//           controller: _passwordController,
//                     validator: (validator) {
//                   if (validator!.isEmpty) return 'Please enter password';
//                   return null;
//                 }
          
//             ),
//           ),
//                                     Padding(
//                   padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
//             child: TextFormField(
//                 //           onChanged: (value) {
//                 //   password = value;
//                 // },
//            //   controller: passwordController,
//           decoration: InputDecoration(labelText: 'Confirm Password'),
//           //    hintText: 'Your Password',
//           controller: _confirmpasswordController,
//           validator: (validator) {
//                   if (validator!.isEmpty) return 'Empty';
//                   if (validator != _passwordController.text)
//                     return 'The passwords do not match';
//                   return null;
//                 }
          
//             ),
//           ),
//           // Container(
//           //   margin: const EdgeInsets.symmetric(horizontal: 20),
//           // )
// //            SizedBox(height: 2.0,),
// //        //   Container(
// //       // decoration: BoxDecoration(
// //       //  // color: AppColors.primary,
// //       //   borderRadius: BorderRadius.circular(100),
// //       // ), 
// //       RoundedInputField(
// // // obscureText: isPassword,
// //    //     keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
// //         // decoration: InputDecoration(
// //         //           prefixIcon: Icon(
// //         //     Icons.person_outline,
// //         //     color: Palette.iconColor,
// //         //   ),
// //         //   // prefixIcon: Icon(
// //         //   //   icon,
// //         //   //   color: Palette.iconColor,
// //         //   // ),
// //         //   enabledBorder: OutlineInputBorder(
// //         //     borderSide: BorderSide(color: Palette.textColor1),
// //         //     borderRadius: BorderRadius.all(Radius.circular(35.0)),
// //         //   ),
// //         //   focusedBorder: OutlineInputBorder(
// //         //     borderSide: BorderSide(color: Palette.textColor1),
// //         //     borderRadius: BorderRadius.all(Radius.circular(35.0)),
// //         //   ),
// //         //  contentPadding: EdgeInsets.all(10),
// //           // controller: emailController,
// //           hintText: "Your Name",
// //       //    hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
// //       //  ),
// //       ),
// //                   TextFieldContainer(
// //               child: TextField(
// //                 // onChanged: (value) {
// //                 //   email = value;
// //                 // },
// //             //    cursorColor: kPrimaryColor,
// //                 decoration: InputDecoration(
// //                   prefixIcon: Icon(
// //                     Icons.email_outlined,
// //                    // color: kPrimaryColor,
// //                   ),
                  
// //                   hintText: "Your Email",
// //                       border: OutlineInputBorder(
// //              borderSide: BorderSide(
// //              // color: Palette.textColor1
// //               ),
// //              borderRadius: BorderRadius.all(Radius.circular(35.0)),
// //           // ),    
// //          // border: InputBorder.none,
// //         ),
// //                 //  suffix: Text("@ssuet.edu.pk"),
// //                 ),
// //                 controller: emailController,
// //               ),
// //             ),
// //                         RoundedPasswordField(      
// //                           //controller: emailController,
// //               // onChanged: (value) {
// //               //   password = value;
// //               // },
// //             ),
      
//    // ),

//           // buildTextField(
//           //   MaterialCommunityIcons.account_outline, "User Name",
//           //     false, false),
//           // buildTextField(
//           //     MaterialCommunityIcons.email_outline, "email", false, true),
//           // buildTextField(
//           //     MaterialCommunityIcons.lock_outline, "password", true, false),

          
//             //  RoundedInputField(
//             //   hintText: "Your Name",
//             //   icon: Icons.person,
//             //   onChanged: (value) {
//             //     name = value;
//             //   },
//             // ),
//             // RoundedInputField(hintText: "Your Email", 
//             // icon: Icons.email_outlined,
//             //   onChanged: (value) {
//             //     email = value;
//             //   },),
//             //               RoundedInputField(
//             //                 hintText: "Your Password", 
//             // icon: Icons.lock_outline,
//             //   onChanged: (value) {
//             //     password = value;
//             //   },),

//         /*  Padding(
//             padding: const EdgeInsets.only(top: 10, left: 10),
//             child: Row(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       isMale = true;
//                     });
//                   },
//                   child: Row(
//                     children: [
//                       Container(
//                         width: 30,
//                         height: 30,
//                         margin: EdgeInsets.only(right: 8),
//                         decoration: BoxDecoration(
//                             color: isMale
//                                 ? Palette.textColor2
//                                 : Colors.transparent,
//                             border: Border.all(
//                                 width: 1,
//                                 color: isMale
//                                     ? Colors.transparent
//                                     : Palette.textColor1),
//                             borderRadius: BorderRadius.circular(15)),
//                         child: Icon(
//                           MaterialCommunityIcons.account_outline,
//                           color: isMale ? Colors.white : Palette.iconColor,
//                         ),
//                       ),
//                       Text(
//                         "Male",
//                         style: TextStyle(color: Palette.textColor1),
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: 30,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       isMale = false;
//                     });
//                   },
//                   child: Row(
//                     children: [
//                       Container(
//                         width: 30,
//                         height: 30,
//                         margin: EdgeInsets.only(right: 8),
//                         decoration: BoxDecoration(
//                             color: isMale
//                                 ? Colors.transparent
//                                 : Palette.textColor2,
//                             border: Border.all(
//                                 width: 1,
//                                 color: isMale
//                                     ? Palette.textColor1
//                                     : Colors.transparent),
//                             borderRadius: BorderRadius.circular(15)),
//                         child: Icon(
//                           MaterialCommunityIcons.account_outline,
//                           color: isMale ? Palette.iconColor : Colors.white,
//                         ),
//                       ),
//                       Text(
//                         "Female",
//                         style: TextStyle(color: Palette.textColor1),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ), */
//                     ElevatedButton(
//          //  onPressed: signUpUser,
//                 onPressed: () async {
//                   // _form.currentState!.validate();
//                   // signUpUser();
//                                         if(_form.currentState!.validate())
//                       {
//                      //   print("successful");
// signUpUser();
//                         return;
//                       }else{
//                         showSnackBar(context,"Please enter correct password");
//                       }
//                 }, 
              
//         //  onPressed: (){ AuthMethods().signUpUser(email: _emailController.text, 
//         //  password: _passwordController.text, username: _usernameController.text, 
//         //  context: context,
//         //  );},
//            // onPressed: signUpUser(name,email,password),
//             style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all(Colors.blue),
//               textStyle: MaterialStateProperty.all(
//                 const TextStyle(color: Colors.white),
//               ),
//               minimumSize: MaterialStateProperty.all(
//                 Size(MediaQuery.of(context).size.width / 2.5, 50),
//               ),
//             ),
//             child: const Text(
//               "Sign Up",
//               style: TextStyle(color: Colors.white, fontSize: 16),
//             ),
            
//           ),
//                       Row(
//             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             mainAxisAlignment: MainAxisAlignment.center,
//        children:[ 
//         // Text("Already have an Account ? "),
//         // TextButton(
//         //         child: Text('Sign In'),
          
//         //         onPressed: () {
//         //                    Navigator.of(context).push(
//         //           MaterialPageRoute(builder: (context) => ResetScreen()),
//         //         ); 
//         //         },
//         //         )
//                           Container(
//                     child: const Text(
//                       'Already have an account?',
//                     ),
//                     padding: const EdgeInsets.symmetric(vertical: 8),
//                   ),
//                   GestureDetector(
//                     onTap: () => Navigator.of(context).push(
//                       MaterialPageRoute(
//                         builder: (context) => Post(),
//                       ),
//                     ),
//                     child: Container(
//                       child: const Text(
//                         ' Sign In.',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       padding: const EdgeInsets.symmetric(vertical: 8),
//                     ),
//                   ),
//                 ],
//             ),
//                   // GestureDetector(
//                   //   onTap: () => Navigator.of(context).push(
//                   //     MaterialPageRoute(
//                   //       builder: (context) =>  Post(),
//                   //     ),
//                   //   )),
//             // AlreadyHaveAnAccountCheck(
//             //   login: false,
//             //   press: () {
//             //     Navigator.push(
//             //       context,
//             //       MaterialPageRoute(
//             //         builder: (context) {
//             //           return Post();
//             //         },
//             //       ),
//             //     );
//             //   },
//             // ),
//           // Container(
//           //   width: 200,
//           //   margin: EdgeInsets.only(top: 20),
//           //   child: RichText(
//           //     textAlign: TextAlign.center,
//           //     text: TextSpan(
//           //         text: "By pressing 'Submit' you agree to our ",
//           //         style: TextStyle(color: Palette.textColor2),
//           //         children: [
//           //           TextSpan(
//           //             //recognizer: ,
//           //             text: "term & conditions",
//           //             style: TextStyle(color: Colors.orange),
//           //           ),
//           //         ]),
//           //   ),
//           // ),
//         ],
//       )),
//     );
//   }

//   TextButton buildTextButton(
//       IconData icon, String title, Color backgroundColor) {
//     return TextButton(
//       onPressed: () {
     
//  if(title=="Facebook"){
// // AuthMethods().signInWithFacebook(context);
// handleFacebookAuth();

// //AuthMethods(FirebaseAuth.instance).signInWithFacebook(context);
//  }
//  else if(title=="Google"){
// //AuthMethods().signInWithGoogle(context);
//  handleGoogleSignIn();
// //AuthMethods(FirebaseAuth.instance).signInWithGoogle(context);
//  }  


//         //  FirebaseAuthMethods(FirebaseAuth.instance).signInWithGoogle(context);
//       //  FirebaseAuthMethods(FirebaseAuth.instance).signInWithFacebook(context);


// //     if (!isSignupScreen){
// //       FirebaseAuthMethods(FirebaseAuth.instance).signInWithGoogle(context);
// //         //  Navigator.pop(context);
// //         //         Navigator.push(
// //         //           context,
// //         //           MaterialPageRoute(
// //         //             builder: (context) {
// //         //               return NavBar();
// //         //             },
// //         //           ),
// //         //         );
// // //NavBar();
// //     } else {

// //     }

//       },
//       style: TextButton.styleFrom(
//           side: BorderSide(width: 1, color: Colors.grey),
//           minimumSize: Size(145, 40),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//           primary: Colors.white,
//           backgroundColor: backgroundColor),
//       child: Row(
//         children: [
//           Icon(
//             icon,
//           ),
//           SizedBox(
//             width: 5,
//           ),
//           Text(
//             title,
//           )
//         ],
//       ),
//     );
//   }


// //   Widget buildBottomHalfContainer(bool showShadow) {
// //     return AnimatedPositioned(
// //       duration: Duration(milliseconds: 700),
// //       curve: Curves.bounceInOut,
// //       top: isSignupScreen ? 535 : 430,
// //       right: 0,
// //       left: 0,
// //       child: Center(
// //         child: Container(
// //           height: 90,
// //           width: 90,
// //           padding: EdgeInsets.all(15),
// //           decoration: BoxDecoration(
// //               color: Colors.white,
// //               borderRadius: BorderRadius.circular(50),
// //               // boxShadow: [
// //               //   if (showShadow)
// //               //     BoxShadow(
// //               //       color: Colors.black.withOpacity(.3),
// //               //       spreadRadius: 1.5,
// //               //       blurRadius: 10,
// //               //     )
// //               // ]
              
// //               ),
// //           // child: !showShadow
// //           //     ? Container(
// //           //         decoration: BoxDecoration(
// //           //             boxShadow: [
// //           //               BoxShadow(
// //           //                   color: Colors.black.withOpacity(.3),
// //           //                   spreadRadius: 1,
// //           //                   blurRadius: 2,
// //           //                   offset: Offset(0, 1))
// //           //             ],
// //           //               gradient: LinearGradient(
// //           //                 colors: [Colors.orange[200]!, Colors.red[400]!],
// //           //                 begin: Alignment.topLeft,
// //           //                 end: Alignment.bottomRight
// //           //                 ),
// //           //                 borderRadius: BorderRadius.circular(30),
// //           //             ),
// //                       // onPressed: buildBottomHalfContainer,
// // //              child: Stack(
// // //  children: <Widget>[
// // //   Container( //background
// // //    height: 100,
// // //    width: 100,
// // //   ),

// // //floating action button
// // //  child: FloatingActionButton(
// // //    child: Icon(
// // //     Icons.arrow_forward
// // //     ),
// // //  onPressed: () {
// // //     if (isSignupScreen){
// // //      // signUpUser(name,email,password);
// // //    //   _register(name,email,password);
// // // // _firebaseAuth.createUserWithEmailAndPassword(
// // // //   email: email, 
// // // //   password: password);
// // //  signUpUser;
// // //         //  Navigator.pop(context);
// // //         //         Navigator.push(
// // //         //           context,
// // //         //           MaterialPageRoute(
// // //         //             builder: (context) {
// // //         //               return NavBar();
// // //         //             },
// // //         //           ),
// // //         //         );

// // //     } 
// // //     if(!isSignupScreen) {
// // // loginUser;
// // //               //  Navigator.pop(context);
// // //               //   Navigator.push(
// // //               //     context,
// // //               //     MaterialPageRoute(
// // //               //       builder: (context) {
// // //               //         return Post();
// // //               //       },
// // //               //     ),
// // //               //   );
      
// // //     }
// // //         //       Navigator.pop(context);
// // //         //         Navigator.push(
// // //         //           context,
// // //         //           MaterialPageRoute(
// // //         //             builder: (context) {
// // //         //           return  Scaffold(
// // //         // drawer: NavBar(),
// // //         // appBar: AppBar(
// // //         //   title: const Text('SideBar'),
// // //         // ),
// // //         // body: SizedBox(width: 1000, height: 1000, child: Dashboard()));
// // //         //             //  return NavBar();
                   
// // //         //             },
// // //         //           ),
// // //         //         );
// // //    },
   
// // //   ), //floating action button
// // //  ],
// // // ),
// //                   // child: Icon(
// //                   //   Icons.arrow_forward,
// //                   //   color: Colors.white,
// //                   // ),
// //               //   )
// //               // : Center(),
// //         ),
// //       ),
// //     );
// //   }

//   Widget buildTextField(
//       IconData icon, String hintText, bool isPassword, bool isEmail) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: TextField(
//         obscureText: isPassword,
//         keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
//         decoration: InputDecoration(
//           prefixIcon: Icon(
//             icon,
//             color: Palette.iconColor,
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Palette.textColor1),
//             borderRadius: BorderRadius.all(Radius.circular(35.0)),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Palette.textColor1),
//             borderRadius: BorderRadius.all(Radius.circular(35.0)),
//           ),
//           contentPadding: EdgeInsets.all(10),
//           hintText: hintText,
//           hintStyle: TextStyle(fontSize: 14, color: Palette.textColor1),
//         ),
//       ),
//     );
//   }



// //++++++++++++++++++++++++++++++++
//   // handling google sigin in
//   Future handleGoogleSignIn() async {
//     final sp = context.read<SignInProvider>();
//     final ip = context.read<InternetProvider>();
//     await ip.checkInternetConnection();

//     if (ip.hasInternet == false) {
//       showSnackBar(context, "Check your Internet connection", //Colors.red
//       );
//       googleController.reset();
//     } else {
//       await sp.signInWithGoogle().then((value) {
//         if (sp.hasError == true) {
//           showSnackBar(context, sp.errorCode.toString(), //Colors.red
//           );
//           googleController.reset();
//         } else {
//           // checking whether user exists or not
//           sp.checkUserExists().then((value) async {
//             if (value == true) {
//               // user exists
//               await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
//                   .saveDataToSharedPreferences()
//                   .then((value) => sp.setSignIn().then((value) {
//                         googleController.success();
//                         handleAfterSignIn();
//                       })));
//             } else {
//               // user does not exist
//               sp.saveDataToFirestore().then((value) => sp
//                   .saveDataToSharedPreferences()
//                   .then((value) => sp.setSignIn().then((value) {
//                         googleController.success();
//                         handleAfterSignIn();
//                       })));
//             }
//           });
//         }
//       });
//     }
//   }

//   // handling facebookauth
//   // handling google sigin in
//   Future handleFacebookAuth() async {
//     final sp = context.read<SignInProvider>();
//     final ip = context.read<InternetProvider>();
//     await ip.checkInternetConnection();

//     if (ip.hasInternet == false) {
//       showSnackBar(context, "Check your Internet connection", //Colors.red
//       );
//       facebookController.reset();
//     } else {
//       await sp.signInWithFacebook().then((value) {
//         if (sp.hasError == true) {
//           showSnackBar(context, sp.errorCode.toString(), //Colors.red
//           );
//           facebookController.reset();
//         } else {
//           // checking whether user exists or not
//           sp.checkUserExists().then((value) async {
//             if (value == true) {
//               // user exists
//               await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
//                   .saveDataToSharedPreferences()
//                   .then((value) => sp.setSignIn().then((value) {
//                         facebookController.success();
//                         handleAfterSignIn();
//                       })));
//             } else {
//               // user does not exist
//               sp.saveDataToFirestore().then((value) => sp
//                   .saveDataToSharedPreferences()
//                   .then((value) => sp.setSignIn().then((value) {
//                         facebookController.success();
//                         handleAfterSignIn();
//                       })));
//             }
//           });
//         }
//       });
//     }
//   }

//   // handle after signin
//   handleAfterSignIn() {
//     Future.delayed(const Duration(milliseconds: 1000)).then((value) {
//       // nextScreenReplace(context, const HomeScreen());
//                       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) {
//               return Dashboard();
//             },
//           ),
//         );
//     });
//   }


// }







// //++++++++++++++++++++++++
