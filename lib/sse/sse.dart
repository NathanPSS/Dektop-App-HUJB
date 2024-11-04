

import 'dart:convert';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:interface_sistema/entitties/setor/providers/logged_estagiarios_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void sseTest() async{
  var storage = await SharedPreferences.getInstance();

  SSEClient.subscribeToSSE(method: SSERequestType.GET,
    url: '${dotenv.env['API_BASE_URL']!}/admin/web-flux',
    header:  {
      'Authorization': 'Bearer ${(json.decode((storage.getString("desktop_jwt_token"))!)['token'])!}',
      "Accept": "text/event-stream",
      "Cache-Control": "no-cache",
    },
  ).listen((event) {


  });}
