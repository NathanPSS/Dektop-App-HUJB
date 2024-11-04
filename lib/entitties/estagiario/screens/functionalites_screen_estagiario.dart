

import 'package:flutter/material.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interface_sistema/entitties/estagiario/screens/consult_screen.dart';
import 'package:interface_sistema/entitties/estagiario/screens/register_screen_estagiario.dart';
import 'package:interface_sistema/widgets/base_screen.dart';
import 'package:interface_sistema/widgets/functionalite_button.dart';

class FunctionalitesScreenEstagiario extends StatelessWidget{
  const FunctionalitesScreenEstagiario({super.key});

  @override
  Widget build(BuildContext context) {

    return BaseScreen(
      titleAppBar: "Funcionalidades dos Estagiarios",
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(32)),color: Colors.white),
          margin: EdgeInsets.all(40),
          child: Material(
            child: IntrinsicWidth(
              child: Row(
                children:  [
                 FunctionaliteButton(
                   buttonText: "Cadastrar",
                   icon: Icon(Icons.person_add_alt_1,size: 54,color: Colors.green[700],
                   ), action: () =>{
                     Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => RegisterScreenEstagiario()))
                 }
                    ,),
                  SizedBox(width: 40),
                  FunctionaliteButton(buttonText: "Consulta",icon:
                  Icon(Icons.person,size: 54,color: Colors.blueGrey[700]
                  ),
                    action: () =>{
                     Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ConsultScreenEstagiario()))
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