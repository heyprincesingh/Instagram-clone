import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Home/insta_list.dart';

class home extends StatelessWidget {
  final topBar = new AppBar(
    backgroundColor: Colors.black,
    title: Text("Instagram",
        style: TextStyle(
          fontFamily: "insta",
          letterSpacing: 3,
          fontSize: 25,
        )),
    actions: [
      Padding(
        padding: const EdgeInsets.only(top: 14,bottom: 14),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 2,color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(8.0))
          ),
          child: Icon(Icons.add_outlined,size: 24),
        ),
      ),
      SizedBox(
        width: 12,
      ),
      Container(
          child:
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("images/message.png",color: Colors.white,height: 30,width: 30,),
          )
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: topBar,
      body: instabody(),
    );
  }

}
