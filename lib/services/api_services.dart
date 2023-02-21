import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/notes.dart';

final dio = Dio();

Future<NotesModel?> requestGetALLNotes() async {
  String username = "JaneeshaW";
  String password = "Eyepax123@";
  String basicAuth =
      'Basic ' + base64.encode(utf8.encode('$username:$password'));
  Response response;
  response = await dio.get(
    'https://dev148166.service-now.com/api/now/table/x_979268_eyepax_sn_note?sysparm_limit=100',
    options: Options(
      headers: {
        "authorization": basicAuth,
        "Accept" : "application/json"
      },
    ),
    //queryParameters: {'id': 12, 'name': 'dio'},
  );
  if(response.statusCode == 200){
    return NotesModel.fromJson(response.data);
  } else {
    return null;
  }

}