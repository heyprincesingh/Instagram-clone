import 'package:flutter/material.dart';


class search_list extends StatelessWidget {
  const search_list({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          height: device.height * 0.063,
          width: device.width,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(11),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 13),
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Text("Search",style: TextStyle(color: Colors.white60,fontSize: 17,fontWeight: FontWeight.w400),)
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
        R_2x2Grid(device),
        BoxGrid_2x2(device),
        L_2x2Grid(device),
      ],
    );
  }

  Row R_2x2Grid(Size device) {
    return Row(
        children: [
          Column(
            children: [
              FeedBox_3x3(device),
              FeedBox_3x3(device),
            ],
          ),
          Column(
            children: [
              FeedBox_3x3(device),
              FeedBox_3x3(device),
            ],
          ),
          FeedBox_3x2(device)
        ],
      );
  }

  Row BoxGrid_2x2(Size device) {
    return Row(
        children: [
          Column(
            children: [
              FeedBox_3x3(device),
              FeedBox_3x3(device),
            ],
          ),
          Column(
            children: [
              FeedBox_3x3(device),
              FeedBox_3x3(device),
            ],
          ),
          Column(
            children: [
              FeedBox_3x3(device),
              FeedBox_3x3(device),
            ],
          ),
        ],
      );
  }

  Row L_2x2Grid(Size device) {
    return Row(
        children: [
          FeedBox_3x2(device),
          Column(
            children: [
              FeedBox_3x3(device),
              FeedBox_3x3(device),
            ],
          ),
          Column(
            children: [
              FeedBox_3x3(device),
              FeedBox_3x3(device),
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
              child: Image.network("https://upload.wikimedia.org/wikipedia/commons/8/8a/Millie_Bobby_Brown_Pandora_2020_27s.jpg",fit: BoxFit.fill,),
            ),
          );
  }

  Container FeedBox_3x3(Size device) {
    return Container(
                width: device.width / 3,
                height: device.width / 3,
                color: Colors.black45,
                child: Padding(
                  padding: const EdgeInsets.all(1),
                  child: Image.network("https://www.enjpg.com/img/2020/billie-eilish-10.jpg",fit: BoxFit.cover,),
                ),
              );
  }
}
