import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testproject/Helper/UIHelper.dart';
import 'package:testproject/Models/UserModel.dart';
import 'package:testproject/screen/Dashboard.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  void checkValues() {
    String name = nameController.text.trim();
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cPassword = cPasswordController.text.trim();

    if(name == "" || username == "" || email == "" || password == "" || cPassword == "") {
      UIHelper.showAlertDialog(context, "Incomplete Data", "Please fill all the fields");
    }
    else if(password != cPassword) {
      UIHelper.showAlertDialog(context, "Password Mismatch", "The passwords you entered do not match!");
    }
    else {
      signUp(email, password);
    }
  }

  void signUp(String email, String password) async {
    UserCredential? credential;

    UIHelper.showLoadingDialog(context, "Creating new account..");

    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(ex) {
      Navigator.pop(context);

      UIHelper.showAlertDialog(context, "An error occured", ex.message.toString());
    }

    if(credential != null) {
      String uid = credential.user!.uid;
      UserModel newUser = UserModel(
        // uid: uid,
        // email: email,
        // fullname: "",
        // profilepic: ""
          name:  nameController.text,
          username: usernameController.text,
          uid: uid,
          photoUrl: "",
          email: email,
          password: password,
          bio: "",
      );
      await FirebaseFirestore.instance.collection("users").doc(uid).set(newUser.toMap()).then((value) {
        print("New User Created!");
        Navigator.popUntil(context, (route) => route.isFirst);
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) {
        //       // return CompleteProfile(userModel: newUser, firebaseUser: credential!.user!);
        //       return Dashboard(userModel: newUser, firebaseUser: credential!.user!);
        //     }
        //   ),
        // );
      });
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

        //           SizedBox(height: 10,),

        //           TextField(
        //             controller: cPasswordController,
        //             obscureText: true,
        //             decoration: InputDecoration(
        //               labelText: "Confirm Password"
        //             ),
        //           ),

        //           SizedBox(height: 20,),

        //           CupertinoButton(
        //             onPressed: () {
        //               checkValues();
        //             },
        //             color: Theme.of(context).colorScheme.secondary,
        //             child: Text("Sign Up"),
        //           ),

        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        child: Container(
            padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
      // margin: EdgeInsets.only(top: 20),
      // child: Form(
      //  key: _form,
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
                  //           Text("Smart Tutoring App", style: TextStyle(
                  //   color: Theme.of(context).colorScheme.secondary,
                  //   fontSize: 45,
                  //   fontWeight: FontWeight.bold
                  // ),),

                  // SizedBox(height: 10,),

                          Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
            child: TextFormField(
                //            onChanged: (value) {
                //   name = value;
                // },
             // controller: nameController,
            decoration: InputDecoration(labelText: 'Your Name'),
            //  hintText: 'You Name',
            controller: nameController,
                //     validator: (validator) {
                //   if (validator!.isEmpty) return 'Please enter name';
                //   return null;
                // }
            ),
          ),
                                    Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
            child: TextFormField(
                //           onChanged: (value) {
                //   email = value;
                // },
           
          //   controller: emailController,
           decoration: InputDecoration(labelText: 'Username'),
              // hintText: 'Your Email',
           controller: usernameController,
                //                validator: (validator) {
                //   if (validator!.isEmpty) return 'Please enter username';
                //   return null;
                // }
            ),
          ),
          //           const SizedBox(height: 20),
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 20),
                          Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
            child: TextFormField(
                //           onChanged: (value) {
                //   email = value;
                // },
           
          //   controller: emailController,
           decoration: InputDecoration(labelText: 'Your Email'),
              // hintText: 'Your Email',
           controller: emailController,
                //                validator: (validator) {
                //   if (validator!.isEmpty) return 'Please enter email';
                //   return null;
                // }
            ),
          ),
          //                     const SizedBox(height: 20),
          // Container(
          //   margin: const EdgeInsets.symmetric(horizontal: 20),
                          Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
            child: TextFormField(
                //           onChanged: (value) {
                //   password = value;
                // },
           //   controller: passwordController,
          decoration: InputDecoration(labelText: 'Your Password'),
          //    hintText: 'Your Password',
          controller: passwordController,
       obscureText: true,
                  //   validator: (validator) {
                  // if (validator!.isEmpty) return 'Please enter password';
                  // return null;
                // }
          
            ),
          ),
                                    Padding(
                  padding: const EdgeInsets.only(bottom:15,left: 10,right: 10),
            child: TextFormField(
                //           onChanged: (value) {
                //   password = value;
                // },
           //   controller: passwordController,
          decoration: InputDecoration(labelText: 'Confirm Password'),
          //    hintText: 'Your Password',
          controller: cPasswordController,
        obscureText: true,
          // validator: (validator) {
          //         if (validator!.isEmpty) return 'Empty';
          //         if (validator != _passwordController.text)
          //           return 'The passwords do not match';
          //         return null;
                //}
            ),
          ),
                    ElevatedButton(
         //  onPressed: signUpUser,
                onPressed: () {
                  // _form.currentState!.validate();
                  // signUpUser();
                      //                   if(_form.currentState!.validate())
                      // {
                     //   print("successful");
checkValues();
                      //   return;
                      // }else{
                      //   showSnackBar(context,"Please enter correct password");
                      // }
                }, 
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
              "Sign Up",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Row(
             mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account?", style: TextStyle(
              fontSize: 16
            ),),
            CupertinoButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Log In", style: TextStyle(
                fontSize: 16
              ),),
            ),
          ],
          ),
        ],
      ),
        )
        ),
      //),
    ),
      ),
      // bottomNavigationBar: Container(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [

      //       Text("Already have an account?", style: TextStyle(
      //         fontSize: 16
      //       ),),

      //       CupertinoButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         child: Text("Log In", style: TextStyle(
      //           fontSize: 16
      //         ),),
      //       ),

      //     ],
      //   ),
      // ),
    );
  }
}