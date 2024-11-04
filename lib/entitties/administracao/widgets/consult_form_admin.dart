import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/administracao/api/data_manipulation_admin.dart';
import 'package:interface_sistema/entitties/administracao/screens/data_admin_screen.dart';
import 'package:interface_sistema/entitties/estagiario/api/data_manipulation_estagiario.dart';
import 'package:interface_sistema/entitties/estagiario/screens/data_screen.dart';
import 'package:interface_sistema/widgets/snackbar_notification.dart';

import '../../../global/dimensions_device.dart';



class ConsultFormAdmin extends StatefulWidget {
  const ConsultFormAdmin({super.key});

  @override
  State<ConsultFormAdmin> createState() => _ConsultFormAdminState();
}

class _ConsultFormAdminState extends State<ConsultFormAdmin> {
  final TextEditingController _usernameFieldController = TextEditingController();


  @override
  void dispose() {
    _usernameFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(162,210,223,1),width: 1),color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(12))),
        margin: EdgeInsets.only(left: getDeviceWith(context: context) * 0.12,top: getDeviceHeight(context: context) * 0.2,bottom: getDeviceHeight(context: context) * 0.2),
        padding: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 32),
        width: getDeviceWith(context: context) * 0.2,
        height: 320,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Consulta',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _usernameFieldController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  label: Text(
                    'Matricula',
                    style: Theme.of(context).textTheme.bodySmall,
                  )),
            ),

            Container(
              decoration: BoxDecoration(
                //      border: Border.all(color: Colors.red),
              ),
              width: getDeviceWith(context: context) * 0.16,
              height: getDeviceHeight(context: context) * 0.056,
              //   decoration: BoxDecoration(border: Border.all(color: Colors.red)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(89,76,239,1)
                    ),
                    onPressed: () {
                      findAdmin(_usernameFieldController.text).then((value) {
                        if(value != null){
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => DataScreenAdmin(data: value)));
                        } else{
                          showNotificationSnackBarFail(context, "Ocorreu um erro na Consulta tente Novamente mais tarde");
                        }
                      });
                    },
                    child:  Text('Consultar',style: TextStyle(color: Colors.white,
                        fontSize:
                        getAverageDeviceSize(context: context) * 0.016
                    ),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}