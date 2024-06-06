class AudioResultModel {
  String? generatedText;
  int? textLength;
  int? numSentences;
  List<List<dynamic>>? mostCommonWordsAll;
  List<List<dynamic>>? mostCommonWordsNoStop;
  String? longestSentence;
  int? longestSentenceWordCount;
  int? repeatedWordSentences;
  int? wpm;
  int? durationMinutes;
  double? loudnessPercentage;
  String? volumeAdvice;
  List<String>? fillers;

  AudioResultModel({
    this.generatedText,
    this.textLength,
    this.numSentences,
    this.mostCommonWordsAll,
    this.mostCommonWordsNoStop,
    this.longestSentence,
    this.longestSentenceWordCount,
    this.repeatedWordSentences,
    this.wpm,
    this.durationMinutes,
    this.loudnessPercentage,
    this.volumeAdvice,
    this.fillers,
  });

  AudioResultModel.fromJson(Map<String, dynamic> json) {
    generatedText = json['generated_text'];
    textLength = json['text_length'];
    numSentences = json['num_sentences'];
    if (json['most_common_words_all'] != null) {
      mostCommonWordsAll = (json['most_common_words_all'] as List)
          .map((i) => List<dynamic>.from(i))
          .toList();
    }
    if (json['most_common_words_no_stop'] != null) {
      mostCommonWordsNoStop = (json['most_common_words_no_stop'] as List)
          .map((i) => List<dynamic>.from(i))
          .toList();
    }
    longestSentence = json['longest_sentence'];
    longestSentenceWordCount = json['longest_sentence_word_count'];
    repeatedWordSentences = json['repeated_word_sentences'];
    wpm = json['wpm'];
    durationMinutes = json['duration_minutes'];
    loudnessPercentage = json['loudness_percentage'];
    volumeAdvice = json['volume_advice'];
    fillers = List<String>.from(json['fillers']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['generated_text'] = generatedText;
    data['text_length'] = textLength;
    data['num_sentences'] = numSentences;
    if (mostCommonWordsAll != null) {
      data['most_common_words_all'] =
          mostCommonWordsAll!.map((v) => List<dynamic>.from(v)).toList();
    }
    if (mostCommonWordsNoStop != null) {
      data['most_common_words_no_stop'] =
          mostCommonWordsNoStop!.map((v) => List<dynamic>.from(v)).toList();
    }
    data['longest_sentence'] = longestSentence;
    data['longest_sentence_word_count'] = longestSentenceWordCount;
    data['repeated_word_sentences'] = repeatedWordSentences;
    data['wpm'] = wpm;
    data['duration_minutes'] = durationMinutes;
    data['loudness_percentage'] = loudnessPercentage;
    data['volume_advice'] = volumeAdvice;
    data['fillers'] = fillers;
    return data;
  }
}

class MostCommonWordsAll {
  MostCommonWordsAll();

  MostCommonWordsAll.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}