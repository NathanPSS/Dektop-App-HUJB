
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


Future<bool> createSetor(String nome) async {
  var storage = await SharedPreferences.getInstance();

  final url = Uri.parse(
      '${dotenv.env['API_BASE_URL']!}/setor');
  print((storage.getString("desktop_jwt_token")));
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

Future<void> test() async{
 await Future.delayed(Duration(seconds: 3));
}