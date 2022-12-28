import 'package:path/path.dart';
import 'package:restaurant_app/models/restaurant.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    return await _initDatabase();
  }

  static const String _tableName = "favorite_restaurant";

  Future<Database> _initDatabase() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      join(path, 'restaurant_db.db'),
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE $_tableName (id TEXT PRIMARY KEY, name TEXT, description TEXT, pictureId TEXT, city TEXT, rating REAL)",
        );
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertRestaurant(Restaurants restaurant) async {
    final Database db = await database;
    await db.insert(_tableName, restaurant.toMap());
  }

  Future<List<Restaurants>> getRestaurants() async {
    final Database db = await database;
    final List<Map<String, dynamic>> results = await db.query(_tableName);
    return results.map((res) => Restaurants.fromJson(res)).toList();
  }

  Future<void> deleteRestaurant(String id) async {
    final Database db = await database;
    await db.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }
}
