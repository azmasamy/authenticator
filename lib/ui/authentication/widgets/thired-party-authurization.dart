import 'package:authenticator/services/authentication.dart';
import 'package:authenticator/ui/constant-styles.dart';
import 'package:flutter/material.dart';

class ThirdPartyAuthButtons extends StatefulWidget {

  String _error;

  ThirdPartyAuthButtons(String error) {
    this._error = error;
  }


  @override
  _ThirdPartyAuthButtonsState createState() => _ThirdPartyAuthButtonsState();
}

class _ThirdPartyAuthButtonsState extends State<ThirdPartyAuthButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonTheme(
          minWidth: StyleConstants.raisedButtonWidth,
          child: RaisedButton(
            onPressed: (){
              dynamic result =  AuthService().signInWithGoogleAccount();
              if(result == null) {
                setState(() {
                  widget._error = "Can't sign in with Google account";
                });
              }
            },
            child: Text("Continue with Google"),
            textColor: StyleConstants.raisedButtonTextColor,
          ),
        ),
        ButtonTheme(
          minWidth: StyleConstants.raisedButtonWidth,
          child: RaisedButton(
            textColor: StyleConstants.raisedButtonTextColor,
            onPressed: (){},
            child: Text("Continue with Facebook"),
          ),
        ),
      ],
    );
  }
}
