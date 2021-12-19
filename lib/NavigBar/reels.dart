import 'package:flutter/material.dart';
import 'Reel/ReelBody.dart';

class reels extends StatelessWidget {
  const reels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: reelbody());
  }
}

