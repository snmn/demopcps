import 'package:demopcps/core/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:share_plus/share_plus.dart';

import '../api/newsapicall.dart';
import '../model/newsapimodel.dart';

class detailPage extends StatefulWidget {
  const detailPage({super.key});

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {


  verticalCard (size, heading, date, actionbutton, String url,Articles article){
    return GestureDetector(
      onTap: (){
        staticfile.clickedarticle = article;
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

  headerCard(size){
    return Column(
      children: [
        Stack(
          children: [
            Image.network(staticfile.clickedarticle!.urlToImage!,
              fit: BoxFit.fill,height: size.height/3.5,),
            Container(
              color: Colors.black26,
              height: size.height/3.5,
              width: size.width,
              child: const Icon(Icons.play_circle,size: 55,
                color: Colors.white,),
            ),

            Positioned(
                left: 20,top: 15
                ,child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back,color: Colors.white,
                size: 25,),
            )),
            Positioned(
                right: 20,top: 15
                ,child: GestureDetector(
              onTap: (){

                Share.share(
                    staticfile.clickedarticle!.urlToImage!)
                ;
              },
                  child: Icon(Icons.share,
                                color: Colors.white,size: 25,),
                )),

          ],
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Text(
           staticfile.clickedarticle!.title!.toUpperCase()
            ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)
            ,maxLines: 2,overflow: TextOverflow.ellipsis,),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(staticfile.clickedarticle!.author!),
              Text(staticfile.clickedarticle!.publishedAt!.split("T")[0].toString())
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Text(
            staticfile.clickedarticle!.description!
            ,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12)
            ,maxLines: 5,overflow: TextOverflow.ellipsis,),
        ),
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
      body: Container(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40,),
              headerCard(size),
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
                                      articledata[index].urlToImage!,
                                      articledata[index]
                                  );
                                }
                            ),
                          );
                        }
                    }
                    // By default, show a loading spinner
                    return const Center(child: CircularProgressIndicator());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
