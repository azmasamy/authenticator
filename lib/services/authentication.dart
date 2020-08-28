import 'package:authenticator/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();


  // TODO: Ask if it should be in the user class
  User _userFromFirebaseUser(FirebaseUser firebaseUser) {
    return firebaseUser != null
        ? User(firebaseUser.email, firebaseUser.uid)
        : null;
  }

  // return user stream when auth state changes
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // Register with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = result.user;
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with Google Account
  Future signInWithGoogleAccount() async {
    try {

      // Trigger the sign-in flow
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a credential from the access token
      final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      // to sign in via Firebase Authentication
      AuthResult result = await _auth.signInWithCredential(credential);

      // convert firebaseuser to user
      FirebaseUser firebaseUser = result.user;

      // return user stream
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with Facebook in Account
  Future signInWithFacebookAccount() async {
    try {
      // Trigger the sign-in flow
      final LoginResult facebookAuth = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final AuthCredential facebookAuthCredential =
          FacebookAuthProvider.getCredential(
              accessToken: facebookAuth.accessToken.token);

      // Once signed in, return the UserCredential
      final AuthResult result =
          await _auth.signInWithCredential(facebookAuthCredential);

      // convert firebaseuser to user
      FirebaseUser firebaseUser = result.user;

      // return user stream
      return _userFromFirebaseUser(firebaseUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // TODO: Sign in with Apple Account

  // TODO: Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
