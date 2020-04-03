import "dart:io";

import 'package:flutterdatabase/src/data/local/dao/user_dao.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'my_table';

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnGender = 'gender';
  static final columnAge = 'age';

  // make this a singleton class
  AppDatabase._();

  static final AppDatabase instance = AppDatabase._();

  static AppDatabase get() => instance;

  // only have a single app-wide reference to the database
  static Database _database;

  static const List<String> _DATABASE_TABLE = [
    UserDao.TABLE_NAME,
  ];

  static const List<String> _DATABASE_CREATE_QUERY = [
    UserDao.CREATE_QUERY,
  ];

  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onOpen: onOpen,
        onUpgrade: onUpgrade,
        onCreate: onCreate);
  }

  onOpen(Database db) {
    print("Database Open");
  }

  onUpgrade(Database db, int oldVersion, int newVersion) {
    print("Database Upgrade");
    dropTable(db);
    createTable(db);
  }

  onCreate(Database db, int version) {
    print("Database Create");
    createTable(db);
  }

  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future deleteAll() async {
    Database db = await instance.database;
    return await db.rawQuery('DELETE FROM $table');
  }

  void createTable(Database db) {
    for (var query in _DATABASE_CREATE_QUERY) {
      db.execute(query);
    }
  }

  void dropTable(Database db) {
    for (var table in _DATABASE_TABLE) {
      db.execute("DROP TABLE IF EXISTS " + table);
    }
  }
}
