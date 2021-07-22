import 'package:flutter/material.dart';
import 'package:flutter_app/modules/todo/archived_tasks_screen.dart';
import 'package:flutter_app/modules/todo/done_tasks_screen.dart';
import 'package:flutter_app/modules/todo/new_tasks_screen.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/components/constants.dart';
import 'package:flutter_app/shared/cubit/cubit.dart';
import 'package:flutter_app/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget {


  var scaffoldKey = GlobalKey<ScaffoldState>();

  var timeController = TextEditingController();
  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  List<Map> list = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if(state is AppInsertToDatabase){
            Navigator.pop(context);
          }
          if(state is AppGetDatabaseLoadingState){
            CircularProgressIndicator();
          }
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            body: SingleChildScrollView(child: cubit.screens[cubit.currentIndex]),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState.validate()) {
                    cubit.changeBottomSheetState(false, Icons.edit);
                    cubit.insertToDatabase(titleController.text, timeController.text,
                        dateController.text);
                  }
                } else {
                  cubit.changeBottomSheetState(true, Icons.add);

                    scaffoldKey.currentState.showBottomSheet((context) {
                      return Container(
                        padding: EdgeInsets.all(8.0),
                        color: Colors.grey[200],
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              buildDefaultTFF(
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'title cannot be empty';
                                  }
                                  return null;
                                },
                                isPassword: false,
                                prefix: Icons.title,
                                labelText: 'Title',
                                controller: titleController,
                                type: TextInputType.text,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              buildDefaultTFF(
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'time cannot be empty';
                                  }
                                  return null;
                                },
                                isPassword: false,
                                prefix: Icons.watch_later_outlined,
                                labelText: 'Time',
                                onTap: () {
                                  // var date = await showTimePicker(context: context, initialTime: TimeOfDay.now()); a2dar a5od el time mn el timePicker blshakl da bs h3ml el onTap async aw bl shakl eli hktpo nw t7t
                                  // timeController.text = date.format(context);

                                  showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                      .then((value) {
                                    timeController.text =
                                        value.format(context).toString();
                                    print(value);
                                  });
                                  print('Time TFF tapped');
                                },
                                controller: timeController,
                                type: TextInputType.number,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              buildDefaultTFF(
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'date cannot be empty';
                                  }
                                  return null;
                                },
                                isPassword: false,
                                prefix: Icons.watch_later_outlined,
                                labelText: 'Date',
                                onTap: () {
                                  // var date = await showTimePicker(context: context, initialTime: TimeOfDay.now()); a2dar a5od el time mn el timePicker blshakl da bs h3ml el onTap async aw bl shakl eli hktpo nw t7t
                                  // timeController.text = date.format(context);

                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2022-05-03'),
                                  ).then((value) {
                                    dateController.text =
                                        DateFormat.yMMMd()
                                            .format(value)
                                            .toString();
                                    print(value);
                                  });
                                },
                                controller: dateController,
                                type: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).closed.then((value) {
                      cubit.changeBottomSheetState(false, Icons.edit);
                  });
                }

                // var name = await getName();
                // print(name);
                // insertToDatabase();
              },
              child: Icon(cubit.fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                  cubit.changePosition(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive), label: 'Archive'),
              ],
            ),
          );
        },
      ),
    );
  }






}


