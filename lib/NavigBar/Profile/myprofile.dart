import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:instagram/NavigBar/Profile/tabswitch.dart';

class myprofile extends StatelessWidget {
  const myprofile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString("images/profile.json"),
          builder: (context,snapshot){
            var mydata = json.decode(snapshot.data.toString());
            if(mydata == null){
              return Center(
                child: Text(
                  "Loading...",
                ),
              );
            }
            else{
              return Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.only(left:14.0,right: 14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(CupertinoIcons.lock,size: 20,),
                                SizedBox(width: 4,),
                                Text(mydata[0]["username"],style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
                                SizedBox(width: 4,),
                                Icon(Icons.keyboard_arrow_down)
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 2,color: Colors.white),
                                      borderRadius: BorderRadius.all(Radius.circular(8.0))
                                  ),
                                  child: Icon(Icons.add_outlined,size: 18),
                                ),
                                SizedBox(width: 14),
                                Icon(CupertinoIcons.bars,size: 35,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),

                    Flexible(
                      child: ListView(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                        radius: 48,
                                        backgroundImage: NetworkImage(mydata[0]["dplink"]),
                                      ),
                                      Column(
                                        children: [
                                          Text("${mydata?[1].length}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                                          Text("Posts",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("${mydata?[0]["follower"]}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                                          Text("Followers",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                                        ],
                                      ),Column(
                                        children: [
                                          Text("${mydata?[0]["following"]}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                                          Text("Following",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0, top: 8.0,bottom: 3),
                                  child: Row(
                                    children: [
                                      Text("${mydata?[0]["name"]}",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left : 8.0),
                                  child: Row(
                                    children: [
                                      Text("${mydata?[0]["desc"]}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Container(
                            height: 800,
                            //width: 200,
                             child: tabswitch(data : mydata),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            };
          },
        )
    );
  }
}