import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataBaseSqflite {
  static const dataBaseName = "Manager.db";
  static const dataBase = "Manager.db";
  static const version = 1;
  static const TableName = 'Users';
  static const TableAccount = 'Account';
  static const id = 'ID';
  static const name = 'Name';
  static const number = 'Number';
  static const date = 'Date';
  static const price = 'Price';
  // static const buy = 'Buy';
  // static const quantity = 'Quantity';
  // static const date = 'Date';

  Database? _database;
  // var s;
  DataBaseSqflite() {
    databasesq;
    if (Platform.isWindows || Platform.isLinux) {
      databaseFactoryFfi;
    }
  }

  Future<Database?> get databasesq async {
    if (_database != null) {
      return _database;
    } else if (Platform.isWindows || Platform.isLinux) {
      return windowsApp();
    } else {
      return await initDataBase();
    }
  }

  Future<Database> initDataBase() async {
    var datPath = await getDatabasesPath();
    String path = join(datPath, dataBaseName);

    // if (await databaseExists(path)) {
    //   try {
    //     await Directory(dirname(path)).create(recursive: true);
    //   } catch (e) {
    //     if (kDebugMode) {
    //       print(e);
    //     }
    //   }

    //   ByteData data = await rootBundle.load(join("assets", dataBaseName));

    //   List<int> bytes =
    //       data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    //   await File(path).writeAsBytes(bytes);
    // }
    return await openDatabase(
      path,
      version: version,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE IF NOT EXISTS $TableName ($id INTEGER PRIMARY KEY AUTOINCREMENT  , $name TEXT , $number TEXT , $date TEXT , $price TEXT )");
        await db.execute(
            "CREATE TABLE IF NOT EXISTS $TableAccount ($id INTEGER PRIMARY KEY AUTOINCREMENT  , $name TEXT , $number TEXT , $date TEXT , $price TEXT )");
      },
    );
  }

  Future<Database?> windowsApp() async {
    final path = await getDatabasesPath();

    return await databaseFactoryFfi.openDatabase(
      path,
      options: OpenDatabaseOptions(
        version: version,
        onCreate: (db, version) async {
          await db.execute(
              "CREATE TABLE IF NOT EXISTS $TableName ($id INTEGER PRIMARY KEY AUTOINCREMENT  , $name TEXT , $number TEXT , $date TEXT , $price TEXT )");

          await db.execute(
              "CREATE TABLE IF NOT EXISTS $TableName ($id INTEGER PRIMARY KEY AUTOINCREMENT  , $name TEXT , $number TEXT , $date TEXT , $price TEXT )");
        },
      ),
    );
  }

  Future<int> insert(Map<String, dynamic> data) async {
    Database? db = await databasesq;
    return db!.insert(
      TableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> insertInAccount(
    Map<String, dynamic> data,
  ) async {
    Database? db = await databasesq;
    // db?.rawDelete(
    //   'DELETE FROM $TableName WHERE ID = ?',
    //   [id],
    // );
    return db!.insert(
      TableAccount,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>?>> getAllDataFromAccount(skip, limit) async {
    Database? db = await databasesq;
    var result = await db!.rawQuery(
        'SELECT * FROM $TableAccount  WHERE ID > $skip ORDER BY ID LIMIT $limit');

    return result.toList();
  }

  Future<int> updateItem(Map<String, dynamic> data, String i) async {
    Database? db = await databasesq;
    return db!.update(TableName, data, where: '$id = ?', whereArgs: [i]);
  }

  Future<List<Map<String, dynamic>?>> getAllUser(skip, limit) async {
    Database? db = await databasesq;
    var result = await db!.rawQuery(
        'SELECT * FROM $TableName  WHERE ID > $skip ORDER BY ID LIMIT $limit');

    return result.toList();
  }

  // delete
  Future<Future<int>?> delete(String id) async {
    Database? db = await databasesq;

    return db?.rawDelete(
      'DELETE FROM $TableName WHERE ID = ?',
      [id],
    );
  }

  Future<Future<int>?> deleteAccount(String id) async {
    Database? db = await databasesq;

    return db?.rawDelete(
      'DELETE FROM $TableAccount WHERE ID = ?',
      [id],
    );
  }

  Future<List<Map<String, dynamic>>> searchInDatabase(
    String query,
  ) async {
    Database? db = await databasesq;
    return await db!.query(
      TableName,
      where: '$name LIKE ?',
      whereArgs: ['%$query%'],
    );
  }

  Future<List<Map<String, dynamic>>> getAllData() async {
    Database? db = await databasesq;
    return await db!.query(
      TableName,
    );
  }

  // Future<void> updateCostCol(double newValue) async {
  //   final db = await databasesq;
  //   List<Map<String, dynamic>> rows = await db!.query(TableName);
  //   List<Map<String, dynamic>> updatedRows = rows.map((row) {
  //     String num = row[sale].toString().replaceAll(RegExp(r'[^0-9.]'), '');
  //     log('____$num');
  //     double oldValue = double.parse(num);
  //     double updatedValue = oldValue + newValue;
  //     return {...row, sale: updatedValue};
  //   }).toList();
  //   Batch batch = db.batch();
  //   for (var row in updatedRows) {
  //     batch.update(
  //       TableName,
  //       row,
  //       where: 'id = ?',
  //       whereArgs: [row[id]],
  //     );
  //     log('___${row[id].toString()}');
  //   }
  //   await batch.commit();
  // }

  // Future<void> updateBuyCol(double newValue) async {
  //   final db = await databasesq;
  //   List<Map<String, dynamic>> rows = await db!.query(TableName);
  //   List<Map<String, dynamic>> updatedRows = rows.map((row) {
  //     String num = row[buy].toString().replaceAll(RegExp(r'[^0-9.]'), '');
  //     log('____$num');
  //     double oldValue = double.parse(num);
  //     double updatedValue = oldValue + newValue;
  //     return {...row, buy: updatedValue};
  //   }).toList();
  //   Batch batch = db.batch();
  //   for (var row in updatedRows) {
  //     batch.update(
  //       TableName,
  //       row,
  //       where: 'id = ?',
  //       whereArgs: [row[id]],
  //     );
  //     log('___${row[id].toString()}');
  //   }
  //   await batch.commit();
  // }

  Future<List<Map<String, dynamic>>> accountOrder(
    String query,
  ) async {
    Database? db = await databasesq;
    // final List<Map<String, dynamic>> results =
    return await db!.query(
      TableName,
      where: '$name LIKE ?',
      whereArgs: ['%$query%'],
    );
  }
}
