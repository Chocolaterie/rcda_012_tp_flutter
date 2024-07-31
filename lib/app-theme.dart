import 'package:flutter/material.dart';

class AppTheme {

  static var appBarTheme = AppBarTheme(
      color: Color(0xFF3e60ac),
      titleTextStyle: TextStyle(color: Colors.white, fontSize: 22.0));

  static InputDecoration fieldDecoration(String labelText, String hintText){
    return InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Color(0x55FFFFFF),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none
        )
    );
  }

  /**
   * Fonction pour automatiquement encapsuler n'importe widget donc composant dans un paddign vertical 10
   */
  static Widget wrapFormPadding(Widget widget){
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: widget,
    );
  }
}
