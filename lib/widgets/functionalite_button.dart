


import 'package:flutter/material.dart';

class FunctionaliteButton extends StatelessWidget{

  final String buttonText;
  final dynamic icon;
  final dynamic action;

  const FunctionaliteButton({super.key, required this.buttonText, required this.icon, required this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 120,
     // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      child: InkWell(
        onTap: action,
        hoverColor: Color.fromRGBO(0, 165, 255, 0.1),
        child: Container(
          child: Column(
            children: [
              Container(
         //     decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                width: 54,
                height: 54,
                child: icon,margin: EdgeInsets.only(top: 4),),
              SizedBox(height: 16,),
              Container(child: Text(buttonText),margin: EdgeInsets.only(bottom: 4),)
            ],
          ),
        ),
      ),
    );
  }
}