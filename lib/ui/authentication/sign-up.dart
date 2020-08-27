import 'package:authenticator/services/authentication.dart';
import 'package:authenticator/ui/authentication/widgets/thired-party-authurization.dart';
import 'package:authenticator/ui/constant-styles.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget {

  final Function toggleSignInAndSingUpScreens;

  const SignUp({Key key, this.toggleSignInAndSingUpScreens}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();
  String _error = "";
  String _email;
  String _password;
  String _passwordConfirmed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
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
                  validator: (val) => val.isEmpty ? "Please Enter Your Email" : null,
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: StyleConstants.textFieldDecoration.copyWith(hintText: "Password"),
                  validator: (val) => val.length < 8 ? "Password must be at least 8 characters long" : null,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  decoration: StyleConstants.textFieldDecoration.copyWith(hintText: "Confirm Password"),
                  validator: (val) => val != _password ? "Passwords do not match" : null,
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _passwordConfirmed = value;
                    });
                  },
                ),
                SizedBox(height: 20.0,),
                ButtonTheme(
                  minWidth: StyleConstants.raisedButtonWidth,
                  child: RaisedButton(
                    onPressed: () async {
                      if(_formKey.currentState.validate()) {
                        dynamic authResult = await AuthService().registerWithEmailAndPassword(_email, _password);
                        if(authResult == null) {
                          setState(() {
                            _error = "Failed, please provide a valid email";
                          });
                        }
                      }
                    },
                    child: Text("Register"),
                    textColor: StyleConstants.raisedButtonTextColor,
                  ),
                ),
                SizedBox(height: 20.0,),
                Text(_error, style: TextStyle(color: Colors.red),),
                SizedBox(height: 20.0,),
                FlatButton(
                  child: Text("Already have an account? Login"),
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
