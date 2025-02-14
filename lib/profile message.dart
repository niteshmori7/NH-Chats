import 'package:flutter/material.dart';
import 'package:nh_chats/home.dart';

class chmessage extends StatefulWidget {
  const chmessage({super.key});

  @override
  State<chmessage> createState() => _chmessageState();
}

class _chmessageState extends State<chmessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [
            Container(
              height: 110,
              width: 480,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 58,left: 20),
              child: InkWell(onTap: (){
                Navigator.pop(context,MaterialPageRoute(builder: (BuildContext context)=>HomeScreen()));
              }, child: Icon(Icons.arrow_back,color: Colors.white,size: 25,)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40,left: 58),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset("assets/aiimage.jpeg",height: 50,width: 50,fit: BoxFit.fill,),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 88,left: 103),
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.green
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 53,left: 135),
              child: InkWell(
                onTap: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>ctprofile()));
                },
                child: Column(
                  children: [
                    Text("Alex Carry",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
                    Padding(
                      padding: const EdgeInsets.only(right: 45),
                      child: Text("Online",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w500),),
                    )
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
