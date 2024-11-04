import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interface_sistema/entitties/administracao/screens/functionalites_screen_administracao.dart';
import 'package:interface_sistema/entitties/estagiario/screens/functionalites_screen_estagiario.dart';
import 'package:interface_sistema/entitties/setor/screens/functionalites_screen_setor.dart';
import 'package:interface_sistema/screens/login_screen.dart';

import 'entitties/preceptor/screens/functionalites_screen_preceptor.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        routes: {
          '/functionalitesPreceptorScreen' : (ctx) => FunctionalitesScreenPreceptor(),
          '/functionalitesScreenEstagiario' : (ctx) => FunctionalitesScreenEstagiario(),
          '/functionalitesScreenAdministacao' : (ctx) => FunctionalitesScreenAdministacao(),
          '/functionalitesScreenSetor' : (ctx) => FunctionalitesScreenSetor()
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen()
      ),
    );
  }
}

