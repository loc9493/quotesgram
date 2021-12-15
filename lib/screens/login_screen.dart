import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotesgram/models/user_local.dart';
import 'package:quotesgram/repos/user_repo_firebase_impl.dart';
import 'package:quotesgram/view_model/user_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserViewModel auth = Provider.of<UserViewModel>(context);
    return StreamBuilder<UserLocal?>(
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.active) {
          final UserLocal? user = snap.data;
          if (user == null) {
            return LoginForm(auth: auth);
          } else {
            return Text("Logged in");
          }
        }
        return LoginForm(auth: auth);
      },
      stream: auth.authState,
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required this.auth,
  }) : super(key: key);

  final UserViewModel auth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Email",
            ),
            style: TextStyle(color: Colors.white),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Password",
            ),
            style: TextStyle(color: Colors.white),
          ),
          IconButton(
              onPressed: () async =>
                  {await auth.loginWithEmail("loc@gmail.com", "123456")},
              icon: Icon(Icons.lock)),
        ],
      ),
    );
  }
}
