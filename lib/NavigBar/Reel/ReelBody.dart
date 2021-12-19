import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class reelbody extends StatefulWidget {
  const reelbody({Key? key}) : super(key: key);

  @override
  _reelbodyState createState() => _reelbodyState();
}

class _reelbodyState extends State<reelbody> {
  bool follow = false;
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Container(
            height: device.height * 0.882,
            width: device.width,
            child: Image.network("https://static-ca-cdn.eporner.com/gallery/0T/XW/yFMDy5SXW0T/393357-393357.gif",fit: BoxFit.cover,),
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
              bottom: 85,
              left: 18,
              child: CircleAvatar(radius: 16,
                child: Image.network("https://wallpapercave.com/wp/wp4768945.jpg",fit: BoxFit.fitWidth,),
              )),
          Positioned(
              bottom: 85,
              left: 65,
              child: Row(
                children: [
                  Text("Danidaniel",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
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
              )),
          Positioned(
              bottom: 50,
              left: 18,
              child: Text("Stranger things promo interview",style: TextStyle(fontSize: 16),)),
          Positioned(
              bottom: 20,
              left: 18,
              child: Row(
                children: [
                  Icon(Icons.music_note_rounded,size: 18),
                  SizedBox(width: 5),
                  Text("Despacito - Luis Fonsi",style: TextStyle(fontSize: 16),)
                ],
              )
          ),
          Positioned(
              bottom: 20,
              right: 18,
              child: Column(
                children: [
                  Icon(FontAwesomeIcons.heart,size: 30,),
                  SizedBox(
                    height: 8,
                  ),
                  Text("786K",style: TextStyle(fontSize: 16),),
                  SizedBox(
                    height: 16,
                  ),
                  Icon(FontAwesomeIcons.comment,size: 30,),
                  SizedBox(
                    height: 8,
                  ),
                  Text("2,217",style: TextStyle(fontSize: 16),),
                  SizedBox(
                    height: 16,
                  ),
                  Image.asset("images/send.png",width: 30,height: 30,color: Colors.white,),
                  SizedBox(
                    height: 16,
                  ),
                  Icon(Icons.more_vert,size: 30,)
                ],
              )),
        ],
      )
    );
  }
}
