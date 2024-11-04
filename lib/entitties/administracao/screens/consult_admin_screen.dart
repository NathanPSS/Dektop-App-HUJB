
import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/administracao/widgets/consult_form_admin.dart';
import 'package:interface_sistema/widgets/base_screen.dart';


class ConsultScreenAdmin extends StatelessWidget {
  const ConsultScreenAdmin({super.key});

  @override
  Widget build(BuildContext context) {

    return BaseScreen(
      titleAppBar: "Consulta",
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(40),
        child: ConsultFormAdmin(),
      ),
    );
  }
}