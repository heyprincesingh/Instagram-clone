import 'package:flutter/material.dart';
import 'Favorite/Favorite_list.dart';
import 'dart:convert';
class favorite extends StatelessWidget {
  const favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favorite_list(),
    );
  }
}