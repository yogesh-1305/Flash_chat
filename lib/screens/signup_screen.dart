import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/round_button/round_button.dart';
import 'package:flash_chat/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'chat_list_screen.dart';

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
  final _auth = FirebaseAuth.instance;

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
                decoration: inputFieldDecoration.copyWith(labelText: 'Email')),
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
                labelText: 'Password',
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
              decoration:
                  inputFieldDecoration.copyWith(labelText: 'Re-enter Password'),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          RoundButton(
            text: "Sign Up",
            color: Colors.yellow,
            elevation: 5,
            function: () async {
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
                try {
                  await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  Navigator.pushNamedAndRemoveUntil(
                      context, ChatListScreen.id, (r) => false);
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Password is too weak, make it strong.'),
                      ),
                    );
                  } else if (e.code == 'email-already-in-use') {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('This Email address already exists.'),
                      ),
                    );
                  }
                } catch (e) {
                  throw e;
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
