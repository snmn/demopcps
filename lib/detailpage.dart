import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class detailPage extends StatefulWidget {
  const detailPage({super.key});

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {

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

  headerCard(size){
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: Colors.green,
              height: size.height/3,
              width: size.width,
              child: Icon(Icons.play_circle,size: 55,
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
                ,child: Icon(Icons.share,
              color: Colors.white,size: 25,)),

          ],
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Text(
            "This is the class before dashain and we are "
                "creating a news app and we are creating it".toUpperCase()
            ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)
            ,maxLines: 2,overflow: TextOverflow.ellipsis,),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0,right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Author Name"),
              Text("sept 25, 2025")
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          child: Text(
            "This is the class before dashain and we are "
                "creating a news app and we are creating it "
                "This is the class before dashain and we are "
                "creating a news app and we are creating it"
                "This is the class before dashain and we are "
                "creating a news app and we are creating it"
                "This is the class before dashain and we are "
                "creating a news app and we are creating it"
                "This is the class before dashain and we are "
                "creating a news app and we are creating it"
                "This is the class before dashain and we are "
                "creating a news app and we are creating it"
            ,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 12)
            ,maxLines: 5,overflow: TextOverflow.ellipsis,),
        ),
      ],
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
              SizedBox(height: 40,),
              headerCard(size),
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
      ),
    );
  }
}
