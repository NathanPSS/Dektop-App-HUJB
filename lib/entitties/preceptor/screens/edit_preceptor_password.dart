


import 'package:flutter/cupertino.dart';
import 'package:interface_sistema/entitties/preceptor/widgets/edit_form_preceptor.dart';

import '../../../widgets/base_screen.dart';

class EditPreceptorPassword extends StatelessWidget {
  const EditPreceptorPassword({super.key, required this.data});

  final Map<String,dynamic> data;

  @override
  Widget build(BuildContext context) {
    print(data.toString());
    return BaseScreen(
      titleAppBar: "Alterar Senha",
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(40),
        child: EditPreceptorPassword(data:  data),
      ),
    );
  }
}