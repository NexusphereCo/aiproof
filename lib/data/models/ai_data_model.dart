class AiDataModel {
  final List<String> aiSentences;
  final int aiWords;
  final double fakePercentage;
  final int isHuman;
  final String? otherFeedback;
  final bool status;
  final int textWords;

  AiDataModel({
    required this.aiSentences,
    required this.aiWords,
    required this.fakePercentage,
    required this.isHuman,
    this.otherFeedback,
    required this.status,
    required this.textWords,
  });

  factory AiDataModel.fromJson(Map<String, dynamic> json) {
    return AiDataModel(
      aiSentences: List<String>.from(json['aiSentences']),
      aiWords: json['aiWords'],
      fakePercentage: json['fakePercentage'],
      isHuman: json['isHuman'],
      otherFeedback: json['otherFeedback'],
      status: json['status'],
      textWords: json['textWords'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'aiSentences': aiSentences,
      'aiWords': aiWords,
      'fakePercentage': fakePercentage,
      'isHuman': isHuman,
      'otherFeedback': otherFeedback,
      'status': status,
      'textWords': textWords,
    };
  }
}
