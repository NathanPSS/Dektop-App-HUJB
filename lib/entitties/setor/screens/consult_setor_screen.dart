



import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/setor/widgets/consult_form_setor.dart';
import 'package:interface_sistema/widgets/base_screen.dart';

class ConsultSetorScreen extends StatelessWidget {

  List<Map<String,dynamic>> data;

  ConsultSetorScreen({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseScreen(
       titleAppBar: "Consultar Setor",
      body: Center(child: ConsultFormSetor(data: data,))
    );
  }
}