



import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/estagiario/widgets/registry_analisys_details.dart';
import 'package:interface_sistema/entitties/estagiario/widgets/registry_tile.dart';
import 'package:interface_sistema/widgets/base_screen.dart';



class AnalisysisRegistryScreen extends StatelessWidget {

  final String estagiarioName;
  final List<Map<String,dynamic>> dataAnalisysRegistries;

  const AnalisysisRegistryScreen({super.key, required this.dataAnalisysRegistries, required this.estagiarioName});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      titleAppBar: "Estagios de ${estagiarioName}",
      body: Container(
          child: dataAnalisysRegistries.isEmpty ?
          Center(child: Text("Não há Registros em Analise para esse Estagiario",style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),)) :
          ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: dataAnalisysRegistries.length,
              itemBuilder: (ctx,index) {
               return Container(padding: EdgeInsets.only(left: 40,right: 40),child: RegistryTile(data: dataAnalisysRegistries[index],dialogWidget: RegistryAnalisysDetails(data: dataAnalisysRegistries[index]),));
              })

      ),
    );
  }
}