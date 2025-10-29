import 'package:demopcps/api/newsapicall.dart';
import 'package:demopcps/newsapp/detailpage.dart';
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {

  verticalCard (size, heading, date, actionbutton){
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
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15)
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
                      padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                      decoration: BoxDecoration(color: Colors.red,
                          borderRadius: BorderRadius.circular(15)),
                      child:  Text(actionbutton,
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold,fontSize: 12),),
                    ),
                    SizedBox(width: 15,),
                    Text(date,
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold,fontSize: 12),),
                  ],
                )

              ],
            )

          ],
        ),
      ),
    );
  }

  horizontalCard(size, heading, date){
  return Stack(
    children: [
      Container(
        height: size.height/5,
        width: size.width/1.5,
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green
        ),
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsapicall().getnewsapidata();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      //appBar: ,
      body: Column(
        children: [
          SizedBox(height: 60,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                horizontalCard(size, "This is the best news", "10th Sept 2025"),
                horizontalCard(size, "PCPS day", "5th Sept 2025"),
                horizontalCard(size, "Dashian in near", "1st Sept 2025"),
                horizontalCard(size, "This is the best news", "12th Sept 2025"),
              ],
            ),
          ),
          Container(
            height: size.height/1.4,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalCard(size, "This is sunday and today is holiday", "25th Sept 2025"
                      , "www.pcps.com"),
                  verticalCard(size, "This is sunday and today is holiday", "25th Sept 2025"
                      , "www.pcps.com"),
                  verticalCard(size, "This is sunday and today is holiday", "25th Sept 2025"
                      , "www.pcps.com"),
                  verticalCard(size, "This is sunday and today is holiday", "25th Sept 2025"
                      , "www.pcps.com"),
                  verticalCard(size, "This is sunday and today is holiday", "25th Sept 2025"
                      , "www.pcps.com"),
                  verticalCard(size, "This is sunday and today is holiday", "25th Sept 2025"
                      , "www.pcps.com"),
                  verticalCard(size, "This is sunday and today is holiday", "25th Sept 2025"
                      , "www.pcps.com")
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

