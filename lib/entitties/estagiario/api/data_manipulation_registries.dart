


import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Map<String,dynamic>>> findAllSignedRegistries(String matricula) async {
  var storage = await SharedPreferences.getInstance();

  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/admin/estagiario/signedRegistries');
  final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${(json.decode((storage.getString("desktop_jwt_token"))!)['token'])!}'
      },
      body: json.encode({'matricula': matricula})
  );
  if (response.statusCode == 200) {
    debugPrint(response.body.toString());
    return List<Map<String, dynamic>>.from(json.decode(response.body));

  }
  return [];
}
Future<List<Map<String,dynamic>>> findAllRejectedRegistries(String matricula) async {
  debugPrint(matricula);
  var storage = await SharedPreferences.getInstance();

  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/admin/estagiario/rejectedRegistries');
  final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${(json.decode((storage.getString("desktop_jwt_token"))!)['token'])!}'
      },
      body: json.encode({'matricula': matricula})
  );
  debugPrint(response.statusCode.toString());
  if (response.statusCode == 200) {
    return List<Map<String, dynamic>>.from(json.decode(response.body));

  }
  return [];
}
Future<List<Map<String,dynamic>>> findAllWithoutSignRegistries(String matricula) async {
  var storage = await SharedPreferences.getInstance();

  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/admin/estagiario/withoutSignRegistries');
  final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${(json.decode((storage.getString("desktop_jwt_token"))!)['token'])!}'
      },
      body: json.encode({'matricula': matricula})
  );
  if (response.statusCode == 200) {
    return List<Map<String, dynamic>>.from(json.decode(response.body));

  }
  return [];
}