import 'package:flutter/material.dart';

const logoTextStyle =
    TextStyle(fontSize: 30, color: Colors.black54, fontFamily: 'Lobster');

bool isMailValid(String mail) {
  return RegExp("[a-zA-Z0-9._-]+@[a-z]+\\.+[a-z]+").hasMatch(mail);
}
