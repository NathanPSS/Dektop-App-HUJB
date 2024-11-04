

import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/estagiario/api/data_manipulation_estagiario.dart';
import 'package:interface_sistema/entitties/estagiario/screens/functionalites_screen_estagiario.dart';
import 'package:interface_sistema/global/dimensions_device.dart';
import 'package:interface_sistema/screens/selection_screen.dart';

import '../../../widgets/snackbar_notification.dart';

class EditEstagiarioForm extends StatefulWidget {
  const EditEstagiarioForm({super.key, required this.data});

  final Map<String,dynamic> data;

  @override
  State<EditEstagiarioForm> createState() => _EditEstagiarioFormState();
}

class _EditEstagiarioFormState extends State<EditEstagiarioForm> {

  final TextEditingController _passwordFieldController = TextEditingController();
  final TextEditingController _nameFieldController = TextEditingController();
   bool isHover = false;

  @override
  void initState() {

    _nameFieldController.text = widget.data['nome'];
    super.initState();
  }

  @override
  void dispose() {
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
        height: 320,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Editar Dados',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
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
            SizedBox(height: 16),
         Container(
           alignment: Alignment.centerRight,
           width: getDeviceWith(context: context) * 0.2,
           child: InkWell(
                onTap:(){},
                child: Text("Alterar Senha",style: TextStyle(color: isHover ? Colors.blue : Colors.black,fontSize: 16),),
                onHover: (val) {
                  setState(() {
                    isHover = val;
                  });
                },
              ),
         ),
            SizedBox(height: 64),
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
                      editEstagiario(widget.data['matricula'],_nameFieldController.text,widget.data['usuarioId']).then((value) {
                        if(value){
                          showNotificationSnackBar(context,Colors.greenAccent[100]!,Colors.black,"Estagiario Editado com Sucesso");
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SelectionScreen()));
                        } else {
                          showNotificationSnackBar(context,Colors.redAccent[100]!, Colors.white, "Ocorreu um erro tente novamente mais Tarde");
                        }
                      });
                    },
                    child:  Text('Enviar',style: TextStyle(color: Colors.white,
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



