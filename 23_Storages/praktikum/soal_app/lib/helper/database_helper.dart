import 'package:path/path.dart';
import 'package:soal_app/model/contacts_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? databaseHelper;
  static late Database _db;

  DatabaseHelper._internal() {
    databaseHelper = this;
  }

  factory DatabaseHelper() => databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _db = await _initializeDb();
    return _db;
  }

  final String _tableName = 'contacts';

  Future<Database> _initializeDb() async {
    var db = await openDatabase(
      join(await getDatabasesPath(), 'contactdatabase.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName(
        id INTEGER PRIMARY KEY AUTO INCREMENT,
        name TEXT,
        number INTEGER,
        date VARCHAR,
        color VARCHAR,
        file VARCHAR
      ); ''',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertContact(Contact contact) async {
    final Database db = await database;
    await db.insert(_tableName, contact.toMap());
  }

  Future<List<Contact>> getContacts() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    return results.map((e) => Contact.fromMap(e)).toList();
  }

  Future<Contact> getContactbyId(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.map((e) => Contact.fromMap(e)).first;
  }

  Future<void> updateContact(Contact contact) async {
    final db = await database;
    await db.update(
      _tableName,
      contact.toMap(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<void> deleteContact(int id) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
