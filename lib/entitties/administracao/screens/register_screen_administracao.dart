


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/administracao/widgets/register_form_administracao.dart';

class RegisterScreenAdministracao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueGrey,
        title: Text("Cadastrar Administrador",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: RegisterAdministracaoForm(),
      ),
    );
  }
}