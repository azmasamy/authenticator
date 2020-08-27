import 'package:authenticator/services/authentication.dart';
import 'package:authenticator/ui/authentication/widgets/thired-party-authurization.dart';
import 'package:authenticator/ui/constant-styles.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {

  final Function toggleSignInAndSingUpScreens;

  const SignIn({Key key, this.toggleSignInAndSingUpScreens}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String _error = "";
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign in"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ThirdPartyAuthButtons(_error),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: StyleConstants.textFieldDecoration.copyWith(hintText: "Email"),
                  validator: (val) => val.isEmpty ? "Please enter your email" : null,
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: StyleConstants.textFieldDecoration.copyWith(hintText: "Password"),
                  validator: (val) => val.isEmpty ? "Please enter your password" : null,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                SizedBox(height: 20.0,),
                ButtonTheme(
                  minWidth: StyleConstants.raisedButtonWidth,
                  child: RaisedButton(
                    textColor: StyleConstants.raisedButtonTextColor,
                    onPressed: () async {
                      if(_formKey.currentState.validate()) {
                        dynamic authResult = await AuthService().signInWithEmailAndPassword(_email, _password);
                        if(authResult == null) {
                          setState(() {
                            _error = "Failed, please make sure that you entered the correct email and password";
                          });
                        }
                      }
                    },
                    child: Text("Login"),
                  ),
                ),
                SizedBox(height: 20.0,),
                Text(_error, style: TextStyle(color: Colors.red),),
                SizedBox(height: 20.0,),
                FlatButton(
                  child: Text("Don't have an account? Register"),
                  onPressed: () {
                    widget.toggleSignInAndSingUpScreens();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
