
import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/estagiario/widgets/consult_form.dart';
import 'package:interface_sistema/widgets/base_screen.dart';


class ConsultScreenEstagiario extends StatelessWidget {
  const ConsultScreenEstagiario({super.key});

  @override
  Widget build(BuildContext context) {

    return BaseScreen(
      titleAppBar: "Consulta",
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(40),
        child: ConsultFormEstagiario(),
      ),
    );
  }
}