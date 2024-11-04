

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:interface_sistema/entitties/estagiario/api/data_manipulation_registries.dart';
import 'package:interface_sistema/entitties/estagiario/screens/analisysis_registry_screen.dart';
import 'package:interface_sistema/entitties/estagiario/screens/consult_screen.dart';
import 'package:interface_sistema/entitties/estagiario/screens/register_screen_estagiario.dart';
import 'package:interface_sistema/entitties/estagiario/screens/rejected_registry_screen.dart';
import 'package:interface_sistema/entitties/estagiario/screens/signed_registries_screen.dart';
import 'package:interface_sistema/global/dimensions_device.dart';
import 'package:interface_sistema/screens/ConsultScreen.dart';
import 'package:interface_sistema/widgets/base_screen.dart';
import 'package:interface_sistema/widgets/functionalite_button.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SelectTypeRegistries extends StatelessWidget{

  final String matricula;
  final String estagiarioNome;

  const SelectTypeRegistries({super.key, required this.matricula, required this.estagiarioNome});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      titleAppBar: "Tipos de Registro dos Estagiarios",
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(32)),
          margin:const EdgeInsets.all(40),
          child: Material(
            child: IntrinsicWidth(
              child: Row(
                children:  [
                  FunctionaliteButton(
                    buttonText: "Registros Em Analise",
                    icon: Icon(MdiIcons.textBox,size: 54,color: Colors.blueGrey[700],
                    ), action: () =>{
                    findAllWithoutSignRegistries(matricula).then((value) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => AnalisysisRegistryScreen(dataAnalisysRegistries: value,estagiarioName: estagiarioNome,)));
                    })
                  }
                    ,),
                  SizedBox(width: 40),
                  FunctionaliteButton(buttonText: "Registros Assinados"
                    ,icon:Icon(MdiIcons.textBoxCheck,color: Colors.green,size: 54,),
                    action: () =>{
                       findAllSignedRegistries(matricula).then((value) {
                         Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SignedRegistriesScreen(dataSignedRegistries: value, nameEstagiario: estagiarioNome)));
                       })
                    },
                  ),
                  SizedBox(width: 40),
                  FunctionaliteButton(buttonText: "Registros Rejeitados",icon:
                  Icon(MdiIcons.textBoxRemove,size: 54,color: Colors.red[700]
                  ),
                    action: () =>{
                      findAllRejectedRegistries(matricula).then((value) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => RejectedRegistryScreen(dataRejectedRegistries: value, nameEstagiario: estagiarioNome)));
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