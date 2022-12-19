import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import '../models/note.dart';
import 'package:path/path.dart';
part 'date_base_state.dart';

class DateBaseCubit extends Cubit<DateBaseState> {
  DateBaseCubit._() : super(DateBaseInitial());
  static final DateBaseCubit instance = DateBaseCubit._();
  static Database? _database;
  List<Note> notes = [];
  List<Note> searchNotes = [];

  static DateBaseCubit get(context) => BlocProvider.of(context);
  Future<Database?> get db async {
    if (_database == null) {
      _database = await initialDb();
      return _database;
    } else {
      return _database;
    }
  }
  initialDb()async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'notes.db');
    Database mydb = await openDatabase(path, onCreate: _createDB, version: 1);
    return mydb;
  }
  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const boolType = 'BOOLEAN NOT NULL';
   // const integerType = 'INTEGER NOT NULL';
    await db.execute('''
CREATE TABLE $tableNotes ( 
  ${NoteFields.id} $idType, 
  ${NoteFields.isImportant} $boolType,
  ${NoteFields.title} $textType,
  ${NoteFields.description} $textType,
  ${NoteFields.time} $textType
  )
''');
    emit(AppCreateDatabaseState());
  }

  Future<Note?> insert(Note note)async{
    final myDateBase=await db;
   try{
    final int id= await myDateBase!.insert(tableNotes , note.toJson());
    emit(AppInsertDatabaseState());
    getAllNote();
    return note.copy(id: id);
  }catch(e){
     return null;
   }
  }

  Future<List<Note>?> getAllNote()async{
    final myDateBase=await db;
    const orderBy = '${NoteFields.time} DESC';
    try{
      emit(AppGetDatabaseLoadingState());
      final query= await myDateBase!.query(tableNotes,orderBy: orderBy);
      notes=query.map((e) => Note.fromJson(e)).toList();
      emit(AppGetDatabaseState());
      return notes;
    }catch(e){
      return null;
    }
  }

  Future<int?> update(Note note) async {
    final dataBase = await db;
    emit(AppUpdateDatabaseState());
    return dataBase!.update(
      tableNotes,
      note.toJson(),
      where: '${NoteFields.id} = ?',
      whereArgs: [note.id],
    ).then((value) {
      getAllNote();
    });
  }

  Future<int?> delete(int id) async {
    final dataBase = await db;

    return await dataBase!.delete(
      tableNotes,
      where: '${NoteFields.id} = ?',
      whereArgs: [id],
    ).then((value) {
      getAllNote();
      emit(AppDeleteDatabaseState());
    });
  }

  search(String title) {
    searchNotes =
        notes.where((element) => element.title.contains(title)).toList();
    emit(SearchState());
    return searchNotes;
  }

  Future close() async {
    final dataBase = await db;
    dataBase!.close();
  }


}
