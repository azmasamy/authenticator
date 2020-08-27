import 'package:authenticator/models/user.dart';
import 'package:authenticator/ui/authentication/authentication-selector.dart';
import 'package:authenticator/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthListener extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final User user = Provider.of<User>(context);

    return user != null ? Home() : AuthSelector();
  }
}
