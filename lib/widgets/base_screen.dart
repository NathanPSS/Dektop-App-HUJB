


import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {

  final Widget body;
  final String titleAppBar;

  const BaseScreen({super.key, required this.body, required this.titleAppBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(223, 247, 250,1),
      appBar: AppBar(
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Color.fromRGBO(137, 167, 194, 1.0),
    title: Text(titleAppBar,style: TextStyle(color: Colors.white),),
    ),
      body: body,
    );
  }
}