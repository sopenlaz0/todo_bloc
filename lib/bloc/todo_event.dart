import 'package:bloc_increment/model/todo_model.dart';

abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final Todo todo;

  AddTodoEvent(this.todo);
}

class ToggleTodoEvent extends TodoEvent {
  final Todo todo;

  ToggleTodoEvent(this.todo);
}

class DeleteTodoEvent extends TodoEvent {
  final Todo todo;

  DeleteTodoEvent(this.todo);
}

class EditTodoEvent extends TodoEvent {
  final Todo todo;

  EditTodoEvent(this.todo);
}

class ToggleAllTodoEvent extends TodoEvent {
  final bool isComplete;

  ToggleAllTodoEvent(this.isComplete);
}

class ClearCompletedTodoEvent extends TodoEvent {
  ClearCompletedTodoEvent();
}

// class FilterTodoEvent extends TodoEvent {
//   final TodoFilter filter;

//   FilterTodoEvent(this.filter);
// }

