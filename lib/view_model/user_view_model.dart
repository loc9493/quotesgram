import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quotesgram/models/user_local.dart';
import 'package:quotesgram/repos/user_repo_firebase_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserViewModel extends ChangeNotifier {
  UserLocal? currentUser;
  final UserRepoFirebaseImpl _auth = UserRepoFirebaseImpl();

  Stream<UserLocal> get authState =>
      _auth.getAuthState.map((User? event) => UserLocal(
          name: event?.displayName, email: event?.email, uid: event?.uid));
  loginWithEmail(String email, String pass) async {
    var user = await _auth.login(email, pass);
    print(user?.uid ?? "");
    currentUser = user;
  }
}
