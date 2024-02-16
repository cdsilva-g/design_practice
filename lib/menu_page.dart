import 'package:design_practice/Assignment.dart';
import 'package:design_practice/counter_app.dart';
import 'package:design_practice/grid_view_example.dart';
import 'package:design_practice/home_page.dart';
import 'package:design_practice/input_widgets_example.dart';
import 'package:design_practice/list_view_example.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu'),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Text('Go Home')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ListViewExample()),
                  );
                },
                child: const Text('ListView Example')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GridViewExample()),
                  );
                },
                child: const Text('GridView Example')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CounterApp()),
                  );
                },
                child: const Text('CounterApp Example')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const InputWidgetsExample()),
                  );
                },
                child: const Text('InputWidgets Example')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ToDoApp()),
                  );
                },
                child: const Text('My ToDo App')),
          ],
        ),
      ),
    );
  }
}
