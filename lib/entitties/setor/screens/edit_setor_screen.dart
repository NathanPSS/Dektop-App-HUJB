


import 'package:flutter/cupertino.dart';
import 'package:interface_sistema/entitties/setor/widgets/edit_setor_form.dart';

import '../../../widgets/base_screen.dart';

class EditSetorScreen extends StatelessWidget {

  final Map<String, dynamic> data;

  const EditSetorScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      titleAppBar: "Consulta",
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(40),
        child: EditSetorForm(data:  data),
      ),
    );
  }
}