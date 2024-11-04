import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/estagiario/api/data_manipulation_estagiario.dart';
import 'package:interface_sistema/entitties/estagiario/screens/data_screen.dart';
import 'package:interface_sistema/entitties/preceptor/api/data_manipulation_preceptor.dart';
import 'package:interface_sistema/entitties/preceptor/screens/data_screen.dart';
import 'package:interface_sistema/widgets/snackbar_notification.dart';

import '../../../global/dimensions_device.dart';



class ConsultFormPreceptor extends StatefulWidget {
  const ConsultFormPreceptor({super.key});

  @override
  State<ConsultFormPreceptor> createState() => _ConsultFormPreceptorState();
}

class _ConsultFormPreceptorState extends State<ConsultFormPreceptor> {
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
        padding: EdgeInsets.only(left: 16,right: 16,top: 16),
        width: getDeviceWith(context: context) * 0.2,
        height: 320,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Consulta',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: getDeviceHeight(context: context) * 0.04),
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
            SizedBox(height: getDeviceHeight(context: context) * 0.08),
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
                      findPreceptor(_usernameFieldController.text).then((value) {
                        if(value != null){
                          _usernameFieldController.text = '';
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => DataScreenPreceptor(data: value)));
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