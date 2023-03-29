import 'package:rawg/src/app/features/authentication/data/models/user_model.dart';
import 'package:rawg/src/core/utils/app_strings.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase(AppStrings.todoDataBase);
    return _database!;
  }

  // this opens the database (and creates it if it doesn't exist)
  _initDatabase(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createTablesDB);
  }

  Future _createTablesDB(Database db, int version) async {
    await db.execute('''CREATE TABLE ${AppStrings.authTable} (
        ${AuthDBFields.id} ${AppStrings.idType},
        ${AuthDBFields.userName} ${AppStrings.textType},
        ${AuthDBFields.email} ${AppStrings.textType},
        ${AuthDBFields.password} ${AppStrings.textType},
        ${AuthDBFields.fName} ${AppStrings.textType},
        ${AuthDBFields.lName} ${AppStrings.textType},
        ${AuthDBFields.gender} ${AppStrings.textType},
        ${AuthDBFields.image} ${AppStrings.textType},
        ${AuthDBFields.createdAt} ${AppStrings.textType}
      )
      ''');

    // here all table create query will come....
    print("all tables Created");
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
