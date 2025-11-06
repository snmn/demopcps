import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  late TextEditingController _controller;
  String chatId = "123";
  String currentUserId = "456";
  String otherUserId = "789";
  sendMessage(String text) async {
   final ref =  FirebaseFirestore.instance
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc();
   await ref.set({
     'senderId': currentUserId,
     'text': text.trim(),
     'timestamp': FieldValue.serverTimestamp(),
   });
    await FirebaseFirestore.instance
        .collection('chats')
   .doc(chatId).update({
      'lastMessage': text.trim(),
      'lastUpdated': FieldValue.serverTimestamp(),
   });
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60,),
              //back button
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Icon(Icons.arrow_back,size: 35,
                    color: Colors.black,),
                ),
              ),
              //stream builder
              StreamBuilder<QuerySnapshot>(
                  stream: stream,
                  builder: (context, snapshot){
                    if(snapshot.connectionState
                        == ConnectionState.waiting){
                      return const CircularProgressIndicator();
                    }
                    if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
                      return Text("No data");
                    }
                    final messages = snapshot.data!.docs;
                    return Container(
                      width: size.width,
                      height: size.height/3,
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 10),
                          itemCount: messages.length,
                          itemBuilder: (context, index){
                          var msg = messages[index];
                          final isMe = msg['senderId'] == currentUserId;
                          return isMe?
                          //show right side
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(width: size.width/1.5,
                                  margin: EdgeInsets.only(left: 15,bottom: 15,right: 15),
                                  padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Text("Hey mate,",
                                    style: TextStyle(color: Colors.white),))
                            ],
                          )  :
                            //show left side'
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(width: size.width/1.5,
                                  margin: EdgeInsets.only(left: 15,bottom: 15),
                                  padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(15)
                                  ),
                                  child: Text("Hi how are you.",
                                    style: TextStyle(color: Colors.white),))
                            ],
                          )
                          ;
                          }
                      ),
                    );
                  }),
              //left side item

              //right side item


            ],
          ),
          //Textfield
          Container(
            color: Colors.black26,
            child: Row(
              children: [
                Container(
                  width: size.width/1.2,
                  padding: EdgeInsets.only(left: 15),
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white,),
                    maxLines: 1,
                    onSubmitted: (var abc){
                      sendMessage(abc);
                      setState(() {
                        _controller.clear();
                      });
                    },
                    onEditingComplete: (){
                      var abc = _controller.text;
                      sendMessage(abc);
                      setState(() {
                        _controller.clear();
                      });
                    },
                  ),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    var abc = _controller.text;
                    sendMessage(abc);
                    setState(() {
                      _controller.clear();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(Icons.send,color: Colors.white,size: 25,),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
