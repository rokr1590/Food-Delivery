import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Navigation/NavDrawer.dart';
import 'package:food_delivery/Pages/Profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller =TextEditingController();
  final address =['Parijat, Housing Estate','Address 2','Address 3'];
  String ? selectedItem='Parijat, Housing Estate';
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: scaffoldKey,
      drawer: NavDrawer(),
      body:Column(
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
                      onPressed: () => scaffoldKey.currentState?.openDrawer(),
                    ),
                  ),
                ),
                const Positioned(
                    top: 20,
                    left: 131.0,
                    child:Text("Deliver to",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),)
                ),
                Positioned(
                    top: 30,
                    left: 85.0,
                    child:DropdownButton<String>(
                        value: selectedItem,
                        items: address
                            .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item,style:TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),)
                        )).toList(),
                        onChanged: (item){setState(() {
                          selectedItem = item;
                        });}
                    )
                ),
                Positioned(
                    top: 20,
                    right: 10.0,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(user.photoURL==null?'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_yrd8qyMAeTKfxPH00Az2BqE561qnoB5Ulw&usqp=CAU':user.photoURL!)
                    ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Align(alignment:Alignment.centerLeft,child: Text("Welcome Foody!",textAlign:TextAlign.center,style: const TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Poppins',fontSize: 23),)),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: TextField(
                      onTap: (){},
                      controller: controller,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color:Colors.white)),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color:Colors.white)),
                        prefixIcon: const Icon(Icons.search,color: Colors.grey,),
                        suffixIconColor: Colors.orange,
                        suffixIcon: IconButton(icon: Icon(Icons.settings,color: Colors.orange,),onPressed: (){}),
                        hintText: 'Find your Food',

                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Align(alignment:Alignment.centerLeft,child: Text("Nearby Place",textAlign:TextAlign.left,style: const TextStyle(fontWeight:FontWeight.w600,fontFamily: 'Poppins',fontSize: 18),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: InkWell(
                            child: const Text("See All(12)",style: TextStyle(fontFamily: 'Poppins',fontSize: 14,fontWeight: FontWeight.w400,color: Colors.deepOrangeAccent)),
                            onTap: (){},
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right:12,left: 12),
                      child: ListTile(
                        visualDensity: VisualDensity(vertical: -2),
                        tileColor: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8pyImMuzDSGe0pRD3CSjS2sYeQgGQcDeSHQ&usqp=CAU",
                            fit:BoxFit.cover,
                            width:50,
                            height: 50,
                          ),
                        ),
                        title: Align(alignment:Alignment.centerLeft,child:Text("Hunger Station")),
                        subtitle: Text("Jail road,Zinda Bazar,Sylhet"),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right:12,left: 12),
                      child: ListTile(
                        tileColor: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQk5i1liGKYiNuX4TevtYzvJ0zDIhXK75XqSQ&usqp=CAU",
                            fit:BoxFit.cover,
                            width:50,
                            height: 50,
                          ),
                        ),
                        title: Align(alignment:Alignment.centerLeft,child:Text("Artisan Coffee Shop")),
                        subtitle: Text("Mira bazar,Sylhet"),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(right:12,left: 12),
                      child: ListTile(
                        tileColor: Colors.grey.shade200,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network("https://media.istockphoto.com/photos/modern-restaurant-interior-design-picture-id1211547141?k=20&m=1211547141&s=612x612&w=0&h=KiZX3NBZVCK4MlSh4BJ8hZNSJcTIMbNSSV2yusw2NmM=",
                            fit:BoxFit.cover,
                            width:50,
                            height: 50,
                          ),
                        ),
                        title: Align(alignment:Alignment.centerLeft,child:Text("KFC")),
                        subtitle: Text("Zindabazar road, Sylhet"),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Align(alignment:Alignment.centerLeft,child: Text("Popular Restaurants",textAlign:TextAlign.left,style: const TextStyle(fontWeight:FontWeight.w600,fontFamily: 'Poppins',fontSize: 18),)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: InkWell(
                            child: const Text("See All(12)",style: TextStyle(fontFamily: 'Poppins',fontSize: 14,fontWeight: FontWeight.w400,color: Colors.deepOrangeAccent)),
                            onTap: (){},
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CardtCustom('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqJIazjIu6JxrOYQQsk7_PV1QyMqpejCzu_g&usqp=CAU',"Panshi In","20 mins"),
                        CardtCustom('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqJIazjIu6JxrOYQQsk7_PV1QyMqpejCzu_g&usqp=CAU',"Food House","17 mins"),
                      ],
                    ),
                  ),
                  SizedBox(height: 90)
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
Widget CardtCustom(String imageurl,String title,String duration){
  return Container(
    height: 250,
    width: 240,
    child: Card(
      child: Column(
         children: [
           Align(alignment:Alignment.topLeft,child: ClipRRect(borderRadius:BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),child: SizedBox(height:135,width:200,child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSqJIazjIu6JxrOYQQsk7_PV1QyMqpejCzu_g&usqp=CAU")))),
           SizedBox(height: 5,),
           Align(alignment:Alignment.centerLeft,child: Text("  ${title}",style: TextStyle(fontFamily: 'Poppins',fontSize: 19))),
           Align(alignment:Alignment.centerLeft,child: Text("  ${duration}",style: TextStyle(fontFamily: 'Poppins',fontSize: 14,color: Colors.grey))),
         ],
      ),
      elevation: 8,
      shadowColor: Colors.grey,
      margin: EdgeInsets.all(20),
        shape:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white)
        )
    ),
  );
}
