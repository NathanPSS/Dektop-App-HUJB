
import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/administracao/api/data_manipulation_admin.dart';
import 'package:interface_sistema/entitties/estagiario/api/data_manipulation_estagiario.dart';
import 'package:interface_sistema/entitties/estagiario/screens/select_type_registries_screen.dart';
import 'package:interface_sistema/global/dimensions_device.dart';
import 'package:interface_sistema/widgets/base_screen.dart';
import 'package:interface_sistema/widgets/snackbar_notification.dart';

import 'edit_admin_screen.dart';


class DataScreenAdmin extends StatelessWidget{
  const DataScreenAdmin({super.key, required this.data});

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
                Text("Nome do Admin",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                Text(data['nome'],style: TextStyle(fontSize: 20),),
                SizedBox(height: 40),
                Container(
                  child: IntrinsicWidth(
                    child: Row(
                      children: [
                        Container(
                          height: 48,
                          child: ElevatedButton(onPressed: (){
                               Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => EditAdminScreen(data: data)));
                          }, child: Text("Editar Administrador",style: TextStyle(color: Colors.white,fontSize: 18),),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),),
                        ),
                        SizedBox(width: 40),
                        Container(
                          height: 48,
                          child: ElevatedButton(onPressed: (){
                            deleteAdmin(data['matricula']).then((value) {
                              if(value) {
                                showNotificationSnackBarSucess(context, "Administrador Removido com Sucesso");
                                Navigator.of(context).pop();
                              } else {
                                showNotificationSnackBarFail(context, "Falha ao Deletar o Administrador");
                              }
                            });
                          }, child: Text("Remover Administrador",style: TextStyle(color: Colors.white,fontSize: 18),),
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