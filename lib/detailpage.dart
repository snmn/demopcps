import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class detailPage extends StatefulWidget {
  const detailPage({super.key});

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40,),
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
              ,child: Icon(Icons.arrow_back,color: Colors.white,
                  size: 25,)),
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
      ),
    );
  }
}
