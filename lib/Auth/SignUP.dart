
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:food_delivery/Auth/SignIn.dart';

import '../Navigation/BottomNavigationBar.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController controller1 =TextEditingController();
  final TextEditingController controller2 =TextEditingController();
  final TextEditingController controller3 =TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool _value =true;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            margin: const EdgeInsets.only(top: 70,left: 20,right: 15),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("SIGN UP",textDirection:TextDirection.ltr,/*textAlign:TextAlign.left*/style: TextStyle(color: Colors.black,fontFamily: 'Poppins',fontWeight: FontWeight.w600,fontSize: 26)),
                  const Text("Complete this step for best adjustment",/*textAlign:TextAlign.left*/style: TextStyle(color: Colors.grey,fontFamily: 'Poppins',fontWeight: FontWeight.normal,fontSize: 14,fontStyle:FontStyle.normal)),
                  const SizedBox(height: 50),
                  const Text("Your Email",textAlign:TextAlign.left,style: TextStyle(color:Colors.grey,fontFamily: 'Poppins',fontWeight: FontWeight.w400,fontSize: 14)),
                  const SizedBox(height: 10,),
                  TextFormField(
                    textAlign: TextAlign.left,
                    controller: controller1,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email)=>
                    email!=null && !EmailValidator.validate(email)
                        ?'Enter a valid email'
                        :null,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: TextStyle(fontSize: 13),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  const Text("Your Password",textAlign:TextAlign.left,style: TextStyle(color:Colors.grey,fontFamily: 'Poppins',fontWeight: FontWeight.w400,fontSize: 14)),
                  const SizedBox(height: 10,),
                  TextFormField(
                    textAlign: TextAlign.left,
                    controller: controller2,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value)=>value!=null && value.length<6
                    ?'Enter min 6 charachters'
                    :null,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(fontSize: 13),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  const Text("Your Mobile number",textAlign:TextAlign.left,style: TextStyle(color:Colors.grey,fontFamily: 'Poppins',fontWeight: FontWeight.w400,fontSize: 14)),
                  const SizedBox(height: 10,),
                  TextField(
                    textAlign: TextAlign.left,
                    controller: controller3,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Mobile Number',
                      hintStyle: TextStyle(fontSize: 13),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FlutterSwitch(
                          value: _value,
                          width: 40.0,
                          height: 20.0,
                          toggleSize: 5.0,
                          borderRadius: 30.0,
                          padding: 8.0,
                          activeColor: Colors.deepOrangeAccent,
                          onToggle: (val){
                            setState(() {
                              _value = val;
                            });
                          }
                      ),
                      SizedBox(width:5),
                      Text("I have accepted all terms and conditions.",style: TextStyle(fontSize: 11,fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: Colors.grey),)
                    ],
                  ),
                  const SizedBox(height: 25,),
                  SizedBox(height:60,width:350,child: TextButton(onPressed: (){
                    signUp();
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
                              return Signup();
                            }
                          },
                        ),

                    )
                    ), (route) => false);
                  },
                    child: const Text('SIGN UP',style: TextStyle(color: Colors.white,fontFamily: 'Poppins',fontWeight: FontWeight.w600,fontSize: 14)),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFE724C)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        )
                        )),)),
                  const SizedBox(height: 30,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("I already have an account? ",style: TextStyle(fontFamily: 'Poppins',fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey),),
                      InkWell(
                        child: Text("Sign In",style: TextStyle(fontFamily: 'Poppins',fontSize: 14,fontWeight: FontWeight.w400,color: Colors.deepOrangeAccent)),
                        onTap: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Signin()), (route) => false);},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future signUp() async{
    final isValid =formKey.currentState!.validate();
    if(!isValid) return;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: controller1.text.trim(),
          password: controller2.text.trim()
      );
    } on FirebaseAuthException catch(e)
    { /*
      if(mounted) {
        SnackBar snackBar = SnackBar(
            content: Text("Invalid Operation (Try Sign in)"));
        ScaffoldMessenger.of(context).showSnackBar((snackBar));
      }*/
      print(e);

    }
  }


}
