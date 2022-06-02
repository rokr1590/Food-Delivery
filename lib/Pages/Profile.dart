import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Navigation/NavDrawer.dart';
import 'package:provider/provider.dart';

import '../Auth/google_signin.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    var scaffoldKey1 = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey1,
      drawer: NavDrawer(),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           SizedBox(
            height: 100,
            width: 360,
            /*color: Colors.blue,*/
             child: Stack(
                children: [
                  Center(
                    child: Column(
                    children: [],
                  )),
                  Positioned(
                    left: 10,
                    top: 20,
                    child: Container(
                      decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                        color:Colors.grey.shade100
                        )
                      ],
                      borderRadius:BorderRadius.all(Radius.circular(15)),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {scaffoldKey1.currentState?.openDrawer();}
                      ),
                    ),
                   ),
                  const Positioned(
                    top: 30,
                    left: 131.0,
                    child:Text("Logged in",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),)
                  ),
                  Positioned(
                   top: 20,
                   right: 10.0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfile()));
                      },
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(user.photoURL==null?'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_yrd8qyMAeTKfxPH00Az2BqE561qnoB5Ulw&usqp=CAU':user.photoURL!)
                      )),
                  )
          ],
        ),
      ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user.photoURL==null?'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_yrd8qyMAeTKfxPH00Az2BqE561qnoB5Ulw&usqp=CAU':user.photoURL!),
              ),
              SizedBox(height :8),
              Text(
                user.displayName!,
                style : TextStyle(color:Colors.black,fontSize :16),
              ),
              SizedBox(height :8),
              Text(
                user.email!,
                style : TextStyle(color:Colors.black,fontSize :16),
              ),
              SizedBox(height: 90,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent.shade100,
                    onPrimary: Color.fromRGBO(248, 96, 96, 1),
                    minimumSize: Size(300, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
                ),
                onPressed: (){
                  FirebaseAuth.instance.signOut();
                  /*final provider =Provider.of<GoogleSignInProvider>(context,listen: false);
                  provider.logout();*/
                }, child: Text("SIGN OUT",style: TextStyle(color: Colors.white,fontSize: 20),),

              ),
              ])
          ],
    )));
  }
}
