
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Auth/SignIn.dart';
import 'package:food_delivery/Auth/SignIngoogle.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_delivery/Auth/google_signin.dart';
import 'package:food_delivery/Navigation/BottomNavigationBar.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(ChangeNotifierProvider(create: (context)=>GoogleSignInProvider(),
      child: MaterialApp(
        home:GoogleSignIn(),
        debugShowCheckedModeBanner: false,)));
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final sliderImages =[
    'assets/gs1.png',
    'assets/gs2.png',
    'assets/gs3.png'
  ];
  final Btags=[
    'Quick Delivery',
  ];
  final taglines=[
    'Loved the class! Such beautiful land and\ncollective impact infrastructure social\n entrepreneur.'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:50.0),
        child: Container(
          child: Column(
            children: [
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0,right: 10.0),
                        child: Container(margin:EdgeInsets.only(left: 20,right: 10),child: CardType(sliderImages[0], Btags[0],taglines[0]),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0,right: 2.0),
                        child: Container(margin:EdgeInsets.only(left: 10,right: 10),child: CardType(sliderImages[1], Btags[0],taglines[0]),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2.0,right: 10.0),
                        child: Container(margin:EdgeInsets.only(left: 2,right: 10),child: CardType(sliderImages[2], Btags[0],taglines[0]),),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(height:60,width:350,child: TextButton(
                onPressed: (){
                  final provider =Provider.of<GoogleSignInProvider>(context,listen: false);
                  provider.googleLogin();
                },
                child: const Text('SIGN IN WITH GOOGLE',style: TextStyle(color: Colors.white,fontFamily: 'Poppins',fontWeight: FontWeight.w600,fontSize: 14)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff4167B0)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                  )
              )),)),
              const SizedBox(height: 20,),
              SizedBox(height:60,width:350,child: TextButton(onPressed: (){
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Scaffold(
                      extendBody: true,
                      resizeToAvoidBottomInset: false,
                      body:StreamBuilder<User?>(
                          stream: FirebaseAuth.instance.authStateChanges(),
                        builder: (context,snapshot){
                            if(snapshot.connectionState==ConnectionState.waiting) {
                              return const Center(child:CircularProgressIndicator());
                            } else if(snapshot.hasError) {
                              return const Center(child: Text('Something went wrong!'));
                            } else if(snapshot.hasData) {
                                return NavBottomBar();
                              } else {
                              return Signin();
                              }

                        },
                      )
                  )), (route) => false);
                },
                child: const Text('SIGN IN',style: TextStyle(color: Colors.white,fontFamily: 'Poppins',fontWeight: FontWeight.w600,fontSize: 14)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFE724C)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    )
                    )),)),
              const SizedBox(height: 15,),
              Row(mainAxisAlignment:MainAxisAlignment.center,children: const [Text("or Start to ",style: TextStyle(fontFamily:'Poppins',fontSize: 14,fontWeight: FontWeight.w400),),
                Text("Search Now",style: TextStyle(color: Color(0xffFE724C),fontFamily:'Poppins',fontSize: 14,fontWeight: FontWeight.w400),),],),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String sliderImage, int index) {
    return Container(
      margin:EdgeInsets.symmetric(horizontal: 12),
      color: Colors.white,
      child: Image.asset(sliderImage),
    );
  }

  Widget CardType(String sliderImage,String Btag,tagline)
  {
    return Column(
      children: [
        Center(child: Image.asset(sliderImage,height: 350,)),
        const SizedBox(height: 12),
        Text(
           Btag,
           style: const TextStyle(
           fontFamily: 'Poppins',
           fontWeight: FontWeight.w600,
           fontSize: 20
            ),
          ),
        Text(
          tagline,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
          style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: 14,
          ),
        ),
       ]);
  }

}



