import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ResetScreen extends StatefulWidget {
  @override
  _ResetScreenState createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  late String _email;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(title: Text('Reset Password'),),
      // body: Column(
               body:  Container(
      // margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Center(
             child: Column(
        children: [
      //    Icon(
      //   Icons.lock,
      //   color: Colors.blue,
      //   // size: constraints.maxWidth / 4 * (1 - shrinkOffset),
      // ),
                                      Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 300,
                    height: 200,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/forgotpass.jpg')
                    ),
              ),
            ),
           const SizedBox(height: 10),
 ListTile(
  title: Text("RESET PASSWORD"),
  subtitle: Text("Please enter your email address to recover your password."),
 ),
                // const Text(
                //   'Please enter your email address to recover your password.',
                //   style: TextStyle(
                //     fontSize: 15,
                //     color: Colors.black,
                //   )
                //   ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(  
                hintText: 'Email'
              ),
               onChanged: (value) {
                setState(() {
                  _email = value.trim();
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: Text('Send Request'),
                onPressed: () {
                  auth.sendPasswordResetEmail(email: _email);
                  Navigator.of(context).pop();
                },
              //  color: Theme.of(context).colorScheme.secondary,
              ),

            ],
          ),

        ],
        ),
    )
    )
    );
  }
}