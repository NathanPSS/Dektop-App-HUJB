


import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/preceptor/screens/consult_screen.dart';
import 'package:interface_sistema/entitties/preceptor/screens/data_screen.dart';
import 'package:interface_sistema/entitties/preceptor/screens/edit_preceptor_password.dart';
import 'package:interface_sistema/entitties/preceptor/screens/edit_preceptor_screen.dart';
import 'package:interface_sistema/global/dimensions_device.dart';
import 'package:interface_sistema/screens/functionalites_screen.dart';
import 'package:interface_sistema/screens/selection_screen.dart';
import 'package:interface_sistema/widgets/selection_entity.dart';
import 'package:interface_sistema/widgets/snackbar_notification.dart';

import '../../setor/api/data_manipulation_setor.dart';
import '../api/data_manipulation_preceptor.dart';
import '../screens/functionalites_screen_preceptor.dart';

class EditFormPreceptor extends StatefulWidget {

  final Map<String,dynamic> data;

  const EditFormPreceptor({super.key, required this.data});

  @override
  State<EditFormPreceptor> createState() => _EditFormPreceptorState();
}

class _EditFormPreceptorState extends State<EditFormPreceptor> {

  Object? idSetor;

  late final Map<String,dynamic> data;

  bool isHover = false;

  final TextEditingController _nameFieldController = TextEditingController();

  @override
  void initState() {
    data = widget.data;
    _nameFieldController.text = widget.data['nome'];
    idSetor = widget.data['setorId'];
    super.initState();
  }


  void _navigateToEditPreceptorPassword() {
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => EditPreceptorPassword(data: widget.data)));
    return;
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
            SizedBox(height: 40,),
            Container(
              alignment: Alignment.centerRight,
              width: getDeviceWith(context: context) * 0.2,
              child: Material(
                child: InkWell(
                  onTap:_navigateToEditPreceptorPassword,
                  child: Text("Alterar Senha",style: TextStyle(color: isHover ? Colors.blue : Colors.black,fontSize: 16),),
                  onHover: (val) {
                    setState(() {
                      isHover = val;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: getDeviceHeight(context: context) * 0.048),
            FutureBuilder(
                future: getAllSetores(),
                builder: (ctx,snapshot) {
                  if(snapshot.connectionState == ConnectionState.done){
                    return DropdownButtonFormField(
                      value: widget.data['setorId'],
                      focusColor: Colors.white,
                      items: snapshot.data!.map((e) => DropdownMenuItem(child: Text(e['nome']),value: e['id'],)).toList(),
                      onChanged: (Object? value) {
                        idSetor = value!;
                        debugPrint(idSetor.toString());
                      },
                    );
                  }
                  return CircularProgressIndicator();
                }),
            SizedBox(height: 120),
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
                      editPreceptor(widget.data['matricula'],_nameFieldController.text,idSetor,widget.data['usuarioId']).then((value) {
                        if(value){
                          showNotificationSnackBar(context,Colors.greenAccent[100]!,Colors.black,"Preceptor Editado com Sucesso");
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SelectionScreen()));
                        } else {
                          showNotificationSnackBar(context,Colors.redAccent[100]!, Colors.white, "Ocorreu um erro tente novamente mais Tarde");
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