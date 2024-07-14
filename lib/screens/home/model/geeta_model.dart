class GeetaModel {
    int? chapterNumber;
    String? chapterSummary;
    String? chapterSummaryHindi;
    int? id;
    String? imageName;
    String? name;
    String? nameMeaning;
    String? nameTranslation;
    String? nameTransliterated;
    int? versesCount;
    String? imageUrl;

  GeetaModel({
    this.chapterNumber,
    this.chapterSummary,
    this.chapterSummaryHindi,
    this.id,
    this.imageName,
    this.name,
    this.nameMeaning,
    this.nameTranslation,
    this.nameTransliterated,
    this.versesCount,
    this.imageUrl,
  });

  factory GeetaModel.mapToModel(Map m1) {
    return GeetaModel(
      chapterNumber: m1['chapter_number'],
      chapterSummary: m1['chapter_summary'],
      chapterSummaryHindi: m1['chapter_summary_hindi'],
      id: m1['id'],
      imageName: m1['image_name'],
      name: m1['name'],
      nameMeaning: m1['name_meaning'],
      nameTranslation: m1['name_translation'],
      nameTransliterated: m1['name_transliterated'],
      versesCount: m1['verses_count'],
      imageUrl: m1['imageUrl'],
    );
  }
}

class VerseModel {
      int? chapterId;
      int? chapterNumber;
      int? externalId;
      int? id;
      String? text;
      String? title;
      int? verseNumber;
      int? verseOrder;
      String? transliteration;
      String? wordMeanings;

  VerseModel({
    this.chapterId,
    this.chapterNumber,
    this.externalId,
    this.id,
    this.text,
    this.title,
    this.verseNumber,
    this.verseOrder,
    this.transliteration,
    this.wordMeanings,
  });

  factory VerseModel.mapToModel(Map m1) {
    return VerseModel(
      chapterId: m1['chapter_id'],
      chapterNumber:m1['chapter_number'],
      externalId: m1['externalId'],
      id:m1['id'],
      text:m1['text'],
      title:m1['title'],
      verseNumber: m1['verse_number'],
      verseOrder: m1['verse_order'],
      transliteration: m1['transliteration'],
      wordMeanings: m1['word_meanings'],
    );
  }
}
