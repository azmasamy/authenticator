import 'package:flutter/material.dart';
import 'package:authenticator/ui/authentication/sign-up.dart';
import 'package:authenticator/ui/authentication/sign-in.dart';

class AuthSelector extends StatefulWidget {
  @override
  _AuthSelectorState createState() => _AuthSelectorState();
}

class _AuthSelectorState extends State<AuthSelector> {
  bool _signInScreenSelected = true;

  void _toggleSignInAndSignUpScreens() {
    setState(() {
      _signInScreenSelected = !_signInScreenSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _signInScreenSelected
        ? SignIn(toggleSignInAndSingUpScreens: _toggleSignInAndSignUpScreens)
        : SignUp(toggleSignInAndSingUpScreens: _toggleSignInAndSignUpScreens);
  }
}
