import 'package:flutter/material.dart';

const logoTextStyle =
    TextStyle(fontSize: 30, color: Colors.black54, fontFamily: 'Lobster');

bool isMailValid(String mail) {
  return RegExp("[a-zA-Z0-9._-]+@[a-z]+\\.+[a-z]+").hasMatch(mail);
}

const inputFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
