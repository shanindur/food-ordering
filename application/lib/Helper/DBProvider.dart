import 'package:flutter/material.dart';
import 'package:food_app/Model/OrderModel.dart';
import 'package:sqflite/sqflite.dart'; //sqflite package
import 'package:path_provider/path_provider.dart'; //path_provider package
import 'package:path/path.dart'; //used to join paths
import '../Model/UserModel.dart';
import 'dart:io';
import 'dart:async';

class DBProvider{

  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path = join(directory.path,"foods.db"); //create path to database

    return await openDatabase( //open the database or create a database if there isn't any
        path,
        version: 1,
        onCreate: (Database db,int version) async{
          await db.execute("""
          CREATE TABLE Users(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          email TEXT)"""
          );
          print("Created User table");

          await db.execute("""
          CREATE TABLE Orders(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          foodId INTEGER,
          foodType TEXT,
          fooName TEXT,
          imagePath TEXT,
          createdAt TEXT,
          status INTEGER)"""
          );
          print("Created Order table");
        });
  }

  //User Table functions
  Future<int> addUser(UserModel item) async{ //returns number of items inserted as an integer
    final db = await init(); //open database
    return db.insert("Users", item.toMap(), //toMap() function from MemoModel
      conflictAlgorithm: ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  Future<List<UserModel>> fetchUsers() async{ //returns the memos as a list (array)

    final db = await init();
    final maps = await db.query("Users"); //query all the rows in a table as an array of maps

    return List.generate(maps.length, (i) { //create a list of memos
      return UserModel(
        id: maps[i]['id'],
        email: maps[i]['email']
      );
    });
  }

  Future<int> deleteUser(int id) async{ //returns number of items deleted
    final db = await init();

    int result = await db.delete(
        "Users", //table name
        where: "id = ?",
        whereArgs: [id] // use whereArgs to avoid SQL injection
    );

    return result;
  }

  Future<int> updateUser(int id, UserModel item) async{ // returns the number of rows updated

    final db = await init();

    int result = await db.update(
        "Users",
        item.toMap(),
        where: "id = ?",
        whereArgs: [id]
    );
    return result;
  }


  //Order Table functions
  Future<int> addOrder(OrderModel item) async{ //returns number of items inserted as an integer
    final db = await init(); //open database
    return db.insert("Orders", item.toMap(), //toMap() function from MemoModel
      conflictAlgorithm: ConflictAlgorithm.ignore, //ignores conflicts due to duplicate entries
    );
  }

  Future<List<OrderModel>> fetchOrders() async{ //returns the memos as a list (array)

    final db = await init();
    final maps = await db.query("Orders"); //query all the rows in a table as an array of maps

    return List.generate(maps.length, (i) { //create a list of orders
      return OrderModel(
        id: maps[i]['id'],
        foodId: maps[i]['foodId'],
        foodType: maps[i]['foodType'],
        foodName : maps[i]['fooName'],
        imagePath: maps[i]['imagePath'],
        createdAt: maps[i]['createdAt'],
        status: maps[i]['status'],

      );
    });
  }

  Future<int> deleteOrder(int id) async{ //returns number of items deleted
    final db = await init();

    int result = await db.delete(
        "Orders", //table name
        where: "id = ?",
        whereArgs: [id] // use whereArgs to avoid SQL injection
    );

    return result;
  }

  Future<int> updateOrder(int id, OrderModel item) async{ // returns the number of rows updated

    final db = await init();

    int result = await db.update(
        "Orders",
        item.toMap(),
        where: "id = ?",
        whereArgs: [id]
    );
    return result;
  }
}