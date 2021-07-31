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
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Material(
              elevation: 5.0,
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
                onPressed: () {
                  //Go to login screen.
                  Navigator.pushNamed(context, LoginScreen.id);
                },
                minWidth: 200.0,
                height: 42.0,
                child: Text(
                  'Log In',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Material(
              elevation: 0.0,
              color: Colors.black12,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
                onPressed: () {
                  //Go to login screen.
                  Navigator.pushNamed(context, SignupScreen.id);
                },
                minWidth: 200.0,
                height: 42.0,
                child: Text(
                  'Sign up',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
