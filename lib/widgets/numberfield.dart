import 'package:flutter/material.dart';

Widget numberField(TextEditingController numbercontroller ){
  return TextFormField(
    controller: numbercontroller,
    keyboardType: TextInputType.numberWithOptions(signed: true,decimal: false),
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 2.0),
      ),
      hintText: 'Enter Contact Number',
      suffixStyle: TextStyle(color: Colors.black),
    ),

    validator: (name) =>
    name != null && name.isEmpty ? 'Enter a Contact Number' : null,
  );
}