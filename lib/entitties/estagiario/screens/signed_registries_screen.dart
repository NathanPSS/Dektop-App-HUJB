


import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/estagiario/widgets/registry_accepted_details.dart';
import 'package:interface_sistema/entitties/estagiario/widgets/registry_analisys_details.dart';
import 'package:interface_sistema/widgets/base_screen.dart';


import '../widgets/registry_tile_with_preceptor.dart';

class SignedRegistriesScreen extends StatelessWidget {

  final List<Map<String,dynamic>> dataSignedRegistries;
  final String nameEstagiario;

  const SignedRegistriesScreen({super.key, required this.dataSignedRegistries, required this.nameEstagiario});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
    titleAppBar: "Estagios de ${nameEstagiario}",
      body: Container(
         
              child: dataSignedRegistries.isEmpty ?
              Center(child: Text("Não há Registros Assinados para esse Estagiario",style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold),)) :
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: dataSignedRegistries.length,
                  itemBuilder: (ctx,index) {
                   return Container(padding: EdgeInsets.only(right: 40,left: 40),child: RegistryTileWithPreceptor(data: dataSignedRegistries[index], dialogWidget: RegistryAcceptedDetails(data: dataSignedRegistries[index])));
                  })

      ),
    );
  }
}