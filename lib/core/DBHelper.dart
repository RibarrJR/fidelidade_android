import 'dart:async';
import 'dart:io' as io;

import 'package:fidelidade_android/core/model/bank.dart';
import 'package:fidelidade_android/core/model/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "maisfidelidade.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE bank(id INTEGER PRIMARY KEY, nome TEXT, account TEXT, agency TEXT, code TEXT, type TEXT )");
    await db.execute(
        "CREATE TABLE user(id INTEGER PRIMARY KEY, nome TEXT, email TEXT)");
    print("Created tables");
  }

  void saveUser(User user) async {
    var dbClient = await db;
    await dbClient?.transaction((txn) async {
      return await txn.rawInsert(
          "INSERT INTO User(nome, account, agency, code, type) VALUES('" +
              user.name +
              "', '" +
              user.email +
              "')");
    });
  }

  Future<User> getUser() async {
    var dbClient = await db;
    List<Map> list =
        (await dbClient?.rawQuery('SELECT * FROM Bank'))!.cast<Map>();
    User user = User(list[0]["name"], list[0]["email"]);
    return user;
  }

  void saveBank(Bank bank) async {
    var dbClient = await db;
    await dbClient?.transaction((txn) async {
      return await txn.rawInsert(
          "INSERT INTO Bank(nome, account, agency, code, type) VALUES('" +
              bank.name +
              "', '" +
              bank.account +
              "', '" +
              bank.agency +
              "', '" +
              bank.code +
              "', '" +
              bank.type +
              "')");
    });
  }

  Future<List<Bank>> getBankList() async {
    var dbClient = await db;
    List<Map> list =
        (await dbClient?.rawQuery('SELECT * FROM Bank'))!.cast<Map>();
    List<Bank> banks = [];
    for (int i = 0; i < list.length; i++) {
      banks.add(Bank(list[i]["name"], list[i]["account"], list[i]["agency"],
          list[i]["code"], list[i]["type"]));
    }
    print(banks.length);
    return banks;
  }
}
