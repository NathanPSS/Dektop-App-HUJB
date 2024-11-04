import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/setor/widgets/consult_form_setor.dart';
import 'package:interface_sistema/widgets/base_screen.dart';

import '../widgets/remove_form_setor.dart';

class RemoveSetorScreen extends StatelessWidget {

  List<Map<String,dynamic>> data;

  RemoveSetorScreen({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseScreen(
        titleAppBar: "Cadastrar Setor",
        body: Center(child: RemoveFormSetor(data: data,))
    );
  }
}