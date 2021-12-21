import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class tabswitch extends StatelessWidget {
  final List? data;
  const tabswitch({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(toolbarHeight: 50,
            backgroundColor: Colors.black,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.grid_on_rounded)),
                Tab(icon: Image.asset("images/instagram-tag.png",width: 25,height: 25,color: Colors.white))
              ],
            ),
          ),
          body: TabBarView(
            children: [
              GridView.builder(
                shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  itemCount: data?[1].length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Image.network(data?[1][index]["link"],fit: BoxFit.cover,height: 200,width: 200,),
                    );
                  }),

              GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  itemCount: data?[2].length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Image.network(data?[2][index]["link"],fit: BoxFit.cover,height: 200,width: 200,),
                    );
                  })
            ],
          )
        )
    );
  }
}
