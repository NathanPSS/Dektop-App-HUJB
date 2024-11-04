

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interface_sistema/entitties/administracao/screens/consult_admin_screen.dart';
import 'package:interface_sistema/entitties/administracao/screens/register_screen_administracao.dart';
import 'package:interface_sistema/global/dimensions_device.dart';
import 'package:interface_sistema/screens/ConsultScreen.dart';
import 'package:interface_sistema/widgets/base_screen.dart';
import 'package:interface_sistema/widgets/functionalite_button.dart';

class FunctionalitesScreenAdministacao extends StatelessWidget{
  const FunctionalitesScreenAdministacao({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
     titleAppBar: "Funcionalidades Administracao",
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(32))),
          margin: EdgeInsets.all(40),
          child: IntrinsicWidth(
            child: Material(
              child: Row(
                children:  [
                 FunctionaliteButton(
                   buttonText: "Cadastrar",
                   icon: Icon(Icons.person_add_alt_1,size: 54,color: Colors.green[700],
                   ), action: () =>{
                     Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => RegisterScreenAdministracao()))
                 }
                    ,),
                  SizedBox(width: 40),
                  FunctionaliteButton(buttonText: "Consulta",icon:
                  Icon(Icons.person,size: 54,color: Colors.blueGrey[700]
                  ),
                    action: () =>{
                     Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ConsultScreenAdmin()))
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