import 'dart:convert';

import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/data/models/document_model.dart';
import 'package:aiproof/modules/input/components/overlay.dart';
import 'package:aiproof/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:remixicon/remixicon.dart';
import 'package:http/http.dart' as http;

class APAppBarBottom extends StatelessWidget {
  final DocumentModel? document;
  const APAppBarBottom({super.key, this.document});

  Future<void> fetchAiResponse() async {
    Logger logger = Logger();
    logger.i('fetching...');

    // fetch random users
    String url = 'https://ai-content-detector-ai-gpt.p.rapidapi.com/api/detectText/';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'content-type': 'application/json',
        'X-RapidAPI-Key': 'f7aef41661mshde44967285c37a1p1082a0jsn62312c66642f',
        'X-RapidAPI-Host': 'ai-content-detector-ai-gpt.p.rapidapi.com',
      },
      body: jsonEncode(
        <String, String>{
          'text': document?.content as String,
        },
      ),
    );

    final responseData = jsonDecode(response.body);
    logger.i(responseData);

    return responseData;
  }

  Future<void> fetchPlagiarismResponse() async {
    Logger logger = Logger();
    logger.i('fetching...');

    // fetch random users
    String url = 'https://plagiarism-checker-and-auto-citation-generator-multi-lingual.p.rapidapi.com/plagiarism';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'content-type': 'application/json',
        'X-RapidAPI-Key': 'f7aef41661mshde44967285c37a1p1082a0jsn62312c66642f',
        'X-RapidAPI-Host': 'plagiarism-checker-and-auto-citation-generator-multi-lingual.p.rapidapi.com',
      },
      body: jsonEncode(
        <String, dynamic>{
          'text': document?.content as String,
          "language": "en",
          "includeCitations": false,
          "scrapeSources": false,
        },
      ),
    );

    final responseData = jsonDecode(response.body);
    logger.i(responseData);

    return responseData;
  }

  @override
  Widget build(BuildContext context) {
    final _overlayController = OverlayPortalController();

    return BottomAppBar(
      color: APColor.light,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              if (ModalRoute.of(context)?.settings.name != Routes.home) {
                Navigator.of(context).pushReplacement(createRoute(route: Routes.camera, args: document));
              }
            },
            icon: const Icon(Remix.camera_2_line),
            tooltip: 'Scan Document',
          ),
          IconButton(
            onPressed: () {
              _overlayController.toggle();
              fetchAiResponse();
            },
            icon: const Icon(Remix.brain_line),
            tooltip: 'AI Checker',
          ),
          IconButton(
            onPressed: () {
              _overlayController.toggle();
              fetchPlagiarismResponse();
            },
            icon: const Icon(Remix.file_warning_line),
            tooltip: 'Plagiarism Checker',
          ),
          // OverlayPortal(
          //   controller: _overlayController,
          //   overlayChildBuilder: (BuildContext context) {
          //     return ResultOverlay(
          //       overlayController: _overlayController,
          //       content: document!.content,
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
