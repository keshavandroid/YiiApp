import 'package:sqflite/sqflite.dart';
import 'package:yii_app/model/userdata_model.dart';
import 'package:path/path.dart';

class DBHelper {
  static Future<Database> initDB() async {

    final path = join(await getDatabasesPath(), 'users.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            userId INTEGER,
            userName TEXT,
            email TEXT,
            userToken TEXT,
            phoneNumber TEXT,
            otp TEXT,
            countryId TEXT
          )
        ''');
      },
    );
  }

  static Future<int> insertUser(UserdataModel user) async {
    final db = await initDB();
    await db.delete('users');
    print('Inserting user: ${user.toMap()}');
    return await db.insert('users', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future <UserdataModel?> getUsers() async {
    final db = await initDB();
    final List<Map<String, dynamic>> maps = await db.query('users');
    if (maps.isNotEmpty) {
      return UserdataModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  static Future<void> deleteUser(int id) async {
    final db = await initDB();
    await db.delete('users', where: 'userId = ?', whereArgs: [id]);
  }
}
