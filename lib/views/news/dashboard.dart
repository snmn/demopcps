import 'package:flutter/material.dart';

import 'detailpage.dart';

class dashboard extends StatefulWidget {
  const dashboard({super.key});

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {

  horizontalcard(size,heading, date){
    return  Stack(
      children: [
        Container(
            margin: EdgeInsets.only(left: 15),
            height: size.height/5,
            width: size.width/1.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black12,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network('https://picsum.photos/250?image=9',
                fit: BoxFit.cover,opacity: const AlwaysStoppedAnimation(.7),),
            )),
        Container(
          margin: EdgeInsets.only(left: 15),
          height: size.height/5,
          width: size.width/1.5,
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(15),

          ),
        ),
        Positioned(
          bottom: 15,left: 25,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width/1.9,
                child: Text(heading,style: TextStyle(color: Colors.white,
                  fontSize: 18,fontWeight: FontWeight.bold,),
                  overflow: TextOverflow.ellipsis,maxLines: 2,),
              ),
              Text(date,style: TextStyle(color: Colors.white,
                fontSize: 14,fontWeight: FontWeight.normal,),),
            ],
          ),
        ),
        Positioned(
            right: 15,bottom: 15,
            child: Icon(Icons.play_circle,size: 35,color: Colors.white,))
      ],
    );
  }

  verticalcard(size,heading,author, date){
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => detailpage(),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(top: 10,left: 10),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                    height: 100,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network('https://picsum.photos/250?image=9',
                        fit: BoxFit.cover,),
                    )),
                Container(
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                    // color: Colors.green,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: Icon(Icons.play_circle,size: 40,color: Colors.white,),
                  ),
                ),

              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width/2,
                  padding: EdgeInsets.only(left: 15),
                  child: Text(heading,
                    style: TextStyle(color: Colors.black,
                        fontSize: 16,fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,maxLines: 2,),
                ),
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                      child: Text(author,style: TextStyle(color: Colors.white),),
                    ),
                    SizedBox(width: 15,),
                    Text(date,style: TextStyle(color: Colors.black),)
                  ],
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
      body: Column(
        children: [
          SizedBox(height: 45,),
         //horizontal card
         //  Image.asset('../images/logo.png',
         //    fit: BoxFit.cover,),
         Container(
           width: size.width,
           child: SingleChildScrollView(
             scrollDirection: Axis.horizontal,
             child: Row(
               children: [
                 horizontalcard(size, "This is Norway news", " 25 Sept 2025"),
                 horizontalcard(size, "This is PCPS LAB for news articles, "
                     "This is PCPS LAB for news articles,", " 25 Sept 2025"),
                 horizontalcard(size, "This is sunday", " 25 Sept 2025"),
                 horizontalcard(size, "This is PCPS LAB for news articles, "
                     "This is PCPS LAB for news articles,", " 25 Sept 2025"),
                 horizontalcard(size, "This is PCPS LAB for news articles, "
                     "This is PCPS LAB for news articles,", " 25 Sept 2025")
               ],
             ),
           ),
         ),

          SizedBox(height: 20,),
          //vertical card

          Container(
            height: size.height/1.4,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  verticalcard(size, "This is monday", "pcps.com", "25 sept 2025"),
                  verticalcard(size, "This is monday", "pcps.com", "25 sept 2025"),
                  verticalcard(size, "This is monday", "pcps.com", "25 sept 2025"),
                  verticalcard(size, "This is monday", "pcps.com", "25 sept 2025"),
                  verticalcard(size, "This is monday", "pcps.com", "25 sept 2025"),
                  verticalcard(size, "This is monday", "pcps.com", "25 sept 2025"),
                  verticalcard(size, "This is monday", "pcps.com", "25 sept 2025"),
                  verticalcard(size, "This is monday", "pcps.com", "25 sept 2025"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
