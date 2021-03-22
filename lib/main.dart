import 'package:flutter/material.dart';
import 'package:otaku/pages/introductionpage.dart';
import 'pages/selectionpage.dart';
import 'pages/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Color.fromRGBO(19, 11, 32, 1),
      ),
      debugShowCheckedModeBanner: false,
      home: IntroductionPage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseUser>(
      future: FirebaseAuth.instance.currentUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          FirebaseUser user = snapshot.data;
          return Selectionpage(uid: user.uid);
        } else {
          return LoginPage();
        }
      },
    );
  }
}
