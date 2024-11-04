



import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interface_sistema/entitties/setor/providers/logged_estagiarios_provider.dart';
import 'package:interface_sistema/entitties/setor/widgets/logged_estagiario_tile.dart';
import 'package:interface_sistema/global/dimensions_device.dart';

class LoggedEstagiarioPanel extends ConsumerWidget {

  final int idSetor;

  const LoggedEstagiarioPanel({super.key, required this.idSetor});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return Container(
      width: 480,
      decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.black.withOpacity(0.3),width: 1))),
      child: Column(children: [
        Container(
          padding: EdgeInsets.all(24),
            child:
            Row(
              children: [
                Text("Alunos em Estagio no Setor",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                SizedBox(width: 40),
              ],
            ),
        ),
        Container(
          child:
          ref.watch(sseMessageController).where((element) => element['setorId'] == idSetor).toList().isNotEmpty ?
          Column(
            children: ref.watch(sseMessageController).where((element) => element['setorId'] == idSetor).toList().map((e) => LoggedEstagiarioTile(nome: e['nome'],matricula: e['matricula'],)).toList()
          ) :
              Container(margin: EdgeInsets.all(24),height: 400,child: Center(child: Text("Não há alunos em estagio nesse setor no momento",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),),))
        ),]
    )
    );
  }
}