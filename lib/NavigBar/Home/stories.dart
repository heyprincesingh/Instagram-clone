import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'Story_post.dart';

class stories extends StatelessWidget {
  const stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString("images/data.json"),
      builder: (context,snapshot){
        var mydata = json.decode(snapshot.data.toString());
        final length = mydata?.length;
        if(mydata == null){
          return Center(
            child: Text(
              "Loading...",
            ),
          );
        }
        else{
          return Container(color: Colors.black54,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: length,
                      itemBuilder: (context, index) => Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          mydata[index]["post"]["status"]["on"] ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:9,top: 8),
                                child: Material(
                                  child: InkWell(
                                    onTap: () { index == 0 ? null : Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => storypost(name : mydata[index]["user"], dp : mydata[index]["dp"],link : mydata[index]["post"]["status"]["link"])),
                                    ); },
                                    child: Container(
                                      height: device.height * 0.085,
                                      width: device.height * 0.085,
                                      color: Colors.black,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black,
                                          image: index == 0 ? DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(mydata[0]["dp"])
                                          ) :
                                          DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(mydata[index]["dp"]),
                                          ),
                                        ),
                                        margin: EdgeInsets.symmetric(horizontal: 1),
                                      ),
                                    ),
                                  ),
                                )
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:7),
                                child: Container(alignment: Alignment.center,
                                  child: index == 0 ? Text("Your Story",style: TextStyle(color: Colors.white,fontSize: 12,height: device.height * 0.0026),)
                                      : Text(mydata[index]["user"],overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.white60,fontSize: 12, height: device.height * 0.0026),),
                                width: 70,),
                              )
                            ],
                          ) : Column(),
                         index == 0 ? Positioned(
                            right: device.height * 0.002,
                            top: device.height * 0.071,
                            child: CircleAvatar(
                              backgroundColor: Colors.blueAccent,
                              foregroundColor: Colors.white,
                              radius: device.height * 0.012,
                              child: Icon(Icons.add,color: Colors.white,size: device.height * 0.015),
                            ),
                          ) : Container()
                        ],
                      )
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}