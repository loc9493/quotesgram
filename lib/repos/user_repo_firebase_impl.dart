import 'package:flutter/material.dart';
import 'package:quotesgram/models/user_local.dart';
import 'package:quotesgram/repos/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepoFirebaseImpl implements UserRepo {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get getAuthState => _auth.authStateChanges();
  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<bool> signup() {
    // TODO: implement signup
    throw UnimplementedError();
  }

  @override
  Future<UserLocal?> login(String email, String pass) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      return UserLocal(
          name: userCredential.user?.displayName,
          email: userCredential.user?.email,
          uid: userCredential.user?.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return null;
  }
}
