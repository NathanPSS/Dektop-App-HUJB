import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/estagiario/api/data_manipulation_estagiario.dart';
import 'package:interface_sistema/entitties/estagiario/screens/data_screen.dart';
import 'package:interface_sistema/widgets/snackbar_notification.dart';

import '../../../global/dimensions_device.dart';



class ConsultFormEstagiario extends StatefulWidget {
  const ConsultFormEstagiario({super.key});

  @override
  State<ConsultFormEstagiario> createState() => _ConsultFormEstagiarioState();
}

class _ConsultFormEstagiarioState extends State<ConsultFormEstagiario> {
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
                      findEstagiario(_usernameFieldController.text).then((value) {
                        if(value != null){
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => DataScreenEstagiario(data: value)));
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