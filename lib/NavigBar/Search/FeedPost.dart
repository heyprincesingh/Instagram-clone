import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class feedpost extends StatefulWidget {
  final String? username;
  final String? url;
  const feedpost({Key? key, this.username, this.url}) : super(key: key);

  @override
  _feedpostState createState() => _feedpostState();
}

class _feedpostState extends State<feedpost> {
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    bool save = false;
    bool like = false;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Explore"),backgroundColor: Colors.black,elevation: 10
        ),
        body: Container(
          child: ListView(
            children: [
              Column(
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
                                      fit: BoxFit.fitWidth,
                                      image: NetworkImage("${widget.url}")
                                  )
                              ),
                            ),
                            SizedBox(
                              width: 14.0,
                            ),
                            Text("${widget.username}",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Center(child: Text("Follow",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15),)),
                              width: 70,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(6)),
                              ),
                            ),
                            IconButton(onPressed: null, icon: Icon(Icons.more_vert,color: Colors.white,))
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Image.network("${widget.url}",fit: BoxFit.fitHeight,),
                  ),
                  Padding(padding: const EdgeInsets.only(left : 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [IconButton(
                              icon: like == true ? Icon(FontAwesomeIcons.solidHeart,color: Colors.red,) : Icon(FontAwesomeIcons.heart),
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
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right : 4.0),
                          child: IconButton(
                            icon: save==false ? Icon(FontAwesomeIcons.bookmark) : Icon(Icons.bookmark ,size: 30),
                            onPressed: ()=> setState(() => save = !save),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text("Liked by elonmusk, billgates and 6,969", style: TextStyle(fontWeight: FontWeight.bold),),
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
                                  fit: BoxFit.fitWidth,
                                  image: NetworkImage("${widget.url}")
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
              )
            ],
          ),
        )
      ),
    );
  }
}
