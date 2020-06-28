import 'package:flutter/material.dart';
import 'package:samplehitch/screens/login.dart';
import 'package:samplehitch/screens/start_page.dart';
import 'package:samplehitch/screens/network_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        StartPage.id:(context)=>StartPage(),
        NetworkPage.id:(context)=>NetworkPage(),
      },
    );
  }
}
