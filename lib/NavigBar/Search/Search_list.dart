import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram/NavigBar/Search/FeedPost.dart';

class search_list extends StatelessWidget {
  const search_list({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int count = 2;
    var device = MediaQuery.of(context).size;
    return Scaffold(backgroundColor: Colors.black,
      body: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString("images/searchdata.json"),
          builder: (context, snapshot) {
            var myfeeddata = json.decode(snapshot.data.toString());
            final length3x3 = myfeeddata?.length;
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
                      height: 60,
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
                              SizedBox(width: 13),
                              Expanded(
                                child: TextFormField(
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    hintStyle: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white54,
                                        fontWeight: FontWeight.w400,
                                        ),
                                    hintText: "Search",
                                  ),
                                )
                              )
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
                      child: StaggeredGridView.countBuilder(
                        staggeredTileBuilder: (index) => StaggeredTile.count(1, index%22==2 || index.isOdd && index%11==0 ? 2 : 1),
                            crossAxisCount: 3,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            itemCount: length3x3 - 1,
                            itemBuilder: (context,index) => GestureDetector(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          feedpost(dp : myfeeddata[0]["url"], username : myfeeddata[index+1]["username"], url : myfeeddata[index+1]["url"])),
                                );
                              },
                              child: Container(
                                child: index%22==2 || index.isOdd && index%11==0 ? Stack(fit: StackFit.expand,
                                  children: [
                                    Image.network(myfeeddata[index+1]["url"],fit: BoxFit.cover,),
                                    Positioned(
                                        top: 7,
                                        right: 7,
                                        child: Image.network("https://img.icons8.com/ios-filled/500/instagram-reel.png",
                                          color: Colors.white,
                                          width: 30,height: 30,))
                                  ],
                                ) : null,
                                height: 12.0,
                                width: 12.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(myfeeddata[index+1]["url"]),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                            ),
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