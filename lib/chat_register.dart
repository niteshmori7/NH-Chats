import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'chat_login.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  bool _obscurePassword = true;

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  TextEditingController surnamecontroller = TextEditingController();

  Future<void> registerUser({
    required String name,
    required String email,
    required String pass,
    required String sname,
  }) async {
    var response = await http.post(
      Uri.parse('https://www.sparkstoideas.com/LJ/api/register'),
      body: {"Name": name, "Email": email, "Password": pass, "SurName": sname},
    );
    if (response.statusCode == 200) {
      var rawdata = jsonDecode(response.body);
      print(rawdata);
      if (rawdata['response_code'] == '1') {
        Get.snackbar(rawdata['message'], '');
      } else {
        Get.snackbar(rawdata['message'], '');
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
            Padding(
              padding: const EdgeInsets.only(top: 80),
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
            Padding(
              padding: const EdgeInsets.only(right: 250, top: 30),
              child: Text(
                "Sing Up",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 280, top: 10),
                    child: Text(
                      "Name",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 320,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(7)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: namecontroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "enter your name",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 260, top: 10),
                    child: Text(
                      "Surname",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 320,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(7)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: surnamecontroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "enter your surname",
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 280, top: 10),
                    child: Text(
                      "Email",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 320,
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(7)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: emailcontroller,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "enter your email",
                        ),
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
                        controller: passcontroller,
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
                    padding: const EdgeInsets.only(top: 50),
                    child: InkWell(
                      onTap: () {
                        if(namecontroller.text.isNotEmpty &&
                        surnamecontroller.text.isNotEmpty &&
                        emailcontroller.text.isNotEmpty &&
                        passcontroller.text.isNotEmpty){
                          registerUser(name: namecontroller.text, email: emailcontroller.text, pass: passcontroller.text, sname: surnamecontroller.text);
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
                            "Sing Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30,left: 90),
                    child: Row(
                      children: [
                        Text("Already Have an Account? ",style: TextStyle(fontSize: 17),),
                        InkWell(onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => login()));
                        }, child: Text("Login",style: TextStyle(fontSize: 17,color: Colors.blueAccent,fontWeight: FontWeight.w500),))
                      ],
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
