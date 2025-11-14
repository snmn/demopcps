import 'package:flutter/material.dart';

class democlass1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return democlass1State();
  }
}

class democlass1State extends State<democlass1>{

  repeatwidget(String title){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Row(
            children: [
              Icon(Icons.person,color: Colors.white,size: 25,),
              Text("demo class pcps")
            ],
          ),
        ),
        Container(
          child: Text(title,style:
          TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(),
     body:  Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
          repeatwidget("pcps"),
          repeatwidget("demo"),
         repeatwidget("class"),
       ],
     ),
   );
  }

}
