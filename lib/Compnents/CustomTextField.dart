import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
//  final ValueChanged<String> onChanged;
    final TextEditingController controller;
//  final TextEditingController textEditingController; 
  final bool isPass;
  final String hintText;

  const CustomTextField({
    Key? key,
//  required this.textEditingController,
 this.isPass = false,
   required this.controller,
  //  required this.onChanged,
    required this.hintText, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
  //  onChanged: onChanged,
       controller: controller,
     // controller: textEditingController,
      decoration: InputDecoration(
    border: OutlineInputBorder(
             borderSide: BorderSide(
             // color: Palette.textColor1
              ),
             borderRadius: BorderRadius.all(Radius.circular(35.0)),
          // ),    
         // border: InputBorder.none,
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8),
        //   borderSide: const BorderSide(color: Colors.transparent, width: 0),
        // ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent, width: 0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        filled: true,
        fillColor: const Color(0xffF5F6FA),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
      obscureText: isPass,
    );
  }
}