


import 'package:flutter/material.dart';
import 'package:interface_sistema/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    debugPrint(MediaQuery.of(context).size.width.toString());
    debugPrint(MediaQuery.of(context).size.height.toString());
    return Scaffold(
      backgroundColor: Color.fromRGBO(220,243,255,0.5),
      body: Row(
        children: [
             Container(
               child: Image.asset("images/Site-Stats-rafiki.png"),
             ),
          LoginForm(),
        ],
      ),
    );
  }

}