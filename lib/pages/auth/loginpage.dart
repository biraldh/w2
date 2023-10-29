//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:w2/pages/cart/product.dart';

import '../../api/getapi.dart';
import '../detail/newsui.dart';

class loginpage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return loginpagestate();
  }


}
class loginpagestate extends State<loginpage>{

  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  bool isloading = false;

  readfromstorage()async {
    //get
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.get('email');
    var password = prefs.get('password');
    if(email==null){
      //stay idle
    }
    else{
      emailcontroller.text = email.toString();
      passwordcontroller.text =password.toString();
      //loading
      setState(() {
        isloading = true;
      });
      //loginsuccess
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => product()),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetApi.getnewsdata();
  }
  
  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //icon or image
              Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwuUQ5gi3ImB2i1YRO7jDuS6YoB3uHEYRV5g&usqp=CAU",
                height: 100,
                width: 200,
                fit: BoxFit.fitWidth,),
              //const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Color(0xfffbaf43),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("SIGN IN",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),),
                          ),
                        ),

                        Container(
                          //margin: EdgeInsets.only(bottom: 15),
                          height: 40,
                          width: size.width/1.7,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: TextField(
                                controller: emailcontroller,
                                decoration: InputDecoration(
                                  border: InputBorder.none, // Remove the bottom line
                                ),
                              ),
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(top:15, bottom: 15),
                          height: 40,
                          width: size.width/1.7,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: TextField(
                                controller: passwordcontroller,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                                obscureText: true,),
                            ),
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                if(emailcontroller.text.contains("@")
                                    && passwordcontroller.text.isNotEmpty){
                                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString('email', emailcontroller.text);
                                  prefs.setString('password', passwordcontroller.text);
                                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => NewsUi()),
                                );
                              },
                              child: isloading==true?Container(child: CircularProgressIndicator(),):Container(
                                height: 30,
                                width: 100,
                                decoration: BoxDecoration(color: Colors.orange,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(child: Text("LOGIN", style: TextStyle(color: Colors.white,fontSize: 14, fontWeight: FontWeight.bold),)),
                              ),
                            ),
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: const Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("SIGN UP", style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black
                                      ),
                                    ),
                                    //SizedBox(width: 100,),
                                    /*
                                    Row(
                                  children: [
                                    Text("Forget Password?",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),),
                                  ],
                                )
                                */
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}