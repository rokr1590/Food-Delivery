import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Pages/Home.dart';
import 'package:food_delivery/Pages/Profile.dart';

class NavBottomBar extends StatefulWidget {
  @override
  _NavBottomBarState createState() => _NavBottomBarState();
}

class _NavBottomBarState extends State<NavBottomBar> {
  int index=0;
  final screens =[
    HomePage(),
    Icon(Icons.search),
    Icon(Icons.shopping_cart),
    Icon(Icons.text_snippet),
    UserProfile(),
  ];
  final items=<Widget>[
    Icon(Icons.home),
    Icon(Icons.search),
    Icon(Icons.shopping_cart),
    Icon(Icons.text_snippet),
    Icon(Icons.person)
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: screens[index],
        bottomNavigationBar: CurvedNavigationBar(
          color: const Color.fromRGBO(246, 181, 120, 1),
          backgroundColor: Colors.transparent,
          height: 60,
          index: index,
          items: items,
          onTap: (index) {
            setState(() {
              this.index = index;
            });
          },
        ),
      ),
    );
  }
}

