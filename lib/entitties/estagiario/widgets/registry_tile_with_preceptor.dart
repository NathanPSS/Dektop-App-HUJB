



import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../global/dimensions_device.dart';

class RegistryTileWithPreceptor extends StatelessWidget {

  final Map<String,dynamic> data;
  final Widget dialogWidget;

  const RegistryTileWithPreceptor({super.key, required this.data, required this.dialogWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 56),
      decoration: BoxDecoration(color: Colors.white,border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.5),width: 3)
      ),
      ),
      width: getDeviceWith(context: context) * 0.8,
      height: 80,
      child: Container(
        padding: EdgeInsets.only(bottom: 16,top: 16,right: 32,left: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Text(data['setorNome'],style: TextStyle(fontSize: 24),),
              SizedBox(width: 64,),
              Text(data['data'],style:TextStyle(fontSize: 24)),
              SizedBox(width: 64,),
              Text(data['preceptorNome'],style:TextStyle(fontSize: 24)),
            ],),
            Container(
              // decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(12)),border: Border.all(color: Colors.red)),
                width: 40,height: 40,
                child: Material(
                  color: Colors.white,
                  shape: CircleBorder(),
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                    child: IconButton(
                        hoverColor: Colors.lightBlueAccent.withOpacity(0.2),
                        onPressed: (){
                          showDialog(context: context, builder: (ctx) => dialogWidget);
                        },
                        icon: Icon(FontAwesomeIcons.magnifyingGlass)),
                  ),
                ))
            //Icon(FontAwesomeIcons.magnifyingGlass)))
          ],
        ),
      ),
    );
  }
}