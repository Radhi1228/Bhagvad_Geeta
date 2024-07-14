import 'dart:convert';
import 'package:flutter/services.dart';
import '../../screens/home/model/geeta_model.dart';

class JsonHelper {

  Future<List<VerseModel>> verseJson() async {
    var jsonString = await rootBundle.loadString('assets/json/verse.json');
    List verse = jsonDecode(jsonString);
    List<  VerseModel> verseList = verse.map((e) => VerseModel.mapToModel(e)).toList();
    return verseList;
  }
  Future<List<GeetaModel>> chapterJson() async {
    var jsonString = await rootBundle.loadString('assets/json/chapter.json');
    List chapter = jsonDecode(jsonString);
    List<GeetaModel> chapterList = chapter.map((e) => GeetaModel.mapToModel(e)).toList();
    return chapterList;
  }
}