import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sustain_tour_mobile/models/search_history_models/search_history_models.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  final String _tableName = "search_history";
  static late Database _database;

  DatabaseHelper._internal(){
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(await getDatabasesPath(), 'destimate_db.db'),
      onCreate: (db,version) async {
        return db.execute(
          ''' CREATE TABLE $_tableName(
            id INTEGER PRIMARY KEY,
            userId int,
            query TEXT
          )
          '''
        );
      },
      version: 1
    );
    return db;
  }

  Future<void> addHistory ({required SearchHistoryModel searchHistoryModel}) async {
    final Database db = await database;
    await db.insert(_tableName, searchHistoryModel.toMap());
  }

  Future<List<SearchHistoryModel>> getHistory ({required int userId}) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    List<SearchHistoryModel> userHistory = [];

    List<SearchHistoryModel> allHistory = results.map((e) => SearchHistoryModel.fromMap(e)).toList();

    for (var i = 0; i < allHistory.length; i++) {
      if (allHistory[i].userId == userId) {
        userHistory.add(allHistory[i]);
      }
    }

    return userHistory;
  }

  Future<void> deleteHistory({required int id}) async {
    final db = await database;
    await db.delete(_tableName,
      where: 'id = ?',
      whereArgs: [id]
    );
  }

  Future<int> getHighestId() async {
    final db = await database;
    List<Map<String, dynamic>> result = await db.rawQuery(
      'SELECT MAX(id) as maxId FROM $_tableName;'
    );

    int highestId = result.isNotEmpty ? result.first['maxId'] ?? 0 : 0;
    return highestId;
  }

}