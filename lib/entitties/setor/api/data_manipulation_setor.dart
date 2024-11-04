
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


Future<bool> createSetor(String nome) async {
  var storage = await SharedPreferences.getInstance();

  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/admin/setor/create');

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${(json.decode((storage.getString("desktop_jwt_token"))!)['token'])!}'
    },
    body: json.encode({'nome' : nome})
  );
  if (response.statusCode == 200) {
   return true;
  }
  return false;
}
Future<bool> editSetor(String nome,int setorId) async {
  var storage = await SharedPreferences.getInstance();

  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/admin/setor');

  final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${(json.decode((storage.getString("desktop_jwt_token"))!)['token'])!}'
      },
      body: json.encode({'nome' : nome,'setorId': setorId})
  );
  if (response.statusCode == 200) {
    return true;
  }
  return false;
}
Future<bool> deleteSetor(Object idSetor) async {
  var storage = await SharedPreferences.getInstance();

  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/admin/setor');

  final response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${(json.decode((storage.getString("desktop_jwt_token"))!)['token'])!}'
      },
      body: json.encode({'idSetor' : idSetor})
  );
  if (response.statusCode == 200) {
    return true;
  }
  return false;
}

Future<List<Map<String,dynamic>>> getAllSetores() async {
  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/setor/all');
  final response = await http.get(
    url,
  );
  return List<Map<String, dynamic>>.from(json.decode(response.body));
}

void getLoggedEstagiariosInSetor(List<Map<String,dynamic>> setores){

}

Future<List<Map<String,dynamic>>> getContextLoggedEstagiarios()async {
  var storage = await SharedPreferences.getInstance();

  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/admin/estagiario-context');
  final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${(json.decode((storage.getString("desktop_jwt_token"))!)['token'])!}'
      },
  );
  if (response.statusCode == 200) {
    return List<Map<String, dynamic>>.from(json.decode(response.body));

  }
  return [];
}
