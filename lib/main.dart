// @dart=2.9

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testproject/Providers/UserProvider.dart';
import 'package:testproject/Services/firebase_auth_methods.dart';
import 'package:testproject/screen/Dashboard.dart';
import 'package:testproject/screen/login_signup.dart';
import 'firebase_options.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  // Provider.debugCheckInvalidValueType = null;
  // runApp(MultiProvider(
  //     providers: [
  //       ChangeNotifierProvider(create: (_) => UserProvider()),
  //     ],
  //     child: const MyApp(),
  //   ),);

// runApp(
//   MultiProvider(providers: [ChangeNotifierProvider(create: (_)=>UserProvider()),],
//   child: MyApp(),
//   )
// );

}
// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
//   runApp( MyApp());
// }

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

   @override
   State<MyApp> createState() => _MyAppState();

}
 

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
       return MultiProvider(
providers: [
  ChangeNotifierProvider(create: (_) => UserProvider(),),
  
],
      // providers: [
      //   Provider<AuthMethods>(
      //   //  create: (_) => AuthMethods(FirebaseAuth.instance),
      //   create: (_) => AuthMethods(),
      //   ),
      //   StreamProvider(
      //     create: (context) => context.read<AuthMethods>().authStateChanges,
      //     initialData: null, 
      //   ),
      // ],
   child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Tutor App',
    //  home: AuthWrapper() ,    
    home: AnimatedSplashScreen(
      splash: 'assets/Tutor.jpg',
        nextScreen: const AuthWrapper(),
        // splashTransition: SplashTransition.fadeTransition,
       splashTransition: SplashTransition.slideTransition,
       //  pageTransitionType: PageTransitionType.downToUp,
    )


    ));
  }
}

// class MyApp extends StatelessWidget {
//    const MyApp({Key key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     //Statemanagement Provider
//     return MultiProvider(
//     providers: [
//         ChangeNotifierProvider(
//           create: (_) => UserProvider(),
//           ),

//       ],
//   builder: (context, child) {
//     return Text(context.watch<UserProvider>().toString());
//   },
//       //       providers: [ 
//       //         //1st provider
//       //   Provider<AuthMethods>(
//       //     create: (_) => AuthMethods(FirebaseAuth.instance),
//       // //   child: ChangeNotifierProvider(create: (_) => UserProvider(),),
//       //   ),
//       //   //2nd provider
//       //   StreamProvider(
//       //     create: (context) => context.read<AuthMethods>().authStateChanges,
//       //     initialData: null,
//       //   ),
//       // ],
//      child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Home Tutor App',
//         home: AuthWrapper() ,    
//     )
//     );
//   }
// }


class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}


// class _AuthWrapperState extends State<AuthWrapper> {

//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<User>();

//     if (firebaseUser != null) {
//       return const Dashboard();
//   // return NavBar();
//     }
//     return const LoginSignupScreen();
//   }
// }


class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
   // context.read<UserProvider>().refreshUser();
    super.initState();
    addData();
  }
  addData() async {
    UserProvider _userProvider =  Provider.of(context,listen: false);
    await _userProvider.refreshUser();
  }
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<UserProvider>();

    if (firebaseUser.refreshUser != null) {
      return const Dashboard();
  // return NavBar();
    }
    return const LoginSignupScreen();
  }
}



// class _AuthWrapperState extends State<AuthWrapper> {
//   @override
//   void initState() {
//     context.read<UserProvider>().refreshUser();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final firebaseUser = context.watch<UserProvider>();

//     if (firebaseUser.refreshUser != null) {
//       return const Dashboard();
//   // return NavBar();
//     }
//     return const LoginSignupScreen();
//   }
// }