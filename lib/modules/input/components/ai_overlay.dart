import 'dart:convert';

import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/data/models/ai_data_model.dart';
import 'package:aiproof/widgets/common/buttons.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

class AICheckerOverlay extends StatelessWidget {
  final String content;
  final OverlayPortalController overlayController;

  late String verdict;

  AICheckerOverlay({
    super.key,
    required this.content,
    required this.overlayController,
  });

  Future<AiDataModel> fetchResponse() async {
    Logger logger = Logger();

    logger.i('fetching...');
    String url = 'https://ai-content-detector-ai-gpt.p.rapidapi.com/api/detectText/';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'content-type': 'application/json',
        'Content-Type': 'application/json',
        'X-RapidAPI-Key': 'f7aef41661mshde44967285c37a1p1082a0jsn62312c66642f',
        'X-RapidAPI-Host': 'ai-content-detector-ai-gpt.p.rapidapi.com',
      },
      body: jsonEncode(
        <String, String>{
          'text': content,
        },
      ),
    );

    final AiDataModel responseData = AiDataModel.fromJson(jsonDecode(response.body));
    verdict = determineVerdict(responseData);
    logger.i(responseData.fakePercentage);

    return responseData;
  }

  String determineVerdict(AiDataModel response) {
    if (response.fakePercentage >= 90) {
      return 'We are highly confident this text was AI generated.';
    } else if (response.fakePercentage >= 80 && response.fakePercentage < 90) {
      return 'We are confident this text was AI generated.';
    } else if (response.fakePercentage >= 60 && response.fakePercentage < 80) {
      return 'This text is somewhat likely AI generated.';
    } else if (response.fakePercentage >= 30 && response.fakePercentage < 60) {
      return 'This text is somewhat likely written by a human.';
    } else {
      return 'This text is written by a human.';
    }
  }

  double degreeToRadian(int deg) => deg * (3.141592653589793 / 180);

  dynamic resolveTransform(Rect bounds, TextDirection textDirection) {
    final GradientTransform transform = GradientRotation(degreeToRadian(-90));
    return transform.transform(bounds, textDirection: textDirection)!.storage;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AiDataModel>(
      future: fetchResponse(),
      builder: (BuildContext context, AsyncSnapshot<AiDataModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          Logger log = Logger();
          log.e(('Error: ${snapshot.error}'));
          return Text('Error: ${snapshot.error}');
        } else {
          AiDataModel? data = snapshot.data;
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  APColor.light.withOpacity(0),
                  APColor.light.withOpacity(0.5),
                  APColor.light.withOpacity(.8),
                  APColor.light,
                  APColor.light,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  fit: StackFit.passthrough,
                  alignment: Alignment.center,
                  children: [
                    SfCircularChart(
                      onCreateShader: (ChartShaderDetails chartShaderDetails) {
                        return ui.Gradient.sweep(
                          chartShaderDetails.outerRect.center,
                          [APColor.primary, APColor.secondary],
                          const [0.2, 0.8],
                          TileMode.clamp,
                          degreeToRadian(0),
                          degreeToRadian(360),
                          resolveTransform(chartShaderDetails.outerRect, TextDirection.ltr),
                        );
                      },
                      series: <CircularSeries>[
                        RadialBarSeries<AiDataModel, String>(
                          dataSource: [data!],
                          xValueMapper: (data, _) => "AI Generated",
                          yValueMapper: (data, _) => data.fakePercentage,
                          maximumValue: 100,
                          trackColor: APColor.light[100]!,
                          cornerStyle: CornerStyle.bothCurve,
                          gap: '45',
                          innerRadius: '55%',
                          radius: '105%',
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        APTypography.h1("${data.fakePercentage}%", fontSize: 32),
                        APTypography.label("AI Generated"),
                      ],
                    ),
                    Positioned(
                      bottom: 8,
                      child: APTypography.base(verdict),
                    )
                  ],
                ),
                const SizedBox(height: Spacing.xxxl),
                APButton(
                  onPressed: () {
                    overlayController.hide();
                  },
                  text: "Go Back",
                  theme: APButtonTheme.dark,
                  size: APButtonSize.lg,
                )
              ],
            ),
          );
        }
      },
    );
  }
}
