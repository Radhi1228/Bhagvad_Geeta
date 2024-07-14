import 'package:flutter/material.dart';

import '../../../utils/helper/json_helper.dart';
import '../../../utils/helper/shared_helper.dart';
import '../model/geeta_model.dart';

class HomeProvider with ChangeNotifier {
  List<VerseModel> verseList = [];
  List<GeetaModel> chapterList = [];
  List<String> favList = [];
  int index = 0;
  bool isOn = true;
  bool theme = false;
  bool isTheme = false;
  ThemeMode mode = ThemeMode.dark;
  IconData themeMode = Icons.dark_mode;
  int selectedVerse=0;
  List<VerseModel> filterList = [];
  String lng = 'sanskrit';

  void setLang(String value)
  {
    lng = value;
    notifyListeners();
  }


  void getFavList()
  async {
    if(await getFavData() == null)
      {
        favList = [];
      }
    else{
      favList = ( await getFavData())!;
    }
    notifyListeners();
  }

  void setFavList(String verse)
  {
    getFavList();
    favList.add(verse);
    setFavData(favList: favList);
    getFavData();
    notifyListeners();
  }


  Future<void> getSelectedVerse(int id)
  async {
    getData();
    filterList.clear();
    for (var i = 0; i < verseList.length; i++) {
      if (verseList[i].chapterNumber == id) {
        filterList.add(verseList[i]);
      }
    }
    notifyListeners();
  }
  void setIndex(int i) {
    index = i;
    notifyListeners();
  }
  void getData() async {
    JsonHelper jsonHelper = JsonHelper();
    verseList = await jsonHelper.verseJson();
    notifyListeners();
  }
  void getChapter() async {
    JsonHelper jsonHelper = JsonHelper();
    chapterList = await jsonHelper.chapterJson();
    notifyListeners();
  }
  void setThemeData() async {
    theme = !theme;
    setData(isTheme: theme);
    isTheme = (await getData1())!;
    if (isTheme == true) {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    } else if (isTheme == false) {
      mode = ThemeMode.light;
      themeMode = Icons.dark_mode;
    }
    notifyListeners();
  }
  void changeTheme() {
    isOn = !isOn;
    notifyListeners();
  }

  void getThemeData() async {
    if (await getData1() == null) {
      isTheme = false;
    } else {
      isTheme = (await getData1())!;
    }
    if (isTheme == true) {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    } else if (isTheme == false) {
      mode = ThemeMode.light;
      themeMode = Icons.dark_mode;
    } else {
      mode = ThemeMode.dark;
      themeMode = Icons.light_mode;
    }
    notifyListeners();
  }
}