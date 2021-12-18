import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class search_list extends StatelessWidget {
  const search_list({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return Scaffold(backgroundColor: Colors.black,
      body: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString("images/searchdata.json"),
          builder: (context, snapshot) {
            var myfeeddata = json.decode(snapshot.data.toString());
            final length3x3 = myfeeddata?[0].length;
            final length3x2 = myfeeddata?[1].length;
            if (myfeeddata == null) {
              return Center(
                child: Text(
                  "Loading...",
                ),
              );
            }
            else {
              return SafeArea(
                child: Column(
                  children: [
                    Container(
                      height: device.height * 0.063,
                      width: device.width,
                      child: Padding(
                        padding: const EdgeInsets.all(11),
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 13),
                              Icon(Icons.search),
                              SizedBox(width: 10),
                              Text("Search", style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400),)
                            ],
                          ),
                          width: device.width,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white24,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: 25,// length3x3,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    child: Image.network(myfeeddata[0][index]["url"],fit: BoxFit.cover),
                                    height: device.width / 3,
                                    width: device.width / 3,
                                  ),
                                  Container(
                                    child: Image.network(myfeeddata[0][index]["url"],fit: BoxFit.cover),
                                    height: device.width / 3,
                                    width: device.width / 3,
                                  ),
                                  Container(
                                    child: Image.network(myfeeddata[0][index]["url"],fit: BoxFit.cover),
                                    height: device.width / 3,
                                    width: device.width / 3,
                                  ),
                                ],
                              )
                            ],
                          )
                      ),
                    )
                  ],
                )
              );
            }
          }
      ),
    );
  }
}

/*
  Row R_2x2Grid(Size device,String link) {
    return Row(
        children: [
          Column(
            children: [
              FeedBox_3x3(device,link),
              FeedBox_3x3(device,link),
            ],
          ),
          Column(
            children: [
              FeedBox_3x3(device,link),
              FeedBox_3x3(device,link),
            ],
          ),
          FeedBox_3x2(device)
        ],
      );
  }

  Row BoxGrid_2x2(Size device,String link) {
    return Row(
        children: [
          Column(
            children: [
              FeedBox_3x3(device,link),
              FeedBox_3x3(device,link),
            ],
          ),
          Column(
            children: [
              FeedBox_3x3(device,link),
              FeedBox_3x3(device,link),
            ],
          ),
          Column(
            children: [
              FeedBox_3x3(device,link),
              FeedBox_3x3(device,link),
            ],
          ),
        ],
      );
  }

  Row L_2x2Grid(Size device,String link) {
    return Row(
        children: [
          FeedBox_3x2(device),
          Column(
            children: [
              FeedBox_3x3(device,link),
              FeedBox_3x3(device,link),
            ],
          ),
          Column(
            children: [
              FeedBox_3x3(device,link),
              FeedBox_3x3(device,link),
            ],
          ),
        ],
      );
  }

  Container FeedBox_3x2(Size device) {
    return Container(
            width: device.width / 3,
            height: device.width / 1.5,
            color: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: Image.network("https://upload.wikimedia.org/wikipedia/commons/8/8a/Millie_Bobby_Brown_Pandora_2020_27s.jpg",fit: BoxFit.fitHeight),
            ),
          );
  }

  Container FeedBox_3x3(Size device,String link) {
    return Container(
                width: device.width / 3,
                height: device.width / 3,
                color: Colors.black45,
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Image.network("$link",fit: BoxFit.cover,),
                ),
              );
  }
}
*/