import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Model/newsapi.dart';

class CardsndModules{
  static String formatDateTimestring(String date){
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime format = (dateFormat.parse(date));
    DateFormat longdate = DateFormat("MMM dd, yyyy");
    date = longdate.format(format);
    return date;
  }
  static horizontallistitem(context, size, Articles articles){
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(5),
          width: size.width/1.7,
          height: size.height/4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30)
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.network(articles.urlToImage!, fit: BoxFit.cover,)),
        ),
        Positioned(
          bottom: 65,
          left: 20,
          child: Container(
            padding: EdgeInsets.all(5),
            width: size.width/1.9,
            child: Text(articles.title!.toUpperCase(), maxLines: 2, overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),),
          ),
        ),
        Positioned(
          left: 20, bottom: 5,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Text(CardsndModules.formatDateTimestring(articles.publishedAt!),
              style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.normal, fontSize: 15),),
          ),
        ),
        Positioned(
            right: 20,
            bottom: 5,
            child: Container(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.play_circle, color: Colors.white,size: 25,)))
      ],
    );
  }

  static verticallistitem(context, size, Articles articles){
    return  Row(
      children: [
        Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(5),

                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(articles.urlToImage!,
                      height: 150, width: 100, fit: BoxFit.cover,),
                  ),
                ),
                Positioned(
                    left: 40,
                    top: 65,
                    child: Icon(Icons.play_circle, size: 20, color: Colors.white,)
                )
              ],
            )
          ],
        ),
        Column(
          children: [
            Text(articles.title!.toUpperCase(), maxLines: 2, overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Container(
                  padding:  EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text("time flies so fast".toUpperCase(), maxLines: 1, overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 10,fontWeight: FontWeight.bold),
                  ),
                ),
                Text(CardsndModules.formatDateTimestring(articles.publishedAt!), maxLines: 2, overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black, fontSize: 13,fontWeight: FontWeight.normal),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}