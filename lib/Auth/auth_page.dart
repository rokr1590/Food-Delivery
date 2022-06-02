import 'package:flutter/material.dart';
import 'package:food_delivery/Auth/SignUP.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Signup();
  }
}
