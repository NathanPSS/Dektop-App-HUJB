

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/estagiario/widgets/register_form_estagiario.dart';
import 'package:interface_sistema/widgets/base_screen.dart';


class RegisterScreenEstagiario extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseScreen(
     titleAppBar: "Cadastrar Estagiario",
      body: Container(
        alignment: Alignment.topCenter,
        child: RegisterEstagiarioForm(),
      ),
    );
  }
}