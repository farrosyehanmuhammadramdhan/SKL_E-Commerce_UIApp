// ignore_for_file: prefer_const_constructors

import 'package:e_commerce_ui/pages/CartPage.dart';
import 'package:e_commerce_ui/pages/ChatPage.dart';
import 'package:e_commerce_ui/pages/Homepage.dart';
import 'package:e_commerce_ui/pages/ItemsPage.dart';
import 'package:e_commerce_ui/pages/LoginPage.dart';
import 'package:e_commerce_ui/pages/MessageListPage.dart';
import 'package:e_commerce_ui/pages/RegisterPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routes: {
        "/": (context) => HomePage(),
        "loginPage": (context) => LoginPage(),
        "registerPage": (context) => RegisterPage(),
        "cartPage": (context) => CartPage(),
        "chatPage": (context) => ChatPage(),
        "itemPage": (context) => ItemsPage(),
        "messageListPage": (context) => MessageListPage(),
      },
    );
  }
}
