import 'package:design_practice/todo_app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum TodoPriority {
  Low,
  Normal,
  High,
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  TodoPriority priority = TodoPriority.Normal;
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My ToDos'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addTodo();
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, provider, child) {
          if (provider.todos.isEmpty) {
            return const Center(
              child: Text('Nothing to do!'),
            );
          } else {
            return ListView.builder(
              itemCount: MyTodo.todos.length,
              itemBuilder: (context, index) {
                final todo = MyTodo.todos[index];
                return TodoItem(
                    todo: todo,
                    onChanged: (value) {
                      provider.updateTodo(value, index);
                    });
              },
            );
          }
        },
      ),
    );
  }

  void addTodo() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => StatefulBuilder(
              builder: (context, setBuilderState) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: InputDecoration(hintText: 'What to do?'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Select Priosity'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio<TodoPriority>(
                          value: TodoPriority.Low,
                          groupValue: priority,
                          onChanged: (value) {
                            setBuilderState(
                              () {
                                priority = value!;
                              },
                            );
                          },
                        ),
                        Text(TodoPriority.Low.name),
                        Radio<TodoPriority>(
                          value: TodoPriority.Normal,
                          groupValue: priority,
                          onChanged: (value) {
                            setBuilderState(
                              () {
                                priority = value!;
                              },
                            );
                          },
                        ),
                        Text(TodoPriority.Normal.name),
                        Radio<TodoPriority>(
                          value: TodoPriority.High,
                          groupValue: priority,
                          onChanged: (value) {
                            setBuilderState(
                              () {
                                priority = value!;
                              },
                            );
                          },
                        ),
                        Text(TodoPriority.High.name),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: _save,
                      child: Text('SAVE'),
                    ),
                  ],
                ),
              ),
            ));
  }

  void _save() {
    if (_controller.text.isEmpty) {
      showMsg(context, 'Input field must not be empty');
      return;
    }

    final todo = MyTodo(
      id: DateTime.now().microsecondsSinceEpoch,
      name: _controller.text,
      priority: priority,
    );

    MyTodo.todos.add(todo);
    _controller.clear();
    setState(() {});
    Navigator.pop(context);
  }
}

void showMsg(BuildContext context, String s) {
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Caution!'),
            content: Text(s),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('CLOSE'),
              )
            ],
          ));
}

class TodoItem extends StatelessWidget {
  final MyTodo todo;
  final Function(bool) onChanged;

  const TodoItem({super.key, required this.todo, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        title: Text(todo.name),
        subtitle: Text('Priority ${todo.priority.name}'),
        value: todo.completed,
        onChanged: (value) {
          onChanged(value!);
        });
  }
}

class MyTodo {
  int id;
  String name;
  bool completed;
  TodoPriority priority;

  MyTodo({
    required this.id,
    required this.name,
    this.completed = false,
    required this.priority,
  });

  static List<MyTodo> todos = [];
}
