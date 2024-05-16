import 'dart:convert';
import 'package:aiproof/constants/colors.dart';
import 'package:aiproof/constants/sizes.dart';
import 'package:aiproof/constants/typography.dart';
import 'package:aiproof/data/models/plagiarisim_data_model.dart';
import 'package:aiproof/widgets/common/buttons.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;

class PlagiarismOverlay extends StatelessWidget {
  final String content;
  final OverlayPortalController overlayController;

  const PlagiarismOverlay({
    super.key,
    required this.content,
    required this.overlayController,
  });

  Future<PlagiarismDataModel> fetchResponse() async {
    Logger logger = Logger();
    logger.i('fetching...');
    String url = 'https://plagiarism-checker-and-auto-citation-generator-multi-lingual.p.rapidapi.com/plagiarism';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'content-type': 'application/json',
          'Content-Type': 'application/json',
          'X-RapidAPI-Key': '659509b188msh35cbbc9a10163cdp170784jsnb5f10a363912',
          'X-RapidAPI-Host': 'plagiarism-checker-and-auto-citation-generator-multi-lingual.p.rapidapi.com',
        },
        body: jsonEncode(
          <String, dynamic>{
            'text': content,
            "language": "en",
            "includeCitations": false,
            "scrapeSources": false,
          },
        ),
      );
      logger.i('Response: ${response.body}');

      final responseData = PlagiarismDataModel.fromJson(jsonDecode(response.body));
      logger.i('Percent Plagiarism: ${responseData.percentPlagiarism}');

      return responseData;
    } catch (e) {
      throw e.toString();
    }
  }

  double degreeToRadian(int deg) => deg * (3.141592653589793 / 180);

  dynamic resolveTransform(Rect bounds, TextDirection textDirection) {
    final GradientTransform transform = GradientRotation(degreeToRadian(-90));
    return transform.transform(bounds, textDirection: textDirection)!.storage;
  }

  @override
  Widget build(BuildContext context) {
    Logger log = Logger();
    return FutureBuilder<PlagiarismDataModel>(
      future: fetchResponse(),
      builder: (BuildContext context, AsyncSnapshot<PlagiarismDataModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          log.i('Error: ${snapshot.error}');
          return Text('Error: ${snapshot.error}');
        } else {
          PlagiarismDataModel? data = snapshot.data;
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
                        RadialBarSeries<PlagiarismDataModel?, String>(
                          dataSource: [data],
                          xValueMapper: (data, _) => "Plagiarized",
                          yValueMapper: (data, _) => data?.percentPlagiarism?.toDouble(),
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
                        APTypography.h1("${data?.percentPlagiarism}%"),
                        APTypography.label("Plagiarized"),
                      ],
                    ),
                    // Positioned(
                    //   bottom: 8,
                    //   child: Column(
                    //     children: [
                    //       APTypography.label("Citations:"),
                    //       const SizedBox(height: 4),
                    //       APTypography.label(data?.citations?.length.toString() ?? "No citations found"),
                    //     ],
                    //   ),
                    // ),
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
