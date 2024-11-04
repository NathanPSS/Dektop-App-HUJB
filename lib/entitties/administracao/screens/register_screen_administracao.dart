


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/administracao/widgets/register_form_administracao.dart';
import 'package:interface_sistema/widgets/base_screen.dart';

class RegisterScreenAdministracao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseScreen(
     titleAppBar: "Cadastrar Administrador",
      body: Container(
        alignment: Alignment.topCenter,
        child: RegisterAdministracaoForm(),
      ),
    );
  }
}