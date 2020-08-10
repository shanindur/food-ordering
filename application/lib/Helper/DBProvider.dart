import 'package:sqflite/sqflite.dart'; //sqflite package
import 'package:path_provider/path_provider.dart'; //path_provider package
import 'package:path/path.dart'; //used to join paths
import '../Model/UserModel.dart'; //import model class
import 'dart:io';
import 'dart:async';

class DBProvider{

  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path = join(directory.path,"memos.db"); //create path to database

    return await openDatabase( //open the database or create a database if there isn't any
        path,
        version: 1,
        onCreate: (Database db,int version) async{
          await db.execute("""
          CREATE TABLE Memos(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT,
          content TEXT)"""
          );
        });
  }

}