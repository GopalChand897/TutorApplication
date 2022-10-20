import 'package:flutter/material.dart';
class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
   // required Key key,
   //    required controller,
    required this.child,
  });
  // : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      padding: EdgeInsets.symmetric(horizontal: 05, vertical: 5),
      width: size.width * 0.9,
      decoration: BoxDecoration(
      //  color: kPrimaryLightColor,
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
