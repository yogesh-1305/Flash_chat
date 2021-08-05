import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/screens/chat_list_screen.dart';
import 'package:flash_chat/screens/loading_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/setting_screen.dart';
import 'package:flash_chat/screens/signup_screen.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // checking if user is already logged in
  // if yes --> take user to chat list screen
  // if no --> take user to welcome screen
  var _auth = FirebaseAuth.instance;
  if (_auth.currentUser != null) {
    runApp(Main(
      route: ChatListScreen.id,
    ));
  } else {
    runApp(Main(
      route: WelcomeScreen.id,
    ));
  }
}

class Main extends StatelessWidget {
  Main({@required this.route});

  final String? route;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        buttonColor: Colors.yellow,
      ),
      initialRoute: route,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SignupScreen.id: (context) => SignupScreen(),
        LoadingScreen.id: (context) => LoadingScreen(),
        ChatListScreen.id: (context) => ChatListScreen(),
        SettingScreen.id: (context) => SettingScreen(),
      },
    );
  }
}
