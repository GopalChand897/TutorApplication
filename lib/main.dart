// // @dart=2.9

// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:testproject/OnBoarding.dart';
// import 'package:testproject/Pages/LoginPage.dart';
// import 'package:testproject/Providers/InternetProvider.dart';
// import 'package:testproject/Providers/SignInProvider.dart';
// import 'package:testproject/Providers/UserProvider.dart';
// import 'package:testproject/Services/firebase_auth_methods.dart';
// import 'package:testproject/screen/Dashboard.dart';
// import 'package:testproject/screen/login_signup.dart';
// import 'package:uuid/uuid.dart';
// import 'firebase_options.dart';

// var uuid = Uuid();

// Future<void> main() async {
//    WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
//   // Provider.debugCheckInvalidValueType = null;
//   // runApp(MultiProvider(
//   //     providers: [
//   //       ChangeNotifierProvider(create: (_) => UserProvider()),
//   //     ],
//   //     child: const MyApp(),
//   //   ),);

// // runApp(
// //   MultiProvider(providers: [ChangeNotifierProvider(create: (_)=>UserProvider()),],
// //   child: MyApp(),
// //   )
// // );

// }
// // void main() async{
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp(
// //     options: DefaultFirebaseOptions.currentPlatform,
// // );
// //   runApp( MyApp());
// // }

// class MyApp extends StatefulWidget {
//   const MyApp({Key key}) : super(key: key);

//    @override
//    State<MyApp> createState() => _MyAppState();

// }
 

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//        return MultiProvider(
// providers: [
// //  ChangeNotifierProvider(create: (_) => UserProvider(),),
//          ChangeNotifierProvider(
//           create: ((context) => UserProvider()),
//         ),
//          ChangeNotifierProvider(
//           create: ((context) => SignInProvider()),
//         ),
//         ChangeNotifierProvider(
//           create: ((context) => InternetProvider()),
//         ), 
// ],
//       // providers: [
//       //   Provider<AuthMethods>(
//       //   //  create: (_) => AuthMethods(FirebaseAuth.instance),
//       //   create: (_) => AuthMethods(),
//       //   ),
//       //   StreamProvider(
//       //     create: (context) => context.read<AuthMethods>().authStateChanges,
//       //     initialData: null, 
//       //   ),
//       // ],
//    child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Home Tutor App',
//     //  home: AuthWrapper() ,    
//     home: AnimatedSplashScreen(
//       // splash: 'assets/Tutor.jpg',
//      splash: 'assets/SmartHomeTutoring.jpeg',
//         nextScreen: const AuthWrapper(),
//         // splashTransition: SplashTransition.fadeTransition,
//        splashTransition: SplashTransition.slideTransition,
//        //  pageTransitionType: PageTransitionType.downToUp,
//     )
//     ));
//   }
// }

// // class MyApp extends StatelessWidget {
// //    const MyApp({Key key}) : super(key: key);

// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     //Statemanagement Provider
// //     return MultiProvider(
// //     providers: [
// //         ChangeNotifierProvider(
// //           create: (_) => UserProvider(),
// //           ),

// //       ],
// //   builder: (context, child) {
// //     return Text(context.watch<UserProvider>().toString());
// //   },
// //       //       providers: [ 
// //       //         //1st provider
// //       //   Provider<AuthMethods>(
// //       //     create: (_) => AuthMethods(FirebaseAuth.instance),
// //       // //   child: ChangeNotifierProvider(create: (_) => UserProvider(),),
// //       //   ),
// //       //   //2nd provider
// //       //   StreamProvider(
// //       //     create: (context) => context.read<AuthMethods>().authStateChanges,
// //       //     initialData: null,
// //       //   ),
// //       // ],
// //      child: MaterialApp(
// //         debugShowCheckedModeBanner: false,
// //         title: 'Home Tutor App',
// //         home: AuthWrapper() ,    
// //     )
// //     );
// //   }
// // }


// class AuthWrapper extends StatefulWidget {
//   const AuthWrapper({Key key}) : super(key: key);

//   @override
//   State<AuthWrapper> createState() => _AuthWrapperState();
// }


// // class _AuthWrapperState extends State<AuthWrapper> {

// //   @override
// //   Widget build(BuildContext context) {
// //     final firebaseUser = context.watch<User>();

// //     if (firebaseUser != null) {
// //       return const Dashboard();
// //   // return NavBar();
// //     }
// //     return const LoginSignupScreen();
// //   }
// // }


// class _AuthWrapperState extends State<AuthWrapper> {
//   @override
//   void initState() {
//    // context.read<UserProvider>().refreshUser();
//     super.initState();
//     addData();
//   }
//   addData() async {
//     UserProvider _userProvider =  Provider.of<UserProvider>(context,listen: false);
//     await _userProvider.refreshUser();
//   }
//   @override
//   Widget build(BuildContext context) {
    
//     final firebaseUser = context.watch<UserProvider>();

//     if (firebaseUser.refreshUser != null) {
//       return const Dashboard();
//   // return NavBar();
//     }
//     // return const LoginSignupScreen();
// return const LoginPage();
//   // return OnBoarding();
//   }
// }



// // class _AuthWrapperState extends State<AuthWrapper> {
// //   @override
// //   void initState() {
// //     context.read<UserProvider>().refreshUser();
// //     super.initState();
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     final firebaseUser = context.watch<UserProvider>();

// //     if (firebaseUser.refreshUser != null) {
// //       return const Dashboard();
// //   // return NavBar();
// //     }
// //     return const LoginSignupScreen();
// //   }
// // }


// // @dart=2.9

// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:testproject/OnBoarding.dart';
// import 'package:testproject/Pages/LoginPage.dart';
// import 'package:testproject/Providers/InternetProvider.dart';
// import 'package:testproject/Providers/SignInProvider.dart';
// import 'package:testproject/Providers/UserProvider.dart';
// import 'package:testproject/Services/firebase_auth_methods.dart';
// import 'package:testproject/screen/Dashboard.dart';
// import 'package:testproject/screen/login_signup.dart';
// import 'package:uuid/uuid.dart';
// import 'firebase_options.dart';

// var uuid = Uuid();

// Future<void> main() async {
//    WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(const MyApp());
//   // Provider.debugCheckInvalidValueType = null;
//   // runApp(MultiProvider(
//   //     providers: [
//   //       ChangeNotifierProvider(create: (_) => UserProvider()),
//   //     ],
//   //     child: const MyApp(),
//   //   ),);

// // runApp(
// //   MultiProvider(providers: [ChangeNotifierProvider(create: (_)=>UserProvider()),],
// //   child: MyApp(),
// //   )
// // );

// }
// // void main() async{
// //   WidgetsFlutterBinding.ensureInitialized();
// //   await Firebase.initializeApp(
// //     options: DefaultFirebaseOptions.currentPlatform,
// // );
// //   runApp( MyApp());
// // }

// class MyApp extends StatefulWidget {
//   const MyApp({Key key}) : super(key: key);

//    @override
//    State<MyApp> createState() => _MyAppState();

// }
 

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//        return MultiProvider(
// providers: [
// //  ChangeNotifierProvider(create: (_) => UserProvider(),),
//          ChangeNotifierProvider(
//           create: ((context) => UserProvider()),
//         ),
//          ChangeNotifierProvider(
//           create: ((context) => SignInProvider()),
//         ),
//         ChangeNotifierProvider(
//           create: ((context) => InternetProvider()),
//         ), 
// ],
//       // providers: [
//       //   Provider<AuthMethods>(
//       //   //  create: (_) => AuthMethods(FirebaseAuth.instance),
//       //   create: (_) => AuthMethods(),
//       //   ),
//       //   StreamProvider(
//       //     create: (context) => context.read<AuthMethods>().authStateChanges,
//       //     initialData: null, 
//       //   ),
//       // ],
//    child: MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Home Tutor App',
//     //  home: AuthWrapper() ,    
//     home: AnimatedSplashScreen(
//       // splash: 'assets/Tutor.jpg',
//      splash: 'assets/SmartHomeTutoring.jpeg',
//         nextScreen: const AuthWrapper(),
//         // splashTransition: SplashTransition.fadeTransition,
//        splashTransition: SplashTransition.slideTransition,
//        //  pageTransitionType: PageTransitionType.downToUp,
//     )
//     ));
//   }
// }

// // class MyApp extends StatelessWidget {
// //    const MyApp({Key key}) : super(key: key);

// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     //Statemanagement Provider
// //     return MultiProvider(
// //     providers: [
// //         ChangeNotifierProvider(
// //           create: (_) => UserProvider(),
// //           ),

// //       ],
// //   builder: (context, child) {
// //     return Text(context.watch<UserProvider>().toString());
// //   },
// //       //       providers: [ 
// //       //         //1st provider
// //       //   Provider<AuthMethods>(
// //       //     create: (_) => AuthMethods(FirebaseAuth.instance),
// //       // //   child: ChangeNotifierProvider(create: (_) => UserProvider(),),
// //       //   ),
// //       //   //2nd provider
// //       //   StreamProvider(
// //       //     create: (context) => context.read<AuthMethods>().authStateChanges,
// //       //     initialData: null,
// //       //   ),
// //       // ],
// //      child: MaterialApp(
// //         debugShowCheckedModeBanner: false,
// //         title: 'Home Tutor App',
// //         home: AuthWrapper() ,    
// //     )
// //     );
// //   }
// // }


// class AuthWrapper extends StatefulWidget {
//   const AuthWrapper({Key key}) : super(key: key);

//   @override
//   State<AuthWrapper> createState() => _AuthWrapperState();
// }


// // class _AuthWrapperState extends State<AuthWrapper> {

// //   @override
// //   Widget build(BuildContext context) {
// //     final firebaseUser = context.watch<User>();

// //     if (firebaseUser != null) {
// //       return const Dashboard();
// //   // return NavBar();
// //     }
// //     return const LoginSignupScreen();
// //   }
// // }


// class _AuthWrapperState extends State<AuthWrapper> {
//   @override
//   void initState() {
//    // context.read<UserProvider>().refreshUser();
//     super.initState();
//     addData();
//   }
//   addData() async {
//     UserProvider _userProvider =  Provider.of<UserProvider>(context,listen: false);
//     await _userProvider.refreshUser();
//   }
//   @override
//   Widget build(BuildContext context) {
    
//     final firebaseUser = context.watch<UserProvider>();

//     if (firebaseUser.refreshUser != null) {
//       return const Dashboard();
//   // return NavBar();
//     }
//     // return const LoginSignupScreen();
// return LoginPage();
//   // return OnBoarding();
//   }
// }



// // class _AuthWrapperState extends State<AuthWrapper> {
// //   @override
// //   void initState() {
// //     context.read<UserProvider>().refreshUser();
// //     super.initState();
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     final firebaseUser = context.watch<UserProvider>();

// //     if (firebaseUser.refreshUser != null) {
// //       return const Dashboard();
// //   // return NavBar();
// //     }
// //     return const LoginSignupScreen();
// //   }
// // }



//----------------------------------------------------


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testproject/Helper/FirebaseHelper.dart';
import 'package:testproject/Models/UserModel.dart';
import 'package:testproject/OnBoarding.dart';
import 'package:testproject/Pages/LoginPage.dart';
import 'package:testproject/Providers/InternetProvider.dart';
import 'package:testproject/Providers/SignInProvider.dart';
import 'package:testproject/screen/Dashboard.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  User? currentUser = FirebaseAuth.instance.currentUser;
  if(currentUser != null) {
    // Logged Ind
    UserModel? thisUserModel = await FirebaseHelper.getUserModelById(currentUser.uid);
    if(thisUserModel != null) {
      runApp(MyAppLoggedIn(userModel: thisUserModel, firebaseUser: currentUser));
    }
    else {
      runApp(const MyApp());
    }
  }
  else {
    // Not logged in
    runApp(const MyApp());
  }
}


// Not Logged In
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
//            return MultiProvider(
// providers: [
// //  ChangeNotifierProvider(create: (_) => UserProvider(),),
//         //  ChangeNotifierProvider(
//         //   create: ((context) => FirebaseHelper()),
//         // ),
//          ChangeNotifierProvider(
//           create: ((context) => SignInProvider()),
//         ),
//         ChangeNotifierProvider(
//           create: ((context) => InternetProvider()),
//         ), 
// ],
     return
  // child:
     MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: LoginPage(),
   home: OnBoarding(),
    // )
    );
  }
}


// Already Logged In
class MyAppLoggedIn extends StatelessWidget {
  final UserModel userModel;
  final User firebaseUser;

  const MyAppLoggedIn({Key? key, required this.userModel, required this.firebaseUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(userModel: userModel, firebaseUser: firebaseUser),
    );
  }
}