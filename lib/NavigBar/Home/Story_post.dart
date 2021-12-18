import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:instagram/NavigBar/Navbar.dart';
import 'dart:async';

class storypost extends StatefulWidget {
  final String? name;
  final String? dp;
  final String? link;
  const storypost({Key? key, this.name, this.dp, this.link}) : super(key: key);

  @override
  _storypostState createState() => _storypostState();
}

class _storypostState extends State<storypost> {
  double _width = 0;
  double devicewidth = 0;
  @override

  void initState() {
    Future.delayed(Duration(seconds: 0)).then((value) => _update());
    super.initState();
    Timer(
        Duration(seconds: 6,milliseconds: 100),
            () => Navigator.pop(context)
    );
  }
  double ?_update(){
    setState(() {
      _width = devicewidth;
    });
  }
  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    devicewidth = device.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                Positioned(
                  child: Container(
                    height: device.height * 0.87,
                    width: devicewidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        shape: BoxShape.rectangle,
                        color: Colors.black,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage("${widget.link}"))),
                  ),
                ),
                Positioned(
                  left: device.height * 0.02,
                  top: device.height * 0.025,
                  child: Container(
                    height: device.height * 0.04,
                    width: device.height * 0.04,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage("${widget.dp}"))),
                  ),
                ),
                Positioned(
                    left: device.height * 0.07,
                    top: device.height * 0.034,
                    child: Text(
                      "${widget.name}",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 15.5,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.8,
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(0, 1.2),
                            blurRadius: 2.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Shadow(
                            offset: Offset(0, -1.2),
                            blurRadius: 6.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ],
                      ),
                    )),
                Positioned(
                  right: device.height * 0.014,
                  top: device.height * 0.028,
                  child: Icon(Icons.more_vert, size: 22),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Positioned(
                      child: AnimatedContainer(
                        duration: Duration(seconds: 6),
                        color: Colors.white,
                        width: _width,
                        height: 2.5,
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Positioned(
                      child: Container(
                        color: Colors.white38,
                        width: _width,
                        height: 2.5,
                      )
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              color: Colors.black,
              child: Positioned(
                  left: device.height * 0.01,
                  bottom: device.height * 0.052,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: device.height * 0.053,
                          width: device.height * 0.378,
                          child: Material(
                            color: Colors.black,
                            child: TextField(
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide:
                                    BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                filled: true,
                                hintStyle: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    height: 0.8),
                                hintText: "  Send message",
                                fillColor: Colors.black,
                              ),
                            ),
                          )),
                      Image.asset("images/send.png",
                          height: 28, width: 28, color: Colors.white)
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
