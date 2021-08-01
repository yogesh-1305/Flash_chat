import 'package:flash_chat/round_button/round_button.dart';
import 'package:flash_chat/utilities/constants.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  static const id = 'signup_screen';

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var email = '';
  var password = '';
  var reEnteredPassword = '';
  var passwordHidden = true;

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
              height: 60,
            ),
          ),
          Text(
            'SignUp',
            textAlign: TextAlign.center,
            style: logoTextStyle,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                textInputAction: TextInputAction.next,
                decoration: inputFieldDecoration.copyWith(
                    hintText: 'Enter your email...')),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
              obscureText: passwordHidden,
              onChanged: (value) {
                //Do something with the user input.
                password = value;
              },
              decoration: inputFieldDecoration.copyWith(
                hintText: 'set a password...',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      passwordHidden
                          ? passwordHidden = false
                          : passwordHidden = true;
                    });
                  },
                  icon: Icon(Icons.add),
                ),
              ),
              textInputAction: TextInputAction.next,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
              onChanged: (value) {
                //Do something with the user input.
                reEnteredPassword = value;
              },
              textInputAction: TextInputAction.next,
              decoration: inputFieldDecoration.copyWith(
                  hintText: 're-enter password...'),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          RoundButton(
            text: "Sign Up",
            color: Colors.yellow,
            elevation: 5,
            function: () {
              // validating email address
              if (!isMailValid(email)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please Enter a Valid Email!'),
                  ),
                );
              } else if (password.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Please set a password'),
                  ),
                );
              } else if (password.isNotEmpty && password != reEnteredPassword) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Passwords did not match'),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Signing up...'),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
