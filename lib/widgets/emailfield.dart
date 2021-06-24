import 'package:flutter/material.dart';

Widget emailField(TextEditingController emailcontroller ){
  return TextFormField(
    controller: emailcontroller,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2.0),
      ),
      hintText: 'Enter Email ID',
      suffixStyle: TextStyle(color: Colors.black),
    ),

    validator: (name) =>
    name != null && name.isEmpty ? 'Enter Email ID' : null,
  );
}