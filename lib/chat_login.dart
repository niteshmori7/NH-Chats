import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import 'chat_register.dart';
import 'home.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool _obscurePassword = true; // To toggle password visibility

  loginapi({required String email,required String pass})async{
    var respo = await http.post(Uri.parse("https://www.sparkstoideas.com/LJ/api/login"),body: {
      "Email": email, "Password": pass
    });
    if(respo.statusCode == 200){
      var rawdata = jsonDecode(respo.body);
      print(rawdata);
      if (rawdata['response_code'] ==
          '1') {
        Get.snackbar(
          rawdata['message'],
          "",
        );
        Get.to(HomeScreen());
      } else {
        Get.snackbar(
          rawdata['message'],
          "",
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Text(emailcontroller.text),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Center(
                child: Icon(
                  Icons.wechat,
                  color: Colors.blueAccent,
                  size: 100,
                ),
              ),
            ),
            Text(
              "Chatting",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
            ),
            // Text(emailcontroller.text),
            Padding(
              padding: const EdgeInsets.only(right: 270, top: 40),
              child: Text(
                "Sing In",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 280, top: 30, bottom: 5),
              child: Text(
                "Email",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextFormField(
                      controller: emailcontroller,
                      decoration: InputDecoration(border: InputBorder.none,hintText: "enter your email"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 253, bottom: 5),
                  child: Text(
                    "Password",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  height: 50,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,top: 5),
                    child: TextFormField(
                      controller: passwordcontroller,
                      obscureText: _obscurePassword, // Toggle password visibility
                      decoration: InputDecoration(
                        hintText: "enter your password",
                        border: InputBorder.none,
                        suffixIcon: IconButton(
                          icon: Icon(
                            color: Colors.black,
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword; // Toggle state
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15,left: 35),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 17),
                        child: Icon(Icons.check_box,color: Colors.blueAccent,),
                      ),
                      Text("Remember Password",style: TextStyle(),),
                      Padding(
                        padding: const EdgeInsets.only(left: 45),
                        child: Text("Forgot Password?",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w500),),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 80,),
                InkWell(
                  onTap: (){
                    if(emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty){
                      loginapi(email: emailcontroller.text, pass: passwordcontroller.text);
                    }
                    else{
                      Get.snackbar("Error", "fill can not to be empty");
                    }
                  },
                  child: Container(
                    height: 45,
                    width: 320,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50,left: 90),
                  child: Row(
                    children: [
                      Text("Don't Have an Account? ",style: TextStyle(fontSize: 17),),
                      InkWell(onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>register()));
                      }, child: Text("SignUp",style: TextStyle(fontSize: 17,color: Colors.blueAccent,fontWeight: FontWeight.w500),))
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
