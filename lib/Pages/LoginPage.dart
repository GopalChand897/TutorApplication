import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:testproject/Helper/UIHelper.dart';
import 'package:testproject/Models/UserModel.dart';
import 'package:testproject/Pages/SignUpPage.dart';
import 'package:testproject/Providers/InternetProvider.dart';
import 'package:testproject/Providers/SignInProvider.dart';
import 'package:testproject/Services/firebase_auth_methods.dart';
import 'package:testproject/Utils/show_snack_bar.dart';
import 'package:testproject/Widgets/Color.dart';
import 'package:testproject/Widgets/CustomWidget.dart';
import 'package:testproject/screen/Dashboard.dart';
import 'package:testproject/screen/ResetPassword.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController facebookController =
      RoundedLoadingButtonController();
bool _isObscure3 = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void checkValues() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if(email == "" || password == "") {
      UIHelper.showAlertDialog(context, "Incomplete Data", "Please fill all the fields");
    }
    else {
      logIn(email, password);
    }
  }

  void logIn(String email, String password) async {
    UserCredential? credential;

    UIHelper.showLoadingDialog(context, "Logging In..");

    try {
      credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(ex) {
      // Close the loading dialog
      Navigator.pop(context);

      // Show Alert Dialog
      UIHelper.showAlertDialog(context, "An error occured", ex.message.toString());
    }

    if(credential != null) {
      String uid = credential.user!.uid;
      
      DocumentSnapshot userData = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      UserModel userModel = UserModel.fromMap(userData.data() as Map<String, dynamic>);

      // Go to HomePage
      print("Log In Successful!");
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Dashboard(userModel: userModel, firebaseUser: credential!.user!);
          }
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // child: Container(
        //   padding: EdgeInsets.symmetric(
        //     horizontal: 40,
        //   ),
        //   child: Center(
        //     child: SingleChildScrollView(
        //       child: Column(
        //         children: [

        //           Text("Chat App", style: TextStyle(
        //             color: Theme.of(context).colorScheme.secondary,
        //             fontSize: 45,
        //             fontWeight: FontWeight.bold
        //           ),),

        //           SizedBox(height: 10,),

        //           TextField(
        //             controller: emailController,
        //             decoration: InputDecoration(
        //               labelText: "Email Address"
        //             ),
        //           ),

        //           SizedBox(height: 10,),

        //           TextField(
        //             controller: passwordController,
        //             obscureText: true,
        //             decoration: InputDecoration(
        //               labelText: "Password"
        //             ),
        //           ),

        //           SizedBox(height: 20,),

        //           CupertinoButton(
        //             onPressed: () {
        //               checkValues();
        //             },
        //             color: Theme.of(context).colorScheme.secondary,
        //             child: Text("Log In"),
        //           ),

        //         ],
        //       ),
        //     ),
        //   ),
        // ),


        child:  Container(
      // margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(
            horizontal: 40,
          ),
                    child: Center(
            child: SingleChildScrollView(
      child: Column(
        children: [
                      Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 300,
                    height: 200,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/SmartHomeTutoring.jpeg')),
              ),
            ),
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 20),
                  // Text("Smart Tutoring App", style: TextStyle(
                  //   color: Theme.of(context).colorScheme.secondary,
                  //   fontSize: 45,
                  //   fontWeight: FontWeight.bold
                  // ),),

                    //  SizedBox(height: 20,),
          //   child: 
            TextFormField(
              //        onChanged: (value) {
              //   email = value;
              // },
             // controller: emailController,
         decoration: InputDecoration(labelText: 'Enter your email'),
         //     hintText: 'Enter your email',
             controller: emailController,
          //  ),
          ),
          const SizedBox(height: 10),
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 20),
          //   child: 
            TextFormField(
              //         onChanged: (value) {
              //   password = value;
              // },
             // controller: passwordController,
          decoration: InputDecoration(
                   suffixIcon: IconButton(
                                icon: Icon(_isObscure3
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(() {
                                    _isObscure3 = !_isObscure3;
                                  });
                                }),
            labelText: 'Enter your password'
            
            ),
          //    hintText: 'Enter your password',
              controller: passwordController,
              obscureText: _isObscure3,
            //  isPass: true,
            ),
          // ),
           const SizedBox(height: 10),
          // buildTextField(Icons.mail_outline, "info@demouri.com", false, true),
          // buildTextField(
          //     MaterialCommunityIcons.lock_outline, "**********", true, false),
              TextButton(
                child: Text('Forgot Password?'),
                onPressed: () {
                           Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ResetScreen()),
                );
                   SizedBox(height: 10,);
                //    Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return NavBar();
                //     },
                //   ),
                // );
                },
              //   child:           TextButton(
              // //  child: Text('Forgot Password?'),
              //   onPressed: () => 
              //   Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) => ResetScreen()),
              //   ),
              // ),
                // Text("Forgot Password?",
                //     style: TextStyle(fontSize: 12, color: Palette.textColor1)),
              ),
                 SizedBox(height: 10,),
                        ElevatedButton(
            // onPressed: loginUser,
         onPressed:  checkValues,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              textStyle: MaterialStateProperty.all(
                const TextStyle(color: Colors.white),
              ),
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width / 2.5, 50),
              ),
            ),
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(height: 20.0),
          Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Login  with',
        //  style: kLabelStyle,
        ),
      ],
    ),
         //     Positioned(
            // top: MediaQuery.of(context).size.height - 100,
            // right: 0,
            // left: 0,
            //child:
            SizedBox(height: 10.0),
             Column(
              children: [
              //  Text(isSignupScreen ? "Or Signup with" : "Or Signin with"),
                Container(
                 // margin: EdgeInsets.only(right: 20, left: 20, top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // buildTextButton(
                      //   MaterialCommunityIcons.facebook,
                      //     "Facebook",
                      //      Palette.facebookColor),
                      // buildTextButton(
                      //   MaterialCommunityIcons.google_plus,
                      //     "Google", Palette.googleColor),
                                      CustomWidgets.socialButtonCircle(
                    facebookColor, FontAwesomeIcons.facebookF,
                    iconColor: Colors.white, onTap: () {
                  // Fluttertoast.showToast(msg: 'I am circle facebook');
              //  handleFacebookAuth();
                     context.read<AuthMethods>()
         //  FirebaseAuthMethods(FirebaseAuth.instance)
           .signInWithGoogle(context);
           //     context.read<FirebaseAuthMethods>().signInWithGoogle(context);
// AuthMethods().signInWithFacebook(context);
                }
                ),
                CustomWidgets.socialButtonCircle(
                    googleColor, FontAwesomeIcons.googlePlusG,
                    iconColor: Colors.white, onTap: () {
                  // Fluttertoast.showToast(msg: 'I am circle google');
                //  handleGoogleSignIn();
                               context.read<AuthMethods>()
         //  FirebaseAuthMethods(FirebaseAuth.instance)
           .signInWithFacebook(context);
           //     context.read<FirebaseAuthMethods>().signInWithGoogle(context);
                }
                ),
                    ],
                  ),
                )
              ],
            ),
                     Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?", style: TextStyle(
              fontSize: 16
            ),),

            CupertinoButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SignUpPage();
                    }
                  ),
                );
              },
              child: Text("Sign Up", style: TextStyle(
                fontSize: 16
              ),),
            ),
          ],
        ),
        ],
      ),
        )
        ),
   
    )
      ),
      // bottomNavigationBar: 
      // Container(
      //   child:
      //    Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [

      //       Text("Don't have an account?", style: TextStyle(
      //         fontSize: 16
      //       ),),

      //       CupertinoButton(
      //         onPressed: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) {
      //                 return const SignUpPage();
      //               }
      //             ),
      //           );
      //         },
      //         child: Text("Sign Up", style: TextStyle(
      //           fontSize: 16
      //         ),),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
   // handling google sigin in
  Future handleGoogleSignIn() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      showSnackBar(context, "Check your Internet connection", //Colors.red
      );
      googleController.reset();
    } else {
      await sp.signInWithGoogle().then((value) {
        if (sp.hasError == true) {
          showSnackBar(context, sp.errorCode.toString(), //Colors.red
          );
          googleController.reset();
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  // handling facebookauth
  // handling google sigin in
  Future handleFacebookAuth() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      // showSnackBar(context, "Check your Internet connection", //Colors.red
      // );
    // ignore: use_build_context_synchronously
    UIHelper.showAlertDialog(context, "Internet Issue", "Check your Internet connection");
      facebookController.reset();
    } else {
      await sp.signInWithFacebook().then((value) {
        if (sp.hasError == true) {
          showSnackBar(context, sp.errorCode.toString(), //Colors.red
          );
          facebookController.reset();
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        facebookController.success();
                         handleAfterSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        facebookController.success();
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  // handle after signin
  handleAfterSignIn() async {
    // UserCredential? credential;

    // UIHelper.showLoadingDialog(context, "Logging In..");

    // try {
    //   credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    
    // } on FirebaseAuthException catch(ex) {
    //   // Close the loading dialog
    //   Navigator.pop(context);

    //   // Show Alert Dialog
    //   UIHelper.showAlertDialog(context, "An error occured", ex.message.toString());
    // }

    // if(credential != null) {
    //   String uid = credential.user!.uid;
      
    //   DocumentSnapshot userData = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    //   UserModel userModel = UserModel.fromMap(userData.data() as Map<String, dynamic>);

    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      // // nextScreenReplace(context, const HomeScreen());
      //                 Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) {
      //         return Dashboard(userModel: userModel, firebaseUser: credential!.user!);
      //       },
      //     ),
      //   );
    }
    );
  // }  
  }
}