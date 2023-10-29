import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:w2/api/getapi.dart';
import 'package:w2/modules/cardsandmodules.dart';

import '../../Model/newsapi.dart';

class NewsUi extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewsUIState();
  }

}
class NewsUIState extends State<NewsUi>{

  late Future<Newsapi?>? _futurehorizontallist;
  late Future<Newsapi?>? _futureverticallist;




  apicallh(){
    _futurehorizontallist = GetApi.getnewsdata();
  }
  apicallv(){
    _futureverticallist = GetApi.getnewsdata();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    apicallh();
    apicallv();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            FutureBuilder<Newsapi?>(
                future: _futurehorizontallist,
              builder: (BuildContext context, AsyncSnapshot<Newsapi?> snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                      return Container(child: Center(child: Text("no internet or server issue")),);

                    case ConnectionState.waiting:
                      return Container(
                        height: 50,
                        width: 30,
                        child: CircularProgressIndicator(),);

                    case ConnectionState.done:
                      if(snapshot.data == null || !snapshot.hasData){
                        return Text(" No Data");
                      }else{
                        var newshdata = snapshot.data;
                        return Container(
                            width: size.width,
                            height: size.height/4.1,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.all(8),
                              itemCount: newshdata!.articles!.length,
                              itemBuilder: (BuildContext context, int index) {
                              return CardsndModules.horizontallistitem(context, size, newshdata!.articles![index]);
                              }
                          ),
                        );
                      }

                    default:
                      return Container();//error page

                  }
              },
            ),

            FutureBuilder<Newsapi?>(
              future: _futureverticallist,
              builder: (BuildContext context, AsyncSnapshot<Newsapi?> snapshot){
                switch(snapshot.connectionState){
                  case ConnectionState.none:
                    return Container(child: Center(child: Text("no internet or server issue")),);

                  case ConnectionState.waiting:
                    return Container(
                      height: 50,
                      width: 30,
                      child: CircularProgressIndicator(),);

                  case ConnectionState.done:
                    if(snapshot.data == null || !snapshot.hasData){
                      return Text(" No Data");
                    }else{
                      var newshdata = snapshot.data;
                      return Container(
                        width: size.width,
                        height: size.height/1.8,
                        child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        padding: const EdgeInsets.all(8),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          return CardsndModules.verticallistitem(context, size, newshdata!.articles![index]);
                          }
                        ),
                      );
                    }

                  default:
                    return Container();//error page

                }
              },
            ),

            //horizontal list
            //stack//image//title//date//icon


            //vertical list
            //row
            //col//col
            //1st col
            //stack //icon
            //2nd col
            //text
            //row //container //text

          ],
        ),
      ),
    );
  }
}
