


import 'package:flutter/material.dart';

class TextCard extends StatelessWidget {
  
  final String title;
  final String content;

  const TextCard({super.key, required this.title, required this.content});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Text(title,style: TextStyle(fontSize: 28),),
         Text(content,style: TextStyle(color: Color.fromRGBO(67, 67, 67, 1.0),fontSize: 16),)
      ],
    );
  }
}