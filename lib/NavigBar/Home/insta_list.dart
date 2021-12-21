import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram/NavigBar/Home/stories.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';
class instabody extends StatefulWidget {
  const instabody({Key? key}) : super(key: key);

  @override
  _instabodyState createState() => _instabodyState();
}

class _instabodyState extends State<instabody> {
  bool like = false;
  bool save = true;
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
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
            return ListView.builder(
              itemCount: length+1,
              itemBuilder: (context, index) => index == 0 ? SizedBox(
                child: stories(),
                height: device.height * 0.136,
              ) : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(padding: const EdgeInsets.only(left:10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            new Container(
                              height: device.height * 0.038,
                              width: device.height * 0.038,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.contain,
                                      image: NetworkImage(mydata[index-1]["dp"])
                                  )
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(mydata[index-1]["user"],style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)
                          ],
                        ),
                        IconButton(onPressed: null, icon: Icon(Icons.more_vert,color: Colors.white,))
                      ],
                    ),
                  ),
                  GestureDetector(
                    onDoubleTap: () => setState(() => like = !like),
                    child: Container(
                      child: Image.network(mydata[index-1]["post"]["link"],fit: BoxFit.cover,),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(left : 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [IconButton(
                            icon: like ? Icon(FontAwesomeIcons.solidHeart,color: Colors.red,) : Icon(FontAwesomeIcons.heart),
                            onPressed: ()=> setState(() => like = !like)
                          ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Icon(FontAwesomeIcons.comment),
                            SizedBox(
                              width: 18.0,
                            ),
                            Image.asset("images/send.png",height: 23,width: 23,color: Colors.white,),
                            //Icon(FontAwesomeIcons.paperPlane),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right : 4.0),
                          child: IconButton(
                            icon: save ? Icon(FontAwesomeIcons.bookmark) : Icon(Icons.bookmark ,size: 30),
                            onPressed: ()=> setState(() => save = !save),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    //"Liked by elonmusk, billgates and 69,690 others"
                    child: Text("elonmusk, billgates and "+mydata[index-1]["like"], style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("View all 6969 comments", style: TextStyle(color: Colors.white54),),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(padding: const EdgeInsets.fromLTRB(16.0, 5.0, 8.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        new Container(
                          height: 25.0,
                          width: 25.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(mydata[0]["dp"])
                              )
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Expanded(child:
                         TextField(
                          decoration: new InputDecoration(
                            border: InputBorder.none,
                            hintText: "Add a comment...",
                          ),
                        ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("23 minutes ago", style: TextStyle(color: Colors.white54,fontSize: 12),),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}