import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/baby.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();
  static Database? _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('babies.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE babies ( 
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT,
        birthdate TEXT,
        gender TEXT,
        weight TEXT,
        height TEXT,
        headCircumference TEXT,
        chestCircumference TEXT
      )
    ''');
  }

  Future<Baby> insertBaby(Baby baby) async {
    final db = await instance.database;
    final id = await db.insert('babies', baby.toMap());
    return baby.copy(id: id);
  }

  Future<List<Baby>> getAllBabies() async {
    final db = await instance.database;

    final List<Map<String, dynamic>> maps =
        await db.query('babies'); // Use 'babies' table

    if (maps.isNotEmpty) {
      return maps.map((map) => Baby.fromMap(map)).toList();
    } else {
      return []; // Return an empty list if no babies are found
    }
  }

  //add delete baby
  Future<int> deleteBaby(int id) async {
    final db = await instance.database;

    return await db.delete(
      'babies',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
