

import 'package:flutter/material.dart';
import 'package:interface_sistema/widgets/consult_form.dart';

class ConsultScreen extends StatelessWidget {
  const ConsultScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueGrey,
        title: Text("Consulta",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
         alignment: Alignment.center,
         padding: EdgeInsets.all(40),
         child: ConsultForm(),
      ),
    );
  }
}