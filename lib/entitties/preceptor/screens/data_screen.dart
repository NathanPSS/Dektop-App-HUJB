
import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/estagiario/api/data_manipulation_estagiario.dart';
import 'package:interface_sistema/entitties/estagiario/screens/signed_registries_screen.dart';
import 'package:interface_sistema/entitties/preceptor/api/data_manipulation_preceptor.dart';
import 'package:interface_sistema/entitties/preceptor/screens/edit_preceptor_screen.dart';
import 'package:interface_sistema/global/dimensions_device.dart';
import 'package:interface_sistema/widgets/base_screen.dart';
import 'package:interface_sistema/widgets/snackbar_notification.dart';

import '../../../screens/selection_screen.dart';

class DataScreenPreceptor extends StatelessWidget{
  const DataScreenPreceptor({super.key, required this.data});

  final Map<String,dynamic> data;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseScreen(
      titleAppBar: "Dados",
body: Center(
  child:   Container(
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
                Text("Nome do Preceptor",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                Text(data['nome'],style: TextStyle(fontSize: 20),),
                SizedBox(height: 40,),
                Text("Setor",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                Text(data['setorNome'],style: TextStyle(fontSize: 20),),
                SizedBox(height: 40,),
                Container(
              //    margin: EdgeInsets.only(top: getDeviceHeight(context: context) * 0.54,left: getDeviceWith(context: context) * 0.4),
                  child: IntrinsicWidth(
                    child: Row(
                      children: [
                        SizedBox(width: 40),
                        Container(
                          height: 48,
                          child: ElevatedButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (ctx) => EditPreceptorScreen(data: data)));
                          }, child: Text("Editar Preceptor",style: TextStyle(color: Colors.white,fontSize: 18),),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),),
                        ),
                        SizedBox(width: 40),
                        Container(
                          height: 48,
                          child: ElevatedButton(onPressed: (){
                            deletePreceptor(data['matricula']).then((value) {
                             if(value){
                               showNotificationSnackBarSucess(context, "Preceptor Deletado com Sucesso");
                               Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SelectionScreen()));
                             } else {
                               showNotificationSnackBarFail(context, "Ocorreu um Erro");
                             }
                            });
                          }, child: Text("Remover Preceptor",style: TextStyle(color: Colors.white,fontSize: 18),),
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