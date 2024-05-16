import 'dart:convert';

import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/data/models/ai_response_model.dart';
import 'package:aiproof/data/models/document_model.dart';
import 'package:aiproof/widgets/common/buttons.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

class AICheckerOverlay extends StatelessWidget {
  final DocumentModel? document;
  final OverlayPortalController overlayController;

  const AICheckerOverlay({
    super.key,
    this.document,
    required this.overlayController,
  });

  Future<AiResponseModel> fetchRandomUsers() async {
    Logger logger = Logger();

    logger.i('fetching...');
    String url = 'https://ai-content-detector-ai-gpt.p.rapidapi.com/api/detectText/';
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'content-type': 'application/json',
        'Content-Type': 'application/json',
        'X-RapidAPI-Key': '3ecb75fe1emsh667a07ab24e7067p13d983jsn557e27463e07',
        'X-RapidAPI-Host': 'ai-content-detector-ai-gpt.p.rapidapi.com',
      },
      body: jsonEncode(
        <String, String>{
          'text': document?.content as String,
        },
      ),
    );

    final responseData = AiResponseModel.fromJson(jsonDecode(response.body));
    logger.i(responseData.fakePercentage);

    return responseData;
  }

  double degreeToRadian(int deg) => deg * (3.141592653589793 / 180);

  dynamic resolveTransform(Rect bounds, TextDirection textDirection) {
    final GradientTransform transform = GradientRotation(degreeToRadian(-90));
    return transform.transform(bounds, textDirection: textDirection)!.storage;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AiResponseModel>(
      future: fetchRandomUsers(),
      builder: (BuildContext context, AsyncSnapshot<AiResponseModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // show error message if error occurred
        } else {
          AiResponseModel? data = snapshot.data;
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
                        RadialBarSeries<AiResponseModel?, String>(
                          dataSource: [data],
                          xValueMapper: (data, _) => "AI Generated",
                          yValueMapper: (data, _) => data?.fakePercentage,
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
                        APTypography.h1("${data?.fakePercentage}%"),
                        APTypography.label("AI Generated"),
                      ],
                    ),
                    Positioned(
                      bottom: 8,
                      child: APTypography.label("AI GENERATED"),
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
