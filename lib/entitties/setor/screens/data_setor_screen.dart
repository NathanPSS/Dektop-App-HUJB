
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interface_sistema/entitties/setor/api/data_manipulation_setor.dart';
import 'package:interface_sistema/entitties/setor/widgets/logged_estagiario_panel.dart';
import 'package:interface_sistema/screens/selection_screen.dart';


import 'dart:math';

import '../../../widgets/snackbar_notification.dart';
import 'edit_setor_screen.dart';



class DataSetorScreen extends StatelessWidget {

  final Map<String, dynamic> data;

  const DataSetorScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Color.fromRGBO(223, 247, 250,1),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color.fromRGBO(137, 167, 194, 1.0),
        title: Text(
          "Dados",
          style: TextStyle(color: Colors.white),
        ),
      ),
      endDrawer: SizedBox(
      height: 1000,
      width: 400,
      child: Drawer(
        elevation: 0,
        backgroundColor: Colors.white,
        child:LoggedEstagiarioPanel(idSetor: data['id'])
      ),
    ),
      body: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
           padding: EdgeInsets.only(left: 64),
                width: 420,
                height: 300,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(64)),color: Colors.white),
                margin: EdgeInsets.all(40),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Id do Setor",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      Text(
                        data['id'].toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text("Nome",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                      Text(
                        data['nome'],
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 40,),
                      Row(
                        children: [
                          Container(
                            height: 48,
                            child: ElevatedButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => EditSetorScreen(data: data)));
                            }, child: Text("Editar Setor",style: TextStyle(color: Colors.white,fontSize: 18),),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),),
                          ),
                          SizedBox(width: 40),
                          Container(
                            height: 48,
                            child: ElevatedButton(onPressed: (){
                             deleteSetor(data['id']).then((value) {
                               if(value){
                                 showNotificationSnackBarSucess(context, "Setor Removido com sucesso");
                                 Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SelectionScreen()));
                               }else {
                                 showNotificationSnackBarFail(context, "Ocorreu um erro tente novamente mais tarde");
                               }

                             });
                            }, child: Text("Remover Setor",style: TextStyle(color: Colors.white,fontSize: 18),),
                              style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
         Row(children: [
            Consumer(
             builder: (context,ref,child) {

               return Stack(
                 children:[ ClipPath(
                   clipper: SShapeClipper(),
                   child: Container(
                       width: 92,
                       height: 92,
                       color: Colors.white,
                       padding: EdgeInsets.all(16),
                     child:
                         FloatingActionButton(onPressed: (){
                           Scaffold.of(context).openEndDrawer();
                         },child: Icon(Icons.person,size: 32,),),

                     ),
                   ),
    ]
               );
             }
           ),
           //
           //     LoggedEstagiarioPanel(idSetor:data['id']
         ],),
            ],
          ),
        ),
      ),
    );
  }
}
class SShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // I've taken approximate height of curved part of view
    // Change it if you have exact spec for it
    final roundingHeight = size.height * 0.5;

    // this is top part of path, rectangle without any rounding
    final filledRectangle =
    Rect.fromLTRB(size.height - roundingHeight,size.width, size.width,0);

    // this is rectangle that will be used to draw arc
    // arc is drawn from center of this rectangle, so it's height has to be twice roundingHeight
    // also I made it to go 5 units out of screen on left and right, so curve will have some incline there
    final roundingRectangle = Rect.fromLTRB(
        size.height - roundingHeight * 2,0, size.height, size.width);

    final path = Path();
    path.addRect(filledRectangle);

    // so as I wrote before: arc is drawn from center of roundingRectangle
    // 2nd and 3rd arguments are angles from center to arc start and end points
    // 4th argument is set to true to move path to rectangle center, so we don't have to move it manually
    path.arcTo(roundingRectangle, pi / 2, pi, true);
    path.close();

    return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
