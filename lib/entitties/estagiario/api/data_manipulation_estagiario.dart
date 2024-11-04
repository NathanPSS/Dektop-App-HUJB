
import 'dart:convert';
import 'dart:ffi';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


Future<bool> createEstagiario(String matricula,String nome,String password) async {
  var storage = await SharedPreferences.getInstance();

  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/admin/estagiario/create');
  final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${(json.decode((storage.getString("desktop_jwt_token"))!)['token'])!}'
      },
      body: json.encode({'nome' : nome,'matricula': matricula,'password': password})
  );
  if (response.statusCode == 201) {
    return true;
  }
  return false;
}
Future<bool> editEstagiario(String matricula,String nome,int usuarioId) async {
  var storage = await SharedPreferences.getInstance();

  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/admin/estagiario');
  final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${(json.decode((storage.getString("desktop_jwt_token"))!)['token'])!}'
      },
      body: json.encode({'matricula':matricula,'nome' : nome,'usuarioId': usuarioId})
  );

  if (response.statusCode >= 200 && response.statusCode <= 400) {
    return true;
  }
  return false;
}
Future<Map<String,dynamic>?> findEstagiario(String matricula) async {
  var storage = await SharedPreferences.getInstance();

  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/admin/estagiario');
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
Future<bool> deleteEstagiario(String matricula) async {
  var storage = await SharedPreferences.getInstance();

  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/admin/estagiario');
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
