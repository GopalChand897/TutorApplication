import 'package:flutter/material.dart';
import 'package:testproject/Compnents/TextFieldContainer.dart';

class RoundedPasswordField extends StatelessWidget {
 //final ValueChanged<String> controller;
//   const RoundedPasswordField({
//      required Key key, 
//     // required this.controller, 
//     //required controller,
//  //   required this.onChanged,
//   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
     //  controller: null,
      child: TextField(
        obscureText: true,
      //  onChanged: onChanged,
      //  cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          prefixIcon: Icon(
            Icons.lock,
        //    color: kPrimaryColor,
          ),
          // suffixIcon: Icon(
          //   Icons.visibility,
          //   color: kPrimaryColor,
          // ),
           border: OutlineInputBorder(
             borderSide: BorderSide(
             // color: Palette.textColor1
              ),
             borderRadius: BorderRadius.all(Radius.circular(35.0)),
          // ),    
         // border: InputBorder.none,
        ),
          // border: InputBorder.none,
        ),
      ),
    );
  }
}
