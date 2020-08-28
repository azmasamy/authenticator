import 'package:authenticator/services/authentication.dart';
import 'package:authenticator/ui/constant-styles.dart';
import 'package:flutter/material.dart';

class ThirdPartyAuthButtons extends StatelessWidget {
  final Function _setThirdPartyError;

  ThirdPartyAuthButtons(this._setThirdPartyError);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonTheme(
          minWidth: StyleConstants.raisedButtonWidth,
          child: RaisedButton(
            onPressed: () async {
              dynamic result = await AuthService().signInWithGoogleAccount();
              if (result == null) {
                _setThirdPartyError(
                      "Can't sign in with Google account at the moment");
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
            onPressed: () async {
              dynamic result = await AuthService().signInWithFacebookAccount();
              if (result == null) {
                  _setThirdPartyError(
                      "Can't sign in with Facebook account at the moment");
              }
            },
            child: Text("Continue with Facebook"),
          ),
        ),
      ],
    );
  }
}
