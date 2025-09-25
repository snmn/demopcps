
import 'package:flutter/material.dart';

class democlass extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
 return democlassState();
  }
}

class democlassState extends State<democlass>{

  repeatrow(String text){
    return    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.people,color: Colors.white,),
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.white)
          ),
          child:  Center(
            child: Text(text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),),
          ),
        )

      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          repeatrow("demo"),
          repeatrow("class"),
       ],
      ),
    );
  }

}