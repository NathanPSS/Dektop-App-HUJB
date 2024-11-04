


import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/estagiario/widgets/text_card.dart';

class CardRegistrie extends StatelessWidget {
  
  final Map<String,dynamic> dataRegistrie;
  
  const CardRegistrie({super.key,required this.dataRegistrie});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: 240,
      decoration: BoxDecoration(color: Color.fromRGBO(240, 240, 240, 1.0)),
      child: Column(
        children: [
          Row(children: [
            TextCard(title: "Setor", content: dataRegistrie['setorNome']),
            TextCard(title: "Preceptor", content: dataRegistrie['preceptorNome'])
          ],),
          Row(
            children: [
              TextCard(title: "Horário Inicio", content: dataRegistrie['hrEntrada']),
              TextCard(title: "Horário Termino", content: dataRegistrie['hrSaida'])
            ],
          ),
          Row(children: [
            TextCard(title: "Tempo", content: dataRegistrie['tempo']),
            TextCard(title: "Data", content: dataRegistrie['data']),
          ],),
          TextCard(title: "Descrição", content: dataRegistrie['descricao'])
        ],
      ),
    );
  }

}