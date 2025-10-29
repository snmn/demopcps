import 'package:demopcps/api/newsapicall.dart';
import 'package:demopcps/model/newsapimodel.dart';
import 'package:demopcps/newsapp/detailpage.dart';
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {

  verticalCard (size, heading, date, actionbutton, String url){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => detailPage(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 15,top: 15),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(url ,fit: BoxFit.cover,),
                  ),
                ),
                Positioned(
                    left: 50,
                    top: 25,
                    child: Icon(Icons.play_circle,color: Colors.white,size: 40,))
              ],
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width/2,
                  child: Text(heading,
                    style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,fontSize: 20),
                    overflow: TextOverflow.visible
                    ,maxLines: 2,),
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Container(
                      width: 100,
                      padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                      decoration: BoxDecoration(color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                      child:  Center(
                        child: Text(actionbutton,
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,fontSize: 12),maxLines: 1,),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Container(
                      width: 60,
                      child: Text(date,
                        style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.bold,fontSize: 12),maxLines: 1,),
                    ),
                  ],
                )

              ],
            )

          ],
        ),
      ),
    );
  }

  horizontalCard(size, heading, date, String url){
  return Stack(
    children: [
      Container(
        height: size.height/5,
        width: size.width/1.5,
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.black26
        ),
        child:  ClipRRect(borderRadius: BorderRadius.circular(15),
            child: Image.network(url,fit: BoxFit.cover,)),
      ),

       Positioned(
        bottom: 20,
        left: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(heading,
              style: TextStyle(color: Colors.white,
                  fontWeight: FontWeight.bold,fontSize: 16),),
            Text(date,
              style: TextStyle(color: Colors.white,
                  fontSize: 14,fontWeight: FontWeight.normal),)
          ],
        ),
      ),
      Positioned(
          right: 15,
          bottom: 15,
          child: Icon(Icons.play_circle,color: Colors.white,size: 30,)
      )
    ],
  );
  }
  Future<newsapi?>? _futurenewsapidata ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  apicall();
  }
  apicall(){
  _futurenewsapidata =  (newsapicall().getnewsapidata());
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //appBar: ,
      body: Column(
        children: [
          SizedBox(height: 60,),
          //future builder with switch case for horizontal list
          FutureBuilder(
              future: _futurenewsapidata,
              builder: (context, AsyncSnapshot<newsapi?> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      //get data
                      newsapi? data = snapshot.data;
                      List<Articles>? articledata = data!.articles!;
                      return Container(
                        height: size.height/5,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            itemCount: articledata.length,
                            itemBuilder: (BuildContext context, int index) {
                              return horizontalCard(size,
                                  articledata[index].title
                                  , articledata[index].publishedAt,
                              articledata[index].urlToImage!
                              );
                            }
                        ),
                      );
                //       return SingleChildScrollView(
                //       scrollDirection: Axis.horizontal,
                //       child: Row(
                // children: [
                // horizontalCard(size, "This is the best news", "10th Sept 2025"),
                // horizontalCard(size, "PCPS day", "5th Sept 2025"),
                // horizontalCard(size, "Dashian in near", "1st Sept 2025"),
                // horizontalCard(size, "This is the best news", "12th Sept 2025"),
                // ],
                // ),
                // );
                    }
                }
                // By default, show a loading spinner
                return const Center(child: CircularProgressIndicator());
              }),

          //future builder with switch case for vertical list
          FutureBuilder(
              future: _futurenewsapidata,
              builder: (context, AsyncSnapshot<newsapi?> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      //get data
                      newsapi? data = snapshot.data;
                      List<Articles>? articledata = data!.articles!;
                      return Container(
                        height: size.height/1.4,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            padding: EdgeInsets.zero,
                            itemCount: articledata.length,
                            itemBuilder: (BuildContext context, int index) {
                              return verticalCard(size,
                                  articledata[index].title,
                                 articledata[index].publishedAt
                                  , articledata[index].source!.name!,
                               articledata[index].urlToImage!
                              );
                            }
                        ),
                      );
                      //       return SingleChildScrollView(
                      //       scrollDirection: Axis.horizontal,
                      //       child: Row(
                      // children: [
                      // horizontalCard(size, "This is the best news", "10th Sept 2025"),
                      // horizontalCard(size, "PCPS day", "5th Sept 2025"),
                      // horizontalCard(size, "Dashian in near", "1st Sept 2025"),
                      // horizontalCard(size, "This is the best news", "12th Sept 2025"),
                      // ],
                      // ),
                      // );
                    }
                }
                // By default, show a loading spinner
                return const Center(child: CircularProgressIndicator());
              }),


        ],
      ),
    );
  }
}

