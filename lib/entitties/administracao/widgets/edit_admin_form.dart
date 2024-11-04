


import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/administracao/api/data_manipulation_admin.dart';
import 'package:interface_sistema/screens/selection_screen.dart';

import '../../../global/dimensions_device.dart';
import '../../../widgets/snackbar_notification.dart';

class EditAdminForm extends StatefulWidget {

  final Map<String,dynamic> data;

  const EditAdminForm({super.key, required this.data});

  @override
  State<EditAdminForm> createState() => _EditAdminFormState();
}

class _EditAdminFormState extends State<EditAdminForm> {

  final TextEditingController _nameFieldController = TextEditingController();

  @override
  void initState() {
    _nameFieldController.text = widget.data['nome'];
    super.initState();
  }

  @override
  void dispose() {
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
        height: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Editar Admin',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),
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
            SizedBox(height: 160),
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
                      editAdmin(widget.data['matricula'],_nameFieldController.text,widget.data['usuarioId']).then((value) {
                        if(value){
                          showNotificationSnackBarSucess(context, "Admin editado com sucesso");
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SelectionScreen()));
                        } else{
                          showNotificationSnackBarFail(context, "Ocorreu um erro tente novamente mais tarde");
                        }
                      });
                    },
                    child:  Text('Editar',style: TextStyle(color: Colors.white,
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