


import 'package:flutter/cupertino.dart';
import 'package:interface_sistema/entitties/preceptor/widgets/edit_form_preceptor.dart';
import 'package:interface_sistema/widgets/base_screen.dart';

class EditPreceptorScreen extends StatelessWidget {

  final Map<String,dynamic> data;

  const EditPreceptorScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      titleAppBar: "Editar Preceptor",
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(40),
        child: EditFormPreceptor(data:  data),
      ),
    );
  }
}