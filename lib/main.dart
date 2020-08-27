import 'package:authenticator/models/user.dart';
import 'package:authenticator/services/authentication.dart';
import 'package:authenticator/ui/authentication-listener.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Authenticator',
        theme: ThemeData.light(),
        home: AuthListener(),
      ),
    );
  }
}