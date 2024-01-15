

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/estagiario/widgets/register_form_estagiario.dart';


class RegisterScreenEstagiario extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueGrey,
        title: Text("Cadastrar Estagiario",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: RegisterEstagiarioForm(),
      ),
    );
  }
}