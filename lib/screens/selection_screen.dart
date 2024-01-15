
import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/administracao/screens/functionalites_screen_administracao.dart';
import 'package:interface_sistema/entitties/estagiario/screens/functionalites_screen_estagiario.dart';
import 'package:interface_sistema/entitties/preceptor/functionalites_screen_preceptor.dart';
import 'package:interface_sistema/entitties/setor/screens/functionalites_screen_setor.dart';
import 'package:interface_sistema/global/dimensions_device.dart';
import 'package:interface_sistema/widgets/selection_entity.dart';

class SelectionScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
              height: getDeviceHeight(context: context),
              width: getDeviceWith(context: context) * 0.25,
              child: SelectionEntity(
                nextScreen: FunctionalitesScreenEstagiario(),
                imagePath: "images/Students-rafiki.png",
                entityName: "Estagiarios",
              ),
          ),
          Container(
            height: getDeviceHeight(context: context),
            width: getDeviceWith(context: context) * 0.25,
            child: SelectionEntity(
              nextScreen: FunctionalitesScreenPreceptor(),
              imagePath: "images/Doctors-rafiki.png",
              entityName: "Preceptores",
            ),
          ),
          Container(
            height: getDeviceHeight(context: context),
            width: getDeviceWith(context: context) * 0.25,
            child: SelectionEntity(
              nextScreen: FunctionalitesScreenAdministacao(),
              imagePath: "images/Shared-workspace-rafiki.png",
              entityName: "Administração",
            ),
          ),
            Container(
            height: getDeviceHeight(context: context),
    width: getDeviceWith(context: context) * 0.25,
    child: SelectionEntity(
      nextScreen: FunctionalitesScreenSetor(),
    imagePath: "images/Hospital building-cuate.png",
    entityName: "Setores",
    ))
        ],
      )
    );
  }
}