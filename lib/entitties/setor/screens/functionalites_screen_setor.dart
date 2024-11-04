

import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/setor/api/data_manipulation_setor.dart';
import 'package:interface_sistema/entitties/setor/screens/consult_setor_screen.dart';
import 'package:interface_sistema/entitties/setor/screens/register_screen_setor.dart';
import 'package:interface_sistema/entitties/setor/screens/remove_setor_screen.dart';
import 'package:interface_sistema/widgets/base_screen.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:interface_sistema/screens/ConsultScreen.dart';
import 'package:interface_sistema/widgets/functionalite_button.dart';

class FunctionalitesScreenSetor extends StatelessWidget{
  const FunctionalitesScreenSetor({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      titleAppBar: "Funcionalidades dos Setores",
      body: Center(
        child: Container(
     padding: EdgeInsets.all(32),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(32),), color: Colors.white),
          margin: EdgeInsets.all(40),
          child: Material(
            child: IntrinsicWidth(
              child: Row(
                children:  [
                 FunctionaliteButton(
                   buttonText: "Cadastrar",
                   icon: Icon(MdiIcons.officeBuildingPlus,size: 54,color: Colors.green[700],
                   ), action: () =>{
                     Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => RegisterScreenSetor()))
                 }
                    ,),
                  SizedBox(width: 40),
                  FunctionaliteButton(buttonText: "Consulta",icon:
                  Icon(MdiIcons.officeBuilding,size: 54,color: Colors.blueGrey[700]
                  ),
                    action: () =>{
                     getAllSetores().then((value) {

                       Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ConsultSetorScreen(data:value)));
                     })
                    }
                    ,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}