

import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/setor/screens/register_screen_setor.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:interface_sistema/screens/ConsultScreen.dart';
import 'package:interface_sistema/widgets/functionalite_button.dart';

class FunctionalitesScreenSetor extends StatelessWidget{
  const FunctionalitesScreenSetor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueGrey,
        title: Text("Funcionalidades dos Setores",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
     //   decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        margin: EdgeInsets.all(40),
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
               Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ConsultScreen()))
              }
              ,),
          ],
        ),
      ),
    );
  }
}