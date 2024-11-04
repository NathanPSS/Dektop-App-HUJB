

import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/administracao/api/data_manipulation_admin.dart';
import 'package:interface_sistema/global/dimensions_device.dart';
import 'package:interface_sistema/screens/selection_screen.dart';
import 'package:interface_sistema/widgets/snackbar_notification.dart';

class RegisterAdministracaoForm extends StatefulWidget {
  const RegisterAdministracaoForm({super.key});

  @override
  State<RegisterAdministracaoForm> createState() => _RegisterAdministracaoFormState();
}

class _RegisterAdministracaoFormState extends State<RegisterAdministracaoForm> {
  final TextEditingController _usernameFieldController = TextEditingController();
  final TextEditingController _passwordFieldController = TextEditingController();
  final TextEditingController _nameFieldController = TextEditingController();


  @override
  void dispose() {
    _usernameFieldController.dispose();
    _passwordFieldController.dispose();
    _nameFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(162,210,223,1),width: 1),color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(12))),
        margin: EdgeInsets.only(left: getDeviceWith(context: context) * 0.12,top: getDeviceHeight(context: context) * 0.12,bottom: getDeviceHeight(context: context) * 0.2),
        padding: EdgeInsets.only(left: 16,right: 16,top: 16),
        width: getDeviceWith(context: context) * 0.2,
        height: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Cadastrar',
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
            SizedBox(height: getDeviceHeight(context: context) * 0.048),
            TextFormField(
              obscureText: true,
              keyboardType: TextInputType.number,
              controller: _passwordFieldController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  label: Text(
                    'Senha',
                    style: Theme.of(context).textTheme.bodySmall,
                  )),
            ),
            SizedBox(height: getDeviceHeight(context: context) * 0.048),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: _nameFieldController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  label: Text(
                    'Nome',
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
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(89,76,239,1)
                    ),
                    onPressed: () {
                      createAdmin(_usernameFieldController.text,_nameFieldController.text,_passwordFieldController.text).then((value) {
                        if(value){
                          showNotificationSnackBarSucess(context, "Admin criado com sucesso");
                          Navigator.of(context).pop();
                        } else{
                          showNotificationSnackBarFail(context, "Falha ao criar um admin");
                        }
                      });
                    },
                    child:  Text('Cadastrar',style: TextStyle(color: Colors.white,
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
