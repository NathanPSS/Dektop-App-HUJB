


import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> createPreceptor(String matricula,String nome,String password,dynamic idSetor) async {
  var storage = await SharedPreferences.getInstance();

  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/admin/preceptor/create');
  final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${(json.decode((storage.getString("desktop_jwt_token"))!)['token'])!}'
      },
      body: json.encode({'nome' : nome,'matricula': matricula,'password': password,'idSetor': idSetor})
  );
  if (response.statusCode == 201) {
    return true;
  }
  return false;
}
Future<bool> editPasswordPreceptor(String matricula,String password) async {

  var storage = await SharedPreferences.getInstance();

  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/admin/preceptor/password');
  final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${(json.decode((storage.getString("desktop_jwt_token"))!)['token'])!}'
      },
      body: json.encode({'matricula': matricula,'password': password})
  );
  if (response.statusCode >= 200 && response.statusCode < 400) {
    return true;
  }
  return false;
}
Future<bool> editPreceptor(String matricula,String nome,dynamic idSetor,int usuarioId) async {

  var storage = await SharedPreferences.getInstance();

  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/admin/preceptor');
  final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${(json.decode((storage.getString("desktop_jwt_token"))!)['token'])!}'
      },
      body: json.encode({'nome' : nome,'matricula': matricula,'idSetor': idSetor,'usuarioId': usuarioId})
  );
  if (response.statusCode >= 200 && response.statusCode < 400) {
    return true;
  }
  return false;
}
Future<Map<String,dynamic>?> findPreceptor(String matricula) async {
  var storage = await SharedPreferences.getInstance();

  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/admin/preceptor');
  final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${(json.decode((storage.getString("desktop_jwt_token"))!)['token'])!}'
      },
      body: json.encode({'matricula': matricula})
  );
  if (response.statusCode == 200) {
    return Map<String,dynamic>.from(json.decode(response.body));

  }
  return null;
}
Future<bool> deletePreceptor(String matricula) async {
  var storage = await SharedPreferences.getInstance();

  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/admin/preceptor');
  final response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${(json.decode((storage.getString("desktop_jwt_token"))!)['token'])!}'
      },
      body: json.encode({'matricula': matricula})
  );
  if (response.statusCode == 200) {
     return true;

  }
  return false;
}