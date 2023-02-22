import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:note_app/models/user.dart';
import 'package:note_app/services/app_shared_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/notes.dart';

final dio = Dio();

Future<NotesModel?> requestGetALLNotes() async {
  final sharedPref = await SharedPreferences.getInstance();
  AppSharedData sharedData = AppSharedData(prefs: sharedPref);
  String user = await sharedData.getToken(USER);
  UserModel currentUser = UserModel.fromJson(jsonDecode(user));
  String basicAuth = await sharedData.getToken(AUTH_TOKEN);
  Response response;
  response = await dio.get(
    'https://dev148166.service-now.com/api/now/table/x_979268_eyepax_sn_note?sysparm_limit=100',
    options: Options(
      headers: {
        "authorization": basicAuth,
        "Accept" : "application/json"
      },
    ),
    queryParameters: {'sys_created_by': currentUser.result[0].userName},
  );
  if(response.statusCode == 200){
    return NotesModel.fromJson(response.data);
  } else {
    return null;
  }

}

Future<bool> deleteNote (String noteId) async{
  final sharedPref = await SharedPreferences.getInstance();
  AppSharedData sharedData = AppSharedData(prefs: sharedPref);
  String basicAuth = await sharedData.getToken(AUTH_TOKEN);
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
  final sharedPref = await SharedPreferences.getInstance();
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
      UserModel user = UserModel.fromJson(response.data);
      AppSharedData sharedData = AppSharedData(prefs: sharedPref);
      String userJsonString = jsonEncode(user);
      await sharedData.setToken(USER, userJsonString);
      await sharedData.setToken(AUTH_TOKEN, basicAuth);
      return true;
    } else {
      return false;
    }
  }catch(e){
    return false;
  }
}


Future<bool> createNote (String title, String description, String date) async{
  final sharedPref = await SharedPreferences.getInstance();
  AppSharedData sharedData = AppSharedData(prefs: sharedPref);
  String user = await sharedData.getToken(USER);
  UserModel currentUser = UserModel.fromJson(jsonDecode(user));
  String basicAuth = await sharedData.getToken(AUTH_TOKEN);
  Response response;
  var params =  {
    "u_note_description": description,
    "u_note_title": title,
    "u_due_date": date,
    "u_created_by": currentUser.result[0].userName,
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

Future<bool> updateNote (String title, String description, String date, String noteId) async{
  final sharedPref = await SharedPreferences.getInstance();
  AppSharedData sharedData = AppSharedData(prefs: sharedPref);
  String user = await sharedData.getToken(USER);
  UserModel currentUser = UserModel.fromJson(jsonDecode(user));
  String basicAuth = await sharedData.getToken(AUTH_TOKEN);
  Response response;
  var params =  {
    "u_note_description": description,
    "u_note_title": title,
    "u_due_date": date,
    "u_created_by": currentUser.result[0].userName,
  };
  response = await dio.put(
      'https://dev148166.service-now.com/api/now/table/x_979268_eyepax_sn_note/$noteId',
      options: Options(
        headers: {
          "authorization": basicAuth,
          "Accept" : "application/json",
        },
      ),
      data: jsonEncode(params)
    //queryParameters: {'id': 12, 'name': 'dio'},
  );
  if(response.statusCode == 200){
    return true;
  } else {
    return false;
  }
}
