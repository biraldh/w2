import 'package:flutter/material.dart';
import 'package:w2/api/getapi.dart';
import 'package:w2/pages/auth/loginpage.dart';
import 'package:w2/pages/detail/newsui.dart';

import 'pages/cart/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: NewsUi(),
    );
  }
}

class firstclass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return firstclassState();
  }
}

class firstclassState extends State<firstclass> {
  textcard(String txt) {
    return Container(
      height: 40,
      width: 100,
      margin: const EdgeInsets.only(left: 8, right: 8),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(20)),
      child: Center(
          child: Text(
            txt,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }

  horizontalCards(){
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //stack //image // icon
          Stack(
            children: [
              //image
              Container(
                height: size.height/4,
                width: size.width/2.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30)
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  child: Image.network(
                      "https://png.pngtree.com/png-clipart/20210522/ourlarge/pngtree-express-delivery-box-carton-superposition-png-image_3335832.jpg",
                      fit: BoxFit.cover),
                ),
              ),
              //icon
              Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(color:Colors.grey,
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(Icons.heart_broken_sharp,
                        color: Colors.black, size: 20,)))

            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Food Home Delivery", style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,
                    color: Colors.black),),
                Row(
                  children: [
                    const Icon(Icons.star_border, size: 15,),
                    const Icon(Icons.star_border, size: 15,),
                    const Icon(Icons.star_border, size: 15,),
                    const Icon(Icons.star_border, size: 15,),
                    const Icon(Icons.star_border, size: 15,),
                  ],
                ),
                Text("Rs 500/-",
                  style: TextStyle(color: Colors.black,
                      fontSize: 18, fontWeight: FontWeight.bold),)
              ],
            ),
          )

          //col //text //star //rs
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
        color: Colors.black12,
        child: Column(
        children: [
        const SizedBox(height: 20),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Container(
    height: 60,
    width: size.width / 1.1,
    decoration: BoxDecoration(
    color: Colors.grey,
    borderRadius: BorderRadius.circular(50)),
    child: Row(
    children: const [
    Padding(
    padding: EdgeInsets.only(left: 15.0, right: 15.0),
    child: Icon(
    Icons.search,
    color: Colors.white,
    size: 18,
    ),
    ),
    Text(
    "Search Here...",
    style: TextStyle(color: Colors.white),
    )
    ],
    ),
    )
    ],
    ),
    const SizedBox(height: 20),
    SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Container(
    child: Row(
    children: [
    textcard("lab1"),
    textcard("lab2"),
    textcard("lab3"),
    textcard("lab1"),
    textcard("lab2"),
    textcard("lab3")
    ],
    ),
    ),
    ),
    const SizedBox(
    height: 20,
    )
    ],
    ),
    ),
    const SizedBox(
    height: 25,
    ),
    Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const Text(
    "Food Home Delivery",
    style: TextStyle(
    color: Colors.black,
    fontSize: 20,
    fontWeight: FontWeight.bold),
    ),
    Row(
    children: [
    const Icon(Icons.star_border),
    const Icon(Icons.star_border),
    const Icon(Icons.star_border),
    const Icon(Icons.star_border),
    const Icon(Icons.star_border),
    ],
    )
    ],
    ),
    const Text(
    "RS.500/-",
    style: TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 35),
    )
    ],
    ),
    ),
    const SizedBox(
    height: 15,
    ),
    Padding(
    padding: const EdgeInsets.only(left: 15.0),
    child: const Text(
    "Details",
    style: TextStyle(
    color: Colors.black,
    fontSize: 18,
    fontWeight: FontWeight.bold),
    ),
    ),
    const SizedBox(
    height: 15,
    ),
    Padding(
    padding: const EdgeInsets.only(left: 15.0),
    child: const
    Text(
      "Generated Lorem IpsumLorem ipsum dolor sit amet, "
          "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut "
          "labore et dolore magna aliqua. Semper quis lectus nulla at volutpat diam ut. "
          "Nibh ipsum consequat nisl vel pretium",
      style: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.normal),
    ),
    ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: const Text(
              "Location",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: const Text(
              "Kathmandu, Nepal",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: const Text(
              "Phone",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: const Text(
              "9849950328",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: const Text(
              "Website",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: const Text(
              "https://snmn.com",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          //horizontal cards
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 15, ),
              child: Row(
                children: [
                  horizontalCards(),
                  horizontalCards(),
                  horizontalCards(),
                  horizontalCards(),
                  horizontalCards(),
                  horizontalCards(),
                  horizontalCards(),
                  horizontalCards(),
                  horizontalCards(),

                  const SizedBox(height: 15,)
                ],
              ),
            ),
          )
        ],
        ),
        ),
    );
  }
}