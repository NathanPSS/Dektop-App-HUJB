import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';


Future<bool> setToken(String username,String password) async {
  var storage = await SharedPreferences.getInstance();

  try{
    final url = Uri.parse(
        '${dotenv.env['API_BASE_URL']!}/admin/auth');
    final response = await http.post(
      url,
      body: json.encode({'username': username,'password': password}),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      print("Ok");
      storage.setString("desktop_jwt_token",response.body);
      return true;
    }
    return false;
  }
  catch(e){
    return false;
  }
}

Future<bool> hasValidToken() async {
  var storage = await SharedPreferences.getInstance();

  var existsToken = storage.getString("desktop_jwt_token");

  if(existsToken != null){
    var token = json.decode((existsToken))['expireAt'];
    if(isValidToken(token)){
      return true;
    }
    return false;
  }
  return false;
}

bool isValidToken(String expireAt) {
  return DateTime.now().isBefore(DateTime.parse(expireAt));
}