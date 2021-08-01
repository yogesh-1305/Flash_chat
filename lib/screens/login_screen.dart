import 'package:flash_chat/round_button/round_button.dart';
import 'package:flash_chat/utilities/constants.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email = '';
  var password = '';
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
            'Login',
            textAlign: TextAlign.center,
            style: logoTextStyle,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {
                //Do something with the user input.
                email = value;
              },
              decoration: inputFieldDecoration.copyWith(
                hintText: 'Enter email...',
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextField(
              textAlign: TextAlign.center,
              obscureText: passwordHidden,
              onChanged: (value) {
                //Do something with the user input.
                password = value;
              },
              decoration: inputFieldDecoration.copyWith(
                hintText: 'enter password...',
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
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          RoundButton(
            text: "Log In",
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
                    content: Text('Please Enter a password!'),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Logging you in...'),
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
