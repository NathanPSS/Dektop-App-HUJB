
import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/estagiario/api/data_manipulation_estagiario.dart';
import 'package:interface_sistema/entitties/estagiario/screens/edit_estagiario_screen.dart';
import 'package:interface_sistema/entitties/estagiario/screens/select_type_registries_screen.dart';
import 'package:interface_sistema/global/dimensions_device.dart';
import 'package:interface_sistema/widgets/base_screen.dart';
import 'package:interface_sistema/widgets/snackbar_notification.dart';

import '../api/data_manipulation_registries.dart';

class DataScreenEstagiario extends StatelessWidget{
  const DataScreenEstagiario({super.key, required this.data});

  final Map<String,dynamic> data;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseScreen(
      titleAppBar: "Dados",
      body: Center(
        child: Container(
          margin: EdgeInsets.all(40),
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(32))),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Matricula",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                Text(data['matricula'],style: TextStyle(fontSize: 20),),
                SizedBox(height: 40,),
                Text("Nome do Aluno",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                Text(data['nome'],style: TextStyle(fontSize: 20),),
                SizedBox(height: 40),
                Container(
                  child: IntrinsicWidth(
                    child: Row(
                      children: [
                        Container(
                          height: 48,
                          child: ElevatedButton(onPressed: (){
                            findAllSignedRegistries(data['matricula']).then((value) {
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SelectTypeRegistries(matricula: data['matricula'],estagiarioNome: data['nome'],)));
                            });
                          }, child:
                          Text("Ver Estagios",style: TextStyle(color: Colors.white,fontSize: 18),),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),),
                        ),
                        SizedBox(width: 40),
                        Container(
                          height: 48,
                          child: ElevatedButton(onPressed: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => EditScreenEstagiario(data: data,)));
                          }, child: Text("Editar Estagiario",style: TextStyle(color: Colors.white,fontSize: 18),),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),),
                        ),
                        SizedBox(width: 40),
                        Container(
                          height: 48,
                          child: ElevatedButton(onPressed: (){
                            deleteEstagiario(data['matricula']).then((value) {
                              if(value) {
                                showNotificationSnackBarSucess(context, "Estagiario Removido com Sucesso");
                                Navigator.of(context).pop();
                              } else {
                                showNotificationSnackBarFail(context, "Falha ao Deletar o Estagiario");
                              }
                            });
                          }, child: Text("Remover Estagiario",style: TextStyle(color: Colors.white,fontSize: 18),),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}