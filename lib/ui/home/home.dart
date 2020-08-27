import 'package:authenticator/models/user.dart';
import 'package:authenticator/services/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _error = "";

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        actions: [
          FlatButton(
            onPressed: () async {
              dynamic result = await AuthService().signOut();
              if(result == null) {
                setState(() {
                  _error = "Couldn't logout logout, make sure you are connected to the internet";
                });
              }
            },
            child: Text("Logout"),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Logged in as ${user.email}"),
            SizedBox(height: 20,),
            Text("Token: ${user.uid}"),
            SizedBox(height: 20,),
            Text(_error, style: TextStyle(color: Colors.red),),
          ],
        ),
      ),
    );
  }
}
