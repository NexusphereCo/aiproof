import 'dart:convert';

import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/data/models/document_model.dart';
import 'package:aiproof/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:remixicon/remixicon.dart';
import 'package:http/http.dart' as http;

class APAppBarBottom extends StatefulWidget {
  final DocumentModel? document;
  const APAppBarBottom({super.key, this.document});

  @override
  State<APAppBarBottom> createState() => _APAppBarBottomState();
}

class _APAppBarBottomState extends State<APAppBarBottom> {
  var _overlayController = OverlayPortalController();

  Future<void> fetchRandomUsers() async {
    Logger logger = Logger();
    logger.i('fetching...');

    // fetch random users
    String url = 'https://ai-content-detector-ai-gpt.p.rapidapi.com/api/detectText/';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'content-type': 'application/json',
        'Content-Type': 'application/json',
        'X-RapidAPI-Key': '3ecb75fe1emsh667a07ab24e7067p13d983jsn557e27463e07',
        'X-RapidAPI-Host': 'ai-content-detector-ai-gpt.p.rapidapi.com',
      },
      body: jsonEncode(<String, String>{
        'text': widget.document?.content as String,
      }),
    );

    final responseData = jsonDecode(response.body);

    logger.i(responseData);
  }

  @override
  Widget build(BuildContext context) {
    Widget _overlay() {
      return Container(
        child: const Center(
          child: Text("nigga"),
        ),
      );
    }

    return Stack(
      children: [
        BottomAppBar(
          color: APColor.light,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  if (ModalRoute.of(context)?.settings.name != Routes.home) {
                    Navigator.of(context).push(createRoute(route: Routes.camera));
                  }
                },
                icon: const Icon(Remix.camera_2_line),
                tooltip: 'Scan Document',
              ),
              IconButton(
                onPressed: _overlayController.toggle,
                icon: const Icon(Remix.brain_line),
                tooltip: 'AI Checker',
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Remix.file_warning_line),
                tooltip: 'Plagiarism Checker',
              ),
            ],
          ),
        ),
        OverlayPortal(
          controller: _overlayController,
          overlayChildBuilder: (BuildContext context) {
            return _overlay();
          },
        ),
      ],
    );
  }
}
