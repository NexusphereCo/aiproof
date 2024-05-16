import 'dart:io';
import 'package:aiproof/data/models/document_model.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseServices {
  final Logger log = Logger();
  static const _databaseName = "aiproof.db";
  static const table = 'documents';
  static const columnId = 'id';
  static const columnTitle = 'title';
  static const columnContent = 'content';
  static const columnCreatedAt = 'createdAt';
  static const thumbnail = 'thumbnail';

  DatabaseServices._internal();
  static final DatabaseServices instance = DatabaseServices._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnTitle TEXT NOT NULL,
            $columnContent TEXT NOT NULL,
            $columnCreatedAt TEXT NOT NULL,
            $thumbnail BLOB
          )
          ''');
  }

  Future<int> insertDocument(DocumentModel document) async {
    try {
      Database db = await instance.database;
      log.d('Inserting document: ${document.toMap()}');
      int id = await db.insert(table, document.toMap());
      log.d('Inserted document id: $id');
      return id;
    } catch (e) {
      log.e('Failed to insert document: $e');
      rethrow;
    }
  }

  Future<DocumentModel?> queryDocument(int id) async {
    try {
      Database db = await instance.database;
      log.d('Querying document with id: $id');
      List<Map> maps = await db.query(table, columns: [columnId, columnTitle, columnContent, columnCreatedAt], where: '$columnId = ?', whereArgs: [id]);
      if (maps.isNotEmpty) {
        return DocumentModel.fromMap(maps.first as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      log.e('Failed to query document: $e');
      rethrow;
    }
  }

  Future<int> updateDocument(DocumentModel document) async {
    try {
      Database db = await instance.database;
      log.d('Updating document: ${document.toMap()}');
      return await db.update(table, document.toMap(), where: '$columnId = ?', whereArgs: [document.id]);
    } catch (e) {
      log.e('Failed to update document: $e');
      rethrow;
    }
  }

  Future<int> deleteDocument(int id) async {
    try {
      Database db = await instance.database;
      log.d('Deleting document with id: $id');
      return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
    } catch (e) {
      log.e('Failed to delete document: $e');
      rethrow;
    }
  }

  Future<List<DocumentModel>> fetchDocuments() async {
    try {
      Database db = await instance.database;
      log.d('Getting all documents');
      var res = await db.query(table);
      List<DocumentModel> list = res.isNotEmpty ? res.map((c) => DocumentModel.fromMap(c)).toList() : [];
      return list;
    } catch (e) {
      log.e('Failed to get all documents: $e');
      rethrow;
    }
  }

  Future<void> closeDatabase() async {
    try {
      final db = await instance.database;
      log.d('Closing database');
      await db.close();
    } catch (e) {
      log.e('Failed to close database: $e');
      rethrow;
    }
  }

  Future<void> dropDatabase(String dbName) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);
    await deleteDatabase(path);
    log.d('Database $dbName dropped successfully');
  }
}
