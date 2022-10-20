import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testproject/Compnents/TextFieldContainer.dart';

class RoundedInputField extends StatelessWidget {
//     final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

// final FirebaseAuth _auth = FirebaseAuth.instance;

  final String hintText;
  final IconData icon;
 // final ValueChanged<String> onChanged;
   RoundedInputField({
  //  required Key key,
    required this.hintText,
    this.icon = Icons.person_outline, 
  //  required controller,
    // required String controller,
  //  required this.onChanged,
  });
  // : super(key: key);



  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
    //  controller: null,
      child: TextField(
       // onChanged: onChanged,
       // cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
           // color: kPrimaryColor,
          ),
          hintText: hintText,
    border: OutlineInputBorder(
             borderSide: BorderSide(
             // color: Palette.textColor1
              ),
             borderRadius: BorderRadius.all(Radius.circular(35.0)),
          // ),    
         // border: InputBorder.none,
        ),
      ),
    ));
  }
}
