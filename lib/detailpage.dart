import 'package:flutter/material.dart';

class detailpage extends StatefulWidget {
  const detailpage({super.key});

  @override
  State<detailpage> createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {

  headingpart(size){
    return Column(
    children: [
      Stack(
        children: [
          Container(
            height: size.height/3,
            width: size.width,
            color: Colors.green,
            child: Center(child: Icon(Icons.play_circle,
              color: Colors.white,size: 50,)),
          ),
          Positioned(left: 15,top: 15,
              child: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },child: Icon(Icons.arrow_back,color: Colors.white,size: 30,))),
          Positioned(right: 15,top: 15,
            child: Icon(Icons.share,color: Colors.white,size: 30,),)
        ],
      ),
      SizedBox(height: 15,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(15),
            child: Text("This is dashain at pcps "
                "college and we are leaving home".toUpperCase()
              ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,
                  fontSize: 20),),
          ),
          Container(
            margin: EdgeInsets.only(left: 15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Author Name"),
                Text("25th Sept 2025")
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(15),
            child: Text("This is dashain at pcps "
                "college and we are leaving home"
                "This is dashain at pcps "
                "college and we are leaving home"
                "This is dashain at pcps "
                "college and we are leaving home"
                "This is dashain at pcps "
                "college and we are leaving home"
                "This is dashain at pcps "
                "college and we are leaving home"
                "This is dashain at pcps "
                "college and we are leaving home"
              ,style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,
                  fontSize: 14),),
          ),
        ],
      )
    ],
    );
  }

  verticalCard(size,heading,date, buttontext){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => detailpage(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 100,
                  width: 120,
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(color: Colors.green,
                      borderRadius: BorderRadius.circular(15)
                  ),
                ),
                Positioned(left: 40,top: 25,child:Icon(Icons.play_circle,color: Colors.white,size: 40,))
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width/2,
                  child: Text(heading,style: TextStyle(
                      fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold
                  ),overflow: TextOverflow.ellipsis,maxLines: 2,),
                ),
                SizedBox(height: 20,),
                Container(
                  width: size.width/2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                        child: Text(buttontext,style: TextStyle(color: Colors.white),),
                      ),
                      Text(date,style: TextStyle(color: Colors.black),),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
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
              SizedBox(height: 45,),
              headingpart(size),
              Column(
                children: [
                  verticalCard(size, "Today is holiday Today is sunday Today is sunday", "10th sept 2025", "Click here"),
                  verticalCard(size, "Today is sunday", "10th sept 2025", "Click here"),
                  verticalCard(size, "Today is monday", "10th sept 2025", "Click here"),
                  verticalCard(size, "Today is tuesday", "10th sept 2025", "Click here"),
                  verticalCard(size, "Today is monday", "10th sept 2025", "Click here"),
                  verticalCard(size, "Today is tuesday", "10th sept 2025", "Click here"),
                  verticalCard(size, "Today is monday", "10th sept 2025", "Click here"),
                  verticalCard(size, "Today is tuesday", "10th sept 2025", "Click here"),
                  verticalCard(size, "Today is monday", "10th sept 2025", "Click here"),
                  verticalCard(size, "Today is tuesday", "10th sept 2025", "Click here")

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
