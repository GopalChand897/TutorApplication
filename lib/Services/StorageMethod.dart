
// import 'package:flutter/material.dart';

// import 'package:firebase_storage/firebase_storage.dart';

// Class StorageMethods{
// final FirebaseStorage _storage = FirebaseStorage.instance;

// }

import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // adding image to firebase storage
  Future<String> uploadImageToStorage(String childName, Uint8List file, 
  bool isPost
  ) async {
    // creating location to our firebase storage
    
    // Reference ref =
    //     _storage.ref().child(childName).child(_auth.currentUser!.uid);
        Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);
    if(isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }

    // putting in uint8list format -> Upload task like a future but not future
    UploadTask uploadTask = ref.putData(
      file
    );

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
}

// Reference get firebaseStorage => FirebaseStorage.instance.ref();
// class StorageMethods extends GetxService{
// Future<String?> 
// getImage(String? imgName) async{
// if(imgName == null){
//   return null;
// }
// try{
// var urlRef = firebaseStorage
// .child("constant")
// .child('${imgName.toLowerCase()}.png');
// var photoUrl = await urlRef.getDownloadURL(); 
// return photoUrl;

// } catch(e){
//   return null;
// }
// }
// }
