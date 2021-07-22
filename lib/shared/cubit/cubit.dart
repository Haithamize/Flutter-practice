import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/todo/archived_tasks_screen.dart';
import 'package:flutter_app/modules/todo/done_tasks_screen.dart';
import 'package:flutter_app/modules/todo/new_tasks_screen.dart';
import 'package:flutter_app/network/local/cache_sharedpref.dart';
import 'package:flutter_app/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());

  bool isLightTheme = false; //dol tb3 el news app bs ana 3mltha hna fl cubit da w h3ml listen mn hna

  void changeTheme({
  bool fromSharedPrefValue
}){

    if(fromSharedPrefValue != null){ //3mlt el if statement de 3shan a7el awl case bs eli hya lw el user awl mara yft7 el app fa msh hyb2a feh haga fl sharepref
      isLightTheme = fromSharedPrefValue;
    }else {
      isLightTheme = !isLightTheme;
    }
    CacheHelper.setBool('isLight', isLightTheme);
    emit(AppChangeThemeModeState()); //mtnsash el state dymn
  }

  Database database;
  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  int currentIndex = 0;
  List<Widget> screens = [
    NewTasks(),
    DoneTasks(),
    ArchivedTasks(),
  ];
  List<String> titles = ['New Tasks', 'Done Tasks', 'Archived Tasks'];

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];


  static AppCubit get(context) => BlocProvider.of(context);

  changePosition(int index){
    currentIndex = index;
    emit(AppBottomNavState());
  }

  void createDatabase()  {
     openDatabase('todo.db', version: 1,
        onCreate: (database, version) async {
          print('Database created');
          database
              .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, time TEXT, date TEXT, status TEXT)')
              .then((value) => print('Table created'));
        }, onOpen: (database) {
          getDataFromDatabase(database);
        }).then((value) {
          print('database created');
          database = value;
          emit(AppCreateDatabase());
     });
  }

   getDataFromDatabase(Database database) async {
     database.rawQuery('SELECT * FROM tasks').then((value) {
       print('database opened');
       newTasks = [];   //hna basaffar el lists eli 3ndi 3shan el 7aga myt3mlhash add 3la adim eli kan feha kol mra ados 3la zorar el archive aw el done fa hna bassaffar w b3d el gded
       archivedTasks = [];
       doneTasks = [];

       value.forEach((element) {
         if(element['status'] == 'new'){
           newTasks.add(element);
         }
         if(element['status'] == 'done'){
           doneTasks.add(element);
         }
         if(element['status'] == 'archived'){
           archivedTasks.add(element);
         }

       });

       emit(AppOpenDatabase());
     });
  }


  insertToDatabase(String title, String time, String date) async {
   await database.transaction((txn) {
    txn.rawInsert(
        'INSERT INTO tasks (title,date,time,status) VALUES ("$title","$date","$time","new")')
        .then((value){
      print('Record inserted in $value');
      emit(AppInsertToDatabase());

      getDataFromDatabase(database);

    }).catchError((error) {
      print('error occurred when inserting record ${error.toString()}');
    });
  return null;
  });
}

void changeBottomSheetState(isShown, icon){
    isBottomSheetShown = isShown;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
}

void updateDatabase(String status, int id) async{
  database.rawUpdate(
      'UPDATE tasks SET status = ? WHERE id = ?',
      ['$status', '$id']).then((value) {
        getDataFromDatabase(database); //3ayz kol mra a3ml update agib el data tani mn el database 3shan tzhar f nfs el w2t
    emit(AppUpdateDatabase());
  });
}

void deleteTask(int id) async{
  database.rawUpdate('DELETE FROM tasks WHERE id = ?', [id])
      .then((value) {
        getDataFromDatabase(database); //3ayz kol mra a3ml update agib el data tani mn el database 3shan tzhar f nfs el w2t
    emit(AppDeleteFromDatabase());
  });
}


}