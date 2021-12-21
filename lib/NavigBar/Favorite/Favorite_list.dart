import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
class favorite_list extends StatelessWidget {
  const favorite_list({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Activity",style: TextStyle(fontSize: 25)),
      ),
      body: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString("images/favorite.json"),
          builder: (context,snapshot){
            var mydata = json.decode(snapshot.data.toString());
            final today = mydata?[0].length;
            final yesterday = mydata?[1].length;
            final week = mydata?[2].length;
            if(mydata == null){
              return Center(
                child: Text(
                  "Loading...",
                ),
              );
            }
            else{
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Icon(CupertinoIcons.profile_circled,size:55,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Follow Requests",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                              SizedBox(height: 2,),
                              Text("Approve or ignore requests",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.blue),)
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 3,),
                          Image.asset("images/tick.png",width: 50,height: 50,),
                          SizedBox(width: 12,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("You're all caught up",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                              SizedBox(height: 2,),
                              Text("See new activities by following friends",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.blue),)
                            ],
                          )
                        ],
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15,),
                            Text("Today",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(height: 15,),
                            notification(today, mydata, 0),
                            SizedBox(height: 15,),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Yesterday",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(height: 15,),
                            notification(yesterday, mydata, 1),
                            SizedBox(height: 15,),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("This Week",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            SizedBox(height: 15,),
                            notification(week, mydata, 2),
                            SizedBox(height: 15,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }
      ),
    );
  }

  ListView notification(today, mydata, count) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: today,
                              itemBuilder: (context, index) => Container(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 25,
                                      backgroundImage: NetworkImage(mydata[count][index]["dp"]),
                                    ),
                                    SizedBox(width: 12,),
                                    Container(
                                      width: 300,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "${mydata[count][index]["user"]}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                " commented on your post :",
                                                style: TextStyle(
                                                    fontSize: 14),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "${mydata[count][index]["comment"]}",
                                            maxLines: 5,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 14),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                          );
  }
}
