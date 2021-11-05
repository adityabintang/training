import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainingbasicflutter/data/dataglobal.dart';
import 'package:trainingbasicflutter/res/resUser.dart';

class Prefs{
  static Future<void> saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("user_save", jsonEncode(dataGlobal.user?.toJson()));
  }
  // static Future<void> loadUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   try{
  //     return User.fromJson(jsonDecode(prefs.getString('user_saved')));
  //   }catch(e){
  //
  //   }
  // }
}