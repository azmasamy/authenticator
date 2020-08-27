import 'package:flutter/material.dart';

class StyleConstants {
  static const textFieldDecoration = InputDecoration(
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlue, width: 2.0)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlue, width: 2.0)));

  static const raisedButtonTextColor = Colors.white;
  static const double raisedButtonWidth = 200;
}

