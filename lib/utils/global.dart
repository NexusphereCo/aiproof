import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/// customize the appearance of system elements
/// regarding the notification top overlay.
void setSystemUIOverlayStyle() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      // make navigation bar transparent.
      systemNavigationBarColor: Colors.transparent,
      // set navigation bar icon brightness to light.
      systemNavigationBarIconBrightness: Brightness.light,
      // make status bar transparent.
      statusBarColor: Colors.transparent,
      // met status bar icon brightness to dark.
      statusBarIconBrightness: Brightness.dark,
    ),
  );
}

/// met preferred device orientations.
Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations(
    [
      // allow portrait orientation in the upright position.
      DeviceOrientation.portraitUp,
      // allow portrait orientation in the upside-down position.
      DeviceOrientation.portraitDown,
    ],
  );
}

class SqliteService {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE Notes(id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }
}
