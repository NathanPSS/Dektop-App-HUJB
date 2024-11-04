
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_client_sse/constants/sse_request_type_enum.dart';
import 'package:flutter_client_sse/flutter_client_sse.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interface_sistema/entitties/setor/api/data_manipulation_setor.dart';
import 'package:shared_preferences/shared_preferences.dart';



final getContextController = FutureProvider<List<Map<String,dynamic>>>((ref) async {
   return getContextLoggedEstagiarios().then((value) => value);
});


final sseMessageController = StateNotifierProvider<SSEMessageEstagiariosNotifier,List<Map<String,dynamic>>>((ref) {
     return ref.watch(getContextController).when(data: (data) {
       var notifier = SSEMessageEstagiariosNotifier(data);
       notifier.consumeMessage();
       return notifier;
     }, error: (error,stack) => SSEMessageEstagiariosNotifier([]), loading: () => SSEMessageEstagiariosNotifier([]));
 });

class SSEMessageEstagiariosNotifier extends StateNotifier<List<Map<String,dynamic>>>{
  SSEMessageEstagiariosNotifier(super._state);
   late int lastLenght;

 List<Map<String,dynamic>> getEstagiarioSetor(int setorId){
    return state.where((element) => element['id'] == setorId).toList();
 }

 void consumeMessage() async{
   var storage = await SharedPreferences.getInstance();
   SSEClient.subscribeToSSE(method: SSERequestType.GET,
     url: '${dotenv.env['API_BASE_URL']!}/admin/web-flux',
     header:  {
       'Authorization': 'Bearer ${(json.decode((storage.getString("desktop_jwt_token"))!)['token'])!}',
       "Accept": "text/event-stream",
       "Cache-Control": "no-cache",
     },
   ).listen((event) {
     var data = json.decode(event.data!);
     if(data['opPeformed'] == 'open'){
       state = [...state,data];

     }
     if(data['opPeformed'] == 'close'){
       state = state.where((element) => element['id'] != data['id']).toList();
       print(data);
     }
   });
 }

}