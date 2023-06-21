import 'package:bloc_increment/bloc/todo_bloc.dart';
import 'package:bloc_increment/bloc/todo_event.dart';
import 'package:bloc_increment/model/todo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: BlocBuilder<TodoBloc, List<Todo>>(
        builder: (context, todoList) {
          return ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              final todo = todoList[index];
              return Column(children: [
                Slidable(
                    endActionPane: ActionPane(
                      motion: const DrawerMotion(),
                      extentRatio: 0.4,
                      children: [
                        SlidableAction(
                            // label: 'Edit,
                            backgroundColor: Colors.blue,
                            icon: Icons.edit,
                            onPressed: (context) =>
                                todoBloc.add(EditTodoEvent(todo))),
                        SlidableAction(
                          // label: 'Delete',
                          backgroundColor: Colors.red,
                          icon: Icons.delete,
                          onPressed: (context) =>
                              todoBloc.add(DeleteTodoEvent(todo)),
                        ),
                      ],
                    ),
                    child: ListTile(
                        leading: Checkbox(
                          value: todo.isComplete,
                          onChanged: (_) {
                            todoBloc.add(ToggleTodoEvent(todo));
                          },
                        ),
                        title: Text(
                          todo.title,
                          style: TextStyle(
                            decoration: todo.isComplete
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        )))
              ]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showAddTodoDialog(context, todoBloc);
        },
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context, TodoBloc todoBloc) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController _titleController = TextEditingController();

        return AlertDialog(
          title: Text('Add Todo'),
          content: TextField(
            controller: _titleController,
            decoration: InputDecoration(
              hintText: 'Enter todo title',
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                final title = _titleController.text;
                if (title.isNotEmpty) {
                  final todo = Todo(
                    title: title,
                  );
                  todoBloc.add(AddTodoEvent(todo));
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
