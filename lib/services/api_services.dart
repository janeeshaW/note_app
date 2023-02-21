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

Future<bool> deleteNote (String noteId) async{
  String username = "JaneeshaW";
  String password = "Eyepax123@";
  String basicAuth =
      'Basic ' + base64.encode(utf8.encode('$username:$password'));
  Response response;
  response = await dio.delete(
    'https://dev148166.service-now.com/api/now/table/x_979268_eyepax_sn_note/$noteId',
    options: Options(
      headers: {
        "authorization": basicAuth,
        "Accept" : "application/json"
      },
    ),
    //queryParameters: {'id': 12, 'name': 'dio'},
  );
  if(response.statusCode == 204){
    return true;
  } else {
    return false;
  }
}


Future<bool> getUserProfile(String inputUsername,String inputPassword) async {
  String username = inputUsername;
  String password = inputPassword;
  String basicAuth =
      'Basic ' + base64.encode(utf8.encode('$username:$password'));
  Response response;
  try{
    response = await dio.get(
      'https://dev148166.service-now.com/api/now/table/sys_user',
      options: Options(
        headers: {
          "authorization": basicAuth,
          "Accept" : "application/json"
        },
      ),
      queryParameters: {'user_name': inputUsername},
    );
    if(response.statusCode == 200){
      print(response);
      return true;
    } else {
      return false;
    }
  }catch(e){
    return false;
  }
}


Future<bool> createNote (String title, String description, String date) async{
  String username = "JaneeshaW";
  String password = "Eyepax123@";
  String basicAuth =
      'Basic ' + base64.encode(utf8.encode('$username:$password'));
  Response response;
  var params =  {
    "u_note_description": description,
    "u_note_title": title,
    "u_due_date": date,
    "u_created_by": "JaneeshaW",
  };
  response = await dio.post(
    'https://dev148166.service-now.com/api/now/table/x_979268_eyepax_sn_note',
    options: Options(
      headers: {
        "authorization": basicAuth,
        "Accept" : "application/json",
      },
    ),
    data: jsonEncode(params)
    //queryParameters: {'id': 12, 'name': 'dio'},
  );
  if(response.statusCode == 201){
    return true;
  } else {
    return false;
  }
}
