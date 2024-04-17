

import 'package:flutter/material.dart';
import 'package:note_app/model/notes.dart';
import 'package:sqflite/sqflite.dart';
ValueNotifier<List<Notes>> noteslist=ValueNotifier([]);
late Database _db;
Future<void> initDataBase() async {
  _db = await openDatabase(
    'notes',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE notes (id INTEGER PRIMARY KEY ,title VARCHAR ,description VARCHAR)');
    },
  );
}
Future<void> getNotes()async{
  print('called');
 var data= await _db.rawQuery('SELECT * FROM notes');
 print(data);
//  noteslist.value.clear();
 data.forEach((element) { 
  final notes=Notes.fromMap(element);
  // print(notes);
  noteslist.value.add(notes);
  // print(noteslist.value);
  noteslist.notifyListeners();
 });
}
Future<void> addNotes(Notes notes)async{
  await _db.rawInsert('INSERT INTO notes(title,description) VALUES(?,?)',[notes.title,notes.des]);
 await getNotes();
}

Future<void> removeNotes({required int id})async{
await _db.rawDelete('DELETE FROM notes WHERE id = ?',[id]);
await getNotes();
}
// late Database db;
// Future initOtherbase()async{
//  db=await openDatabase('mybase',onCreate: (db, version) {
//     db.r
//   },);
// }