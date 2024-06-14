import 'package:flutter/services.dart';

class DocumentModel {
  final int? id;
  final String title;
  final String content;
  final DateTime createdAt;
  final Uint8List? thumbnail;

  DocumentModel({
    this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    this.thumbnail,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'createdAt': createdAt.toIso8601String(),
      'thumbnail': thumbnail,
    };
  }

  factory DocumentModel.fromMap(Map<String, dynamic> map) {
    return DocumentModel(
      id: map['id'],
      title: map['title'],
      content: map['content'],
      createdAt: DateTime.parse(map['createdAt']),
      thumbnail: map['thumbnail'],
    );
  }
}
