class PlagiarismDataModel {
  final int? percentPlagiarism;

  List<Citation>? citations;

  PlagiarismDataModel({
    required this.percentPlagiarism,
    this.citations,
  });

  factory PlagiarismDataModel.fromJson(Map<String, dynamic> json) {
    List<Citation> citationsList = [];
    if (json['citations'] != null) {
      json['citations'].forEach((citationJson) {
        citationsList.add(Citation.fromJson(citationJson));
      });
    }

    return PlagiarismDataModel(
      percentPlagiarism: json['percentPlagiarism'],
      citations: citationsList,
    );
  }
}

class Citation {
  String? title;
  String? url;
  int? sentenceEndIndex;
  int? score;
  int? matchedContentStartIndex;
  int? matchedContentEndIndex;

  Citation({
    this.title,
    this.url,
    this.sentenceEndIndex,
    this.score,
    this.matchedContentStartIndex,
    this.matchedContentEndIndex,
  });

  factory Citation.fromJson(Map<String, dynamic> json) {
    return Citation(
      title: json['title'],
      url: json['url'],
      sentenceEndIndex: json['sentenceEndIndex'],
      score: json['score'],
      matchedContentStartIndex: json['matchedContentStartIndex'],
      matchedContentEndIndex: json['matchedContentEndIndex'],
    );
  }
}
