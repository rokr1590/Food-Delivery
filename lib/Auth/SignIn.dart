import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'SignUP.dart';


class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController controller1 =TextEditingController();
  final TextEditingController controller2 =TextEditingController();
  //final TextEditingController controller3 =TextEditingController();
  bool _value =true;
  @override
  void dispose() {
    // TODO: implement dispose
    controller1.dispose();
    controller2.dispose();
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("SIGN IN",textDirection:TextDirection.ltr,/*textAlign:TextAlign.left*/style: TextStyle(color: Colors.black,fontFamily: 'Poppins',fontWeight: FontWeight.w600,fontSize: 26)),
                const Text("Complete this step for best adjustment",/*textAlign:TextAlign.left*/style: TextStyle(color: Colors.grey,fontFamily: 'Poppins',fontWeight: FontWeight.normal,fontSize: 14,fontStyle:FontStyle.normal)),
                const SizedBox(height: 50),
                const Text("Your Email",textAlign:TextAlign.left,style: TextStyle(color:Colors.grey,fontFamily: 'Poppins',fontWeight: FontWeight.w400,fontSize: 14)),
                const SizedBox(height: 10,),
                TextField(
                  textAlign: TextAlign.left,
                  controller: controller1,
                  keyboardType: TextInputType.text,
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
                TextField(
                  textAlign: TextAlign.left,
                  controller: controller2,
                  obscureText: true,
                  keyboardType: TextInputType.text,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                        const SizedBox(width:5),
                        const Text("Remember me.",style: TextStyle(fontSize: 12,fontFamily: 'Poppins',fontWeight: FontWeight.w400,color: Colors.grey),),
                      ],
                    ),
                    InkWell(
                      child: Text("Forgot Password?",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 11,fontFamily: 'Poppins'),),
                      onTap: (){},
                    )
                  ],
                ),
                const SizedBox(height: 25,),
                SizedBox(height:60,width:350,child: TextButton(onPressed: signIn,
                  //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>NavBottomBar()), (route) => false);
                  child: const Text('SIGN IN',style: TextStyle(color: Colors.white,fontFamily: 'Poppins',fontWeight: FontWeight.w600,fontSize: 14)),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xffFE724C)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      )
                      )),)),
                const SizedBox(height: 60,),
               /* SizedBox(height:60,width:350,child: TextButton(
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
                      )),)),*/
                const SizedBox(height: 30,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("I don't have an acoount? ",style: TextStyle(fontFamily: 'Poppins',fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey),),
                    InkWell(
                      child: Text("Sign Up",style: TextStyle(fontFamily: 'Poppins',fontSize: 14,fontWeight: FontWeight.w400,color: Colors.deepOrangeAccent)),
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup())); },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: controller1.text.trim(),
        password: controller2.text.trim(),
      );
    } on FirebaseAuthException catch(e) {
      print(e);
    }
  }
}
