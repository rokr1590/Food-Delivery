import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Auth/SignIn.dart';
import 'package:food_delivery/Navigation/BottomNavigationBar.dart';
import 'package:food_delivery/main.dart';

class GoogleSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if(snapshot.hasData) {
              return NavBottomBar();
            } else if(snapshot.hasError) {
              return Center(child: Text('Something Went Wrong!'));
            }
            else {
              return OnboardingScreen();
            }
          }
      ),
    );
  }
}
