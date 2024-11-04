

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/estagiario/widgets/edit_estagiario_form.dart';
import 'package:interface_sistema/entitties/estagiario/widgets/register_form_estagiario.dart';
import 'package:interface_sistema/widgets/base_screen.dart';


class EditScreenEstagiario extends StatelessWidget {

  final Map<String,dynamic> data;

  const EditScreenEstagiario({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseScreen(
      titleAppBar: "Editar Estagiario",
      body: Container(
        alignment: Alignment.topCenter,
        child: EditEstagiarioForm(data: data,),
      ),
    );
  }
}