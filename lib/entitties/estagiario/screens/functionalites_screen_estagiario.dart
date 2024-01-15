

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interface_sistema/entitties/estagiario/screens/register_screen_estagiario.dart';
import 'package:interface_sistema/global/dimensions_device.dart';
import 'package:interface_sistema/screens/ConsultScreen.dart';
import 'package:interface_sistema/widgets/functionalite_button.dart';

class FunctionalitesScreenEstagiario extends StatelessWidget{
  const FunctionalitesScreenEstagiario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueGrey,
        title: Text("Funcionalidades dos Estagiarios",style: TextStyle(color: Colors.white),),
      ),
      body: Container(
     //   decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        margin: EdgeInsets.all(40),
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
               Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => ConsultScreen()))
              }
              ,),
            SizedBox(width: 40),
            FunctionaliteButton(buttonText: "Acompanhar\n    Alunos"
                ,icon:Icon(Icons.person_search,color: Colors.blue,size: 54,),
            action: () =>{},
            ),
          ],
        ),
      ),
    );
  }
}