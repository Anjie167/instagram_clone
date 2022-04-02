import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String email,
    required String password,
    required String userName,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          userName.isNotEmpty ||
          bio.isNotEmpty ||
          file != null
      ){
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String photoURL = await StorageMethods().uploadImageToStorage('profilePics', file, false);
        await _firestore.collection('users').doc(cred.user!.uid).set({
          'username': userName,
          'uid': cred.user!.uid,
          'bio': bio,
          'followers': [],
          'following': [],
          'photoUrl': photoURL,
        });
        print(cred.user!.uid);

        res = "success";
      }
    } on FirebaseAuthException catch (err){
      if(err.code == 'inalid-email'){
        res = 'The email is badly formatted';
      }
    }

    catch (err) {
      res = err.toString();
    }
    return res;
  }
}
