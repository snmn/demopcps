import 'package:flutter/material.dart';

class detailpage extends StatefulWidget {
  const detailpage({super.key});

  @override
  State<detailpage> createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {

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

  headerelement(size){
    return Column(
      children: [
        //header element
        Stack(
          children: [
            Container(
            height: size.height/3.5,
            width: size.width,
            child: Image.network('https://picsum.photos/250?image=9',
            fit: BoxFit.cover,)),
            Container(
              height: size.height/3.5,
              width: size.width,
              color: Colors.transparent,
              child: Center(
                child: Icon(Icons.play_circle,color: Colors.white,size: 50,),
              ),
            ),

            Positioned(
                left: 15,top: 15
                ,child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back,color: Colors.white,size: 30,))),
            Positioned(
                right: 15,top: 15
                ,child: Icon(Icons.share,color: Colors.white,size: 30,))
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text("This is Dashain Vacation "
              "at pcps and we are typing This is Dashain Vacation ".toUpperCase(),
            style: TextStyle(color: Colors.black,fontSize: 16
                ,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,
            maxLines: 2,),
        ),
        Container(
          width: size.width,
          padding: EdgeInsets.only(left: 15,right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Author Name"),
              Text("25th Sept 2025")
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text("This is Dashain Vacation "
              "at pcps and we are typing This is Dashain Vacation "
              "This is Dashain Vacation "
              "at pcps and we are typing This is Dashain Vacation "
              "This is Dashain Vacation "
              "at pcps and we are typing This is Dashain Vacation "
              "This is Dashain Vacation "
              "at pcps and we are typing This is Dashain Vacation "
              "This is Dashain Vacation "
              "at pcps and we are typing This is Dashain Vacation "
              "This is Dashain Vacation "
              "at pcps and we are typing This is Dashain Vacation ",
            style: TextStyle(color: Colors.black,fontSize: 14
                ,fontWeight: FontWeight.normal),overflow: TextOverflow.visible,
            maxLines: 7,),
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
              SizedBox(height: 45,),
              headerelement(size),
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
      ),
    );
  }
}
