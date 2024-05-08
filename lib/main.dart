import 'package:aiproof/modules/app.dart';
import 'package:aiproof/utils/global.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  // initialize system settings
  WidgetsFlutterBinding.ensureInitialized();
  setSystemUIOverlayStyle();
  await setPreferredOrientations();
  // run the application
  runApp(const App());
}
