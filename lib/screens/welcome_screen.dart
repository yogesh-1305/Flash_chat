import 'package:flash_chat/round_button/round_button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/signup_screen.dart';
import 'package:flash_chat/utilities/constants.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Hero(
            tag: 'logo',
            child: Image.asset(
              'images/logo.png',
              height: 200,
            ),
          ),
          Text(
            'Flash Chat',
            textAlign: TextAlign.center,
            style: logoTextStyle,
          ),
          RoundButton(
            text: 'Log In',
            color: Colors.yellow,
            elevation: 5,
            function: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
          ),
          RoundButton(
            text: 'Sign Up',
            color: Colors.black12,
            elevation: 0,
            function: () {
              Navigator.pushNamed(context, SignupScreen.id);
            },
          ),
        ],
      ),
    );
  }
}
