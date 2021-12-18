import 'package:flutter/material.dart';
import 'Search/Search_list.dart';

class search extends StatelessWidget {
  const search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: search_list(),
      ),
    );
  }
}

