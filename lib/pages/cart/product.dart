import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class product extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return productPageState();
  }
}

class productPageState extends State<product> {
  late final List<Widget> items;

  getItems() {
    items = [
      // Image 1
      Container(
        child: Center(
          child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpzVDVvQMexho4F1TEfmkltXilHE_CfFS_VA&usqp=CAU"),
        ),
      ),
      // Image 2
      Container(
        child: Center(
          child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKG4_xRvGyNkruHt8pAbGnb14VyUEZlLP13A&usqp=CAU"),
        ),
      ),
    ];
  }

  int _current = 0;

  @override
  void initState() {
    super.initState();
    getItems();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwuUQ5gi3ImB2i1YRO7jDuS6YoB3uHEYRV5g&usqp=CAU",
                        height: 80,
                        width: 150,
                        fit: BoxFit.fitWidth,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.deepOrange,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Product detail",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size.height * 0.835,
            width: size.width,
            child: Stack(
              children: [
                // Slider
                Container(
                  width: size.width,
                  height: size.height / 1.72,
                  color: Colors.grey,
                  child: CarouselSlider(
                    items: items,
                    options: CarouselOptions(
                      height: 400,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                      const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                // Container
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: size.height / 3,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: Color(0xff404042),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "OPC Premium",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    "Rs.1060.00 per bag",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    "Minimum bags: 450",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Center(
                                          child: Text(
                                            " - ",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: Center(
                                          child: Text(
                                            "41",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.circular(50),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Center(
                                          child: Text(
                                            " + ",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    width: 50,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.orange,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Bags",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: size.width,
                            child: const Text(
                              "Generated Lorem IpsumLorem ipsum dolor sit amet, "
                                  "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut "
                                  "labore et dolore magna aliqua. Semper quis lectus nulla at volutpat diam ut. "
                                  "Nibh ipsum consequat nisl vel pretium",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 60,
                          width: size.width,
                          decoration: const BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Add to Cart",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
