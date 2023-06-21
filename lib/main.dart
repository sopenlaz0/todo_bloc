import 'package:bloc_increment/bloc/todo_bloc.dart';
import 'package:bloc_increment/pages/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoBloc>(
      create: (context) => TodoBloc(),
      
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
        title: 'Todo App',
        home: TodoListPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
