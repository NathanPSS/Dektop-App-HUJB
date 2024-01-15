

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interface_sistema/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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