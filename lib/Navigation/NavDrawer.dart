import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Auth/google_signin.dart';
class NavDrawer extends StatefulWidget {
  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:  [
          const DrawerHeader(
              child: Text('Side Menu',style: TextStyle(color: Colors.white,fontSize: 25)),
              decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/cover.jpg')
                )
              ),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text("My Orders"),
            onTap: (){},
          ),
          Divider(color: Colors.black,thickness: 2,endIndent: 20,indent: 20),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text("Feedback"),
            onTap: (){},
          ),
          Divider(color: Colors.black,thickness: 2,endIndent: 20,indent: 20),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: (){
              FirebaseAuth.instance.signOut();
              /*final provider =Provider.of<GoogleSignInProvider>(context,listen: false);
              provider.logout();*/
            }
          ),
          Divider(color: Colors.black,thickness: 2,endIndent: 20,indent: 20,),

        ],
      ),
    );
  }
}
