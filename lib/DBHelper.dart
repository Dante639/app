import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper{
  static Future<void> insert(String table, Map<String,Object table>data)
async{final dbPath = await getDatabasesPath();
  final sqlDB = await openDatabase(join(dbPath,'places.db'),onCreate: (db,version){
    return db.execute('CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');

    },version: 1);
  await sqlDB.insert(table , data,conflictAlgorithm: ConflictAlgorithm.replace);
  }

}