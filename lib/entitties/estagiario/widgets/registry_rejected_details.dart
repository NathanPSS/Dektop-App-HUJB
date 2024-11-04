


import 'package:flutter/material.dart';

class RegistryRejectDeatils extends StatelessWidget {

  final Map<String,dynamic> data;

  const RegistryRejectDeatils({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(40),
        width: 760,
        height: 760,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //    decoration: BoxDecoration(border: Border.all(color:Colors.red)),
              height: 240,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Setor",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                          Text(data['setorNome'],style: TextStyle(fontSize: 20),)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Horario de Inicio",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                          Text(data['hrEntrada'],style: TextStyle(fontSize: 20))
                        ],),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Horario de Termino",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                          Text(data['hrSaida'],style: TextStyle(fontSize: 20))
                        ],)
                    ],),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Preceptor",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                          Text(data['preceptorNome'],style: TextStyle(fontSize: 20),)
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tempo",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                          Text(data['tempo'],style: TextStyle(fontSize: 20))
                        ],),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Data",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                          Text(data['data'],style: TextStyle(fontSize: 20))
                        ],)
                    ],),
                ],
              ),
            ),
            SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Motivo de Rejeicao",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                Text(data['motivo'],style: TextStyle(fontSize: 18))
              ],),
            SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Descricao do Registro Pelo Aluno",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold)),
                Text(data['descricao'],style: TextStyle(fontSize: 18))
              ],),

          ],),
      ),
    );
  }
}