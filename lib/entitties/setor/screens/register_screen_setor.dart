

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/estagiario/widgets/register_form_estagiario.dart';
import 'package:interface_sistema/entitties/setor/widgets/register_form_setor.dart';
import 'package:interface_sistema/widgets/base_screen.dart';


class RegisterScreenSetor extends StatelessWidget {
  const RegisterScreenSetor({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseScreen(
      titleAppBar: "Cadastrar Setor",
      body: Container(
        alignment: Alignment.topCenter,
        child: RegisterSetorForm(),
      ),
    );
  }
}