


import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/estagiario/widgets/registry_rejected_details.dart';
import 'package:interface_sistema/entitties/estagiario/widgets/registry_tile_with_preceptor.dart';
import 'package:interface_sistema/widgets/base_screen.dart';

class RejectedRegistryScreen extends StatelessWidget {

  final List<Map<String,dynamic>> dataRejectedRegistries;
  final String nameEstagiario;

  const RejectedRegistryScreen({super.key, required this.dataRejectedRegistries, required this.nameEstagiario});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      titleAppBar: "Estagios de ${nameEstagiario}",
      body: Container(
          child: dataRejectedRegistries.isEmpty ?
          Center(child: Text("Não há Registros em Rejeitados para esse Estagiario",style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),)) :
          ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: dataRejectedRegistries.length,
              itemBuilder: (ctx,index) {
                return Container(padding: EdgeInsets.only(left: 40,right: 40),child: RegistryTileWithPreceptor(data: dataRejectedRegistries[index],dialogWidget: RegistryRejectDeatils(data: dataRejectedRegistries[index]),));
              })

      ),
    );
  }
}