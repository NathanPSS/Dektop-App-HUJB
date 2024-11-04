


import 'package:flutter/material.dart';
import 'package:interface_sistema/widgets/base_screen.dart';

import '../widgets/register_form_preceptor.dart';


class RegisterScreenPreceptor extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BaseScreen(
      titleAppBar: "Cadastrar Preceptor",
      body: Center(child: RegisterPreceptorForm()),
      );
  }
}