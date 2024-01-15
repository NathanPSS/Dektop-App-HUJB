


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interface_sistema/global/dimensions_device.dart';
import 'package:interface_sistema/screens/functionalites_screen.dart';

class SelectionEntity extends StatelessWidget{

  final String imagePath;
  final String entityName;
  final Widget nextScreen;

  const SelectionEntity({super.key,required this.imagePath, required this.entityName, required this.nextScreen});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: InkWell(
        hoverColor: Color.fromRGBO(0, 165, 255, 0.1),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => nextScreen));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(imagePath),
            Container(
              margin: EdgeInsets.only(bottom: getDeviceHeight(context: context) * 0.16),
              child: Text(entityName,style: TextStyle(
                fontSize: getAverageDeviceSize(context: context) * 0.036
              ),),
            )
          ],
        ),
      ),
    );
  }
}