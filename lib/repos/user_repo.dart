import 'package:firebase_auth/firebase_auth.dart';
import 'package:quotesgram/models/user_local.dart';

abstract class UserRepo {
  Future<UserLocal?> login(String email, String pass);
  Future<void> logout();
  Future<bool> signup();
}
