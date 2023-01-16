//https://medium.com/@fernnandoptr/how-to-get-users-current-location-address-in-flutter-geolocator-geocoding-be563ad6f66a
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:testproject/Models/UserModel.dart';
import 'package:testproject/Providers/UserProvider.dart';
import 'package:testproject/Services/FireStoreMethods.dart';
import 'package:testproject/Utils/show_snack_bar.dart';
import 'package:testproject/screen/Dashboard.dart';
class FilterScreen extends StatefulWidget {
  // const Post({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
//   String name = '';
//   // bool isLoading = false;

//   final TextEditingController _descriptionController = TextEditingController();
 
// void post(String uid,
// String name) async {
// // setState(() {
// //   isLoading = true;
// // });

// try {
// String res = await FireStoreMethods().uploadPost(
//         _descriptionController.text,
//         //_file!,
//         uid,
//         name,
//       //  profImage,
//       );
//             if (res == "success") {
//         // setState(() {
//         //   isLoading = false;
//         // });
//         showSnackBar(
//           context,
//           'Posted!',
//         );
//        // clearImage();
//                     Navigator.push(
//     context,
//         MaterialPageRoute(
//           builder: (context) => const Dashboard(),
//         ),
//       );
//       } else {
// //         setState(() {
// //   isLoading = false;
// // });
//         showSnackBar(context, res);
//       }
// } catch(e){
//       showSnackBar(
//         context,
//         e.toString(),
//       );
// }
// }
 
//    @override
//   void dispose() {
//     super.dispose();
//     _descriptionController.dispose();
//   }

  // var userData = {};
  //  bool isLoading = false;

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }
  //   getData() async {
  //   setState(() {
  //     isLoading = true;
  //   });
  //   try {
  //     var snap = await FirebaseFirestore.instance
  //         .collection('users')
  //       //  .doc(widget.uid)
  //         .doc(FirebaseAuth.instance.currentUser!.uid)
  //         .get();

  //     // get post lENGTH
  //     // var postSnap = await FirebaseFirestore.instance
  //     //     .collection('posts')
  //     //     .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
  //     //     .get();

  //     // postLen = postSnap.docs.length;
  //     userData = snap.data()!;
  //     // followers = snap.data()!['followers'].length;
  //     // following = userSnap.data()!['following'].length;
  //     // isFollowing = userSnap
  //     //     .data()!['followers']
  //     //     .contains(FirebaseAuth.instance.currentUser!.uid);
  //     setState(() {});
  //   } catch (e) {
  //     showSnackBar(
  //       context,
  //       e.toString(),
  //     );
  //   }
  //   setState(() {
  //     isLoading = false;
  //   });
  // }
 String? _currentAddress;
  Position? _currentPosition;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }
  @override
  Widget build(BuildContext context) {
      // final User user = Provider.of<UserProvider>(context).getUser;
//  final UserProvider userProvider = Provider.of<UserProvider>(context);
return Scaffold(
            appBar: AppBar(
           //   backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
           //     onPressed: clearImage,
                                 onPressed: () {
 Navigator.pop(context);
    //                                 Navigator.push(
    // context,
    // MaterialPageRoute(builder: (context) =>  Dashboard()));
                    },
              ),
              title: const Text(
                'Apply Filter',
              ),
              centerTitle: false,
              actions: <Widget>[
                TextButton(
onPressed: () {
//   post(
//     // userProvider.getUser.uid, userProvider.getUser.name
// // user.uid, user.name,
//   userData['uid']?? '',
//   userData['name']?? '',
//     );
},
                  child: const Text(
                    "RESET",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0),
                  ),
                )
              ],
            ),
            // POST FORM
            body: 
            Column(
children: [ 
  // isLoading? LinearProgressIndicator(): 
  // Padding(
  //   padding: EdgeInsets.only(top:0),
  // ),
  // Divider(),
  Container(
    margin: EdgeInsets.only(bottom: 20.0),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.white,
      // color: Color(0xFF262626),
    ),
    child: Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 16),
          
          // Row(
          //   children: [
          //     CircleAvatar(
          //     //   backgroundImage: NetworkImage(avatarUrl),
          //       radius: 25.0,
          //     ),
          //     SizedBox(
          //       width: 10.0,
          //     ),
          //     Expanded(
          //       child: Column(
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             // userProvider.getUser.name,
          //         // user.name,
          //           userData['name']?? '',
          //             //"name",
          //          //   userName,
          //             style: TextStyle(
          //               color: Colors.black,
          //               fontSize: 18.0,
          //               fontWeight: FontWeight.w600,
          //             ),
          //           ),
          //           SizedBox(
          //             height: 1.0,
          //           ),
          //       //     Row(
          //       //       children:[
          //       //         Icon(Icons.location_pin),
          //       //     Text("Karachi,Pakistan",
          //       //  //     date,
          //       //       style: TextStyle(
          //       //         color: Colors.black,
          //       //         fontSize: 16.0,
          //       //         fontWeight: FontWeight.w400,
          //       //       ),
          //       //     ), ]),
          //         ],
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 10.0,
          ),
//           TextField(
//              maxLength: 300,
//       //            inputFormatters: [
//       //   LengthLimitingTextInputFormatter(100),
//       // ],
//               controller: _descriptionController,
//        decoration: InputDecoration(  
//     border: InputBorder.none,  
//     hintText: "What's on your mind?"  
//   ),
//  ),
             Text('LAT: ${_currentPosition?.latitude ?? ""}'),
              Text('LNG: ${_currentPosition?.longitude ?? ""}'),
              Text('ADDRESS: ${_currentAddress ?? ""}'),
               const SizedBox(height: 32), 
               ElevatedButton(
                //  onPressed: () {
                //   _getCurrentPosition;
                //  },  
                onPressed: _getCurrentPosition,
                 child: const Text("Get Current Location"),
               )
        ],
      ),
    ),
  ),
          ]
          )
          );
  }
}