


import 'package:flutter/material.dart';
import 'package:interface_sistema/entitties/estagiario/api/data_manipulation_estagiario.dart';
import 'package:interface_sistema/entitties/estagiario/screens/data_screen.dart';

class LoggedEstagiarioTile extends StatelessWidget {

  final String nome;
  final String matricula;

  const LoggedEstagiarioTile({super.key, required this.nome, required this.matricula});

  @override
  Widget build(BuildContext context) {
    return Container(
      //  decoration: BoxDecoration(color: Colors.white),
        width: 480,
        height: 80,
        child: InkWell(
          onTap: (){
            findEstagiario(matricula).then((value) {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => DataScreenEstagiario(data: value!)));
            });
          },
          hoverColor: Colors.lightBlueAccent.withOpacity(0.3),
          child: Row(
            children: [
                SizedBox(width: 24,),
                Container(decoration: BoxDecoration(shape: BoxShape.circle,color:Colors.green),width: 20,height: 20),
                SizedBox(width: 24,),
                Icon(Icons.person,size: 36,),
                SizedBox(width: 40,),
                Text(nome,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
            ],
          ),
        ),
    );
  }
}