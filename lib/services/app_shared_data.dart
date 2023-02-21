import 'package:shared_preferences/shared_preferences.dart';

/// *** Created By Isuru B. Ranapana *** ///
/// ***     Eyepax IT Consulting     *** ///
/// ***   on 2/21/2023 => 6:48 PM  *** ///

const USER = 'USER';
const AUTH_TOKEN = 'AUTH_TOKEN';
class AppSharedData {
  final SharedPreferences prefs;

  AppSharedData({required this.prefs});

  Future setToken(String token, String value) async{
    await prefs.setString(token, value);
  }

  getToken(String token){
    return prefs.getString(token);
  }

  Future clearToken(String token) async{
    await prefs.remove(token);
  }

  Future clearAll()async{
    await prefs.clear();
  }
}
