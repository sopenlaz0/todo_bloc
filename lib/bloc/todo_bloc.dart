import 'dart:async';
import 'package:bloc_increment/bloc/todo_event.dart';
import 'package:bloc_increment/model/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvent, List<Todo>> {
  TodoBloc() : super([]);

  @override
  Stream<List<Todo>> mapEventToState(TodoEvent event) async* {
    if (event is AddTodoEvent) {
      yield [...state, event.todo];
    } else if (event is ToggleTodoEvent) {
      final updatedList = state.map((todo) {
        if (todo == event.todo) {
          return Todo(
            title: todo.title,
            isComplete: !todo.isComplete,
          );
        }
        return todo;
      }).toList();
      yield updatedList;
    }
    else if (event is DeleteTodoEvent) {
      final updatedList = state.where((todo) => todo != event.todo).toList();
      yield updatedList;
    }
    else if (event is EditTodoEvent) {
      final updatedList = state.map((todo) {
        if (todo == event.todo) {
          return Todo(
            title: event.todo.title,
            isComplete: event.todo.isComplete,
          );
        }
        return todo;
      }).toList();
      yield updatedList;
    }
    else if (event is ToggleAllTodoEvent) {
      final updatedList = state.map((todo) {
        return Todo(
          title: todo.title,
          isComplete: event.isComplete,
        );
      }).toList();
      yield updatedList;
    }
    else if (event is ClearCompletedTodoEvent) {
      final updatedList = state.where((todo) => !todo.isComplete).toList();
      yield updatedList;
    }
  }
}
