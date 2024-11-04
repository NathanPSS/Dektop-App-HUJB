


import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/preceptor/api/data_manipulation_preceptor.dart';
import 'package:interface_sistema/screens/selection_screen.dart';

import '../../../global/dimensions_device.dart';
import '../../../widgets/snackbar_notification.dart';

class EditFormPassword extends StatefulWidget{

  final Map<String,dynamic> data;

  const EditFormPassword({super.key, required this.data});

  @override
  State<EditFormPassword> createState() => _EditFormPasswordState();
}

class _EditFormPasswordState extends State<EditFormPassword> {

  final TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(162,210,223,1),width: 1),color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(12))),
        margin: EdgeInsets.only(top: 40,bottom: getDeviceHeight(context: context) * 0.1),
        padding: EdgeInsets.only(left: 16,right: 16,top: 16),
        width: getDeviceWith(context: context) * 0.2,
        height: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Editar Preceptor',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: getDeviceHeight(context: context) * 0.048),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  label: Text(
                    'Nome',
                    style: Theme.of(context).textTheme.bodySmall,
                  )),
            ),
            SizedBox(height: 120),
            Container(
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
                      editPasswordPreceptor(widget.data['matricula'],_passwordController.text,).then((value) {
                        if(value){
                          showNotificationSnackBar(context,Colors.greenAccent[100]!,Colors.black,"Senha alterada com Sucesso");
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SelectionScreen()));
                        } else {
                          showNotificationSnackBar(context,Colors.redAccent[100]!, Colors.white, "Ocorreu um erro tente novamente mais Tarde");
                        }
                      });
                    },
                    child:  Text('Alterar Senha',style: TextStyle(color: Colors.white,
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