


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/setor/screens/data_setor_screen.dart';

import '../../../global/dimensions_device.dart';
import '../../../widgets/snackbar_notification.dart';
import '../api/data_manipulation_setor.dart';

class ConsultFormSetor extends StatelessWidget{

  late Object? idSetorValue;
  Map<int,Map<String,dynamic>> setorPosition= {};
  List<Map<String,dynamic>> data;

  ConsultFormSetor({super.key,required this.data});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Color.fromRGBO(162,210,223,1),width: 1),color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(12))),
        margin: EdgeInsets.only(top: 40,bottom: getDeviceHeight(context: context) * 0.1),
        padding: EdgeInsets.only(left: 16,right: 16,top: 16),
        width: getDeviceWith(context: context) * 0.2,
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Consultar',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: getDeviceHeight(context: context) * 0.048),
            FutureBuilder(
                future: getAllSetores(),
                builder: (ctx,snapshot) {
                  if(snapshot.connectionState == ConnectionState.done){
                    idSetorValue = data[0]['id'];

                    return DropdownButtonFormField(
                      value: data[0]['id'],
                      focusColor: Colors.white,
                      items: data.map((e) {
                        setorPosition[e['id']] = e;
                        return DropdownMenuItem(child: Text(e['nome']),value: e['id']);
                      }).toList(),
                      onChanged: (Object? value) {
                        idSetorValue = value;
                     //   debugPrint(setorPosition[idSetorValue].toString());
                      },
                    );
                  }
                  return CircularProgressIndicator();
                }),
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
                     Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => DataSetorScreen(data: setorPosition[idSetorValue]!)));
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