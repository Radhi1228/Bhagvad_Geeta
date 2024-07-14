import 'package:shared_preferences/shared_preferences.dart';

  void setData({required bool isTheme}) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool("theme", isTheme);

  }

  Future<bool?> getData1() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    return shr.getBool("theme");
  }

  void setFavData({required List<String> favList}) async {
    SharedPreferences verse = await SharedPreferences.getInstance();
    verse.setStringList("verses", favList);

  }
  Future<List<String>?> getFavData() async {
    SharedPreferences verse = await SharedPreferences.getInstance();
    return verse.getStringList("verses");
  }
