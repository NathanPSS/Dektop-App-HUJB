


import 'package:flutter/cupertino.dart';
import 'package:interface_sistema/entitties/administracao/widgets/edit_admin_form.dart';

import '../../../widgets/base_screen.dart';

class EditAdminScreen extends StatelessWidget {

  final Map<String,dynamic> data;

  const EditAdminScreen({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      titleAppBar: "Editar Admin",
      body: Container(
        alignment: Alignment.topCenter,
        child: EditAdminForm(data: data,),
      ),
    );
  }
}