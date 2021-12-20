import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
import 'package:flutter_swiper/flutter_swiper.dart';

class reelbody extends StatefulWidget {
  const reelbody({Key? key}) : super(key: key);

  @override
  _reelbodyState createState() => _reelbodyState();
}

class _reelbodyState extends State<reelbody> {
  bool descriptionclick = false;
  bool like = false;
  bool follow = false;
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString("images/Reel.json"),
          builder: (context, snapshot){
        var myreeldata = json.decode(snapshot.data.toString());
        final length = myreeldata?.length;
        if(myreeldata == null){
          return Center(
            child: Text(
              "Loading...",
            ),
          );
        }
        else{
          return Swiper(
            loop: false,
            itemBuilder: (BuildContext context,int index){
              return Stack(
                children: [
                  Container(
                    height: device.height * 0.882,
                    width: device.width,
                    child: Image.network(myreeldata[index]["posturl"],fit: BoxFit.cover,),
                  ),
                  Positioned(
                      top: 18,
                      right: 18,
                      child: Icon(Icons.camera_alt_outlined,color: Colors.white,size: 30,)),
                  Positioned(
                      top: 20,
                      left: 18,
                      child: Text("Reels",style: TextStyle(fontSize: 21,fontWeight: FontWeight.w500),)),
                  Positioned(
                      bottom: 48,
                      left: 18,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                radius: 16.0,
                                backgroundImage:
                                NetworkImage(myreeldata[index]["dpurl"]),
                                backgroundColor: Colors.transparent,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(myreeldata[index]["user"],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                              SizedBox(
                                width: 15,
                              ),
                              GestureDetector(
                                onTap: (){ setState(() {
                                  follow = !follow;
                                }); },
                                child: follow ? Container(
                                  child: Center(child: Text("Following",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)),
                                  width: 90,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                  ),
                                ) : Container(
                                  child: Center(child: Text("Follow",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)),
                                  width: 70,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.all(Radius.circular(6)),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                descriptionclick = !descriptionclick;
                              });
                            },
                            child: descriptionclick ?
                            Container(
                                width: device.width * 0.7,
                                child: Text(myreeldata[index]["description"],
                                  maxLines: 40,
                                  style: TextStyle(fontSize: 16),)
                            ) : Container(
                                width: 160,
                                child: Text(myreeldata[index]["description"],
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 16),)
                            ),
                          )
                        ]
                      )
                  ),
                  Positioned(
                      bottom: 18,
                      left: 18,
                      child: Row(
                        children: [
                          Icon(Icons.music_note_rounded,size: 18),
                          SizedBox(width: 5),
                          Text(myreeldata[index]["song"],style: TextStyle(fontSize: 14),)
                        ],
                      )
                  ),
                  Positioned(
                      bottom: 20,
                      right: 18,
                      child: Column(
                        children: [
                          IconButton(
                              icon: like ? Icon(FontAwesomeIcons.solidHeart,color: Colors.red,size: 30,) : Icon(FontAwesomeIcons.heart,size: 30,),
                              onPressed: ()=> setState(() => like = !like)
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(myreeldata[index]["like"],style: TextStyle(fontSize: 13),),
                          SizedBox(
                            height: 18,
                          ),
                          Icon(FontAwesomeIcons.comment,size: 30,),
                          SizedBox(
                            height: 8,
                          ),
                          Text(myreeldata[index]["comment"],style: TextStyle(fontSize: 13),),
                          SizedBox(
                            height: 18,
                          ),
                          Image.asset("images/send.png",width: 30,height: 30,color: Colors.white,),
                          SizedBox(
                            height: 20,
                          ),
                          Icon(Icons.more_vert,size: 30,)
                        ],
                      )),
                ],
              );
            },
            scrollDirection: Axis.vertical,
            itemCount: length,
           // pagination: new SwiperPagination(),
          //  control: new SwiperControl(),
          );
        }
      }),
    );
  }
}