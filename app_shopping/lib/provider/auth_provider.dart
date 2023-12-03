import 'dart:async';

import 'package:app_shopping/apps/models/info.dart';
import 'package:app_shopping/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  Future<bool?> login(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        throw ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw ('Wrong password provided for that user.');
      } else if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
        throw ('Wrong password provided for that user.');
      }
    }
    return null;
  }

  Future<bool?> register(String name, String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Info data = Info(
        id: credential.user!.uid,
        displayName: name,
        photoUrl:
            "https://firebasestorage.googleapis.com/v0/b/khang-project-724d7.appspot.com/o/images%2Fmacdinh.jpg?alt=media&token=4f73b811-3a8f-4339-9dea-efa2b050c76c",
        email: email,
      );

      await FirebaseService.infoRef.doc(credential.user!.uid).set(data);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'weak-password') {
        throw ('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw ('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        throw ('email khong hop le');
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
