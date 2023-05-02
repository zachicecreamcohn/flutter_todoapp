import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "To-Do List"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({required this.title}) : super();

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _todoItems = [];

  void _addTodoItem(String item) {
    setState(() {
      _todoItems.add(item);
    });
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_todoItems[index]),
        );
      },
      itemCount: _todoItems.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildTodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showDialog<String>(
            context: context,
            builder: (context) => _AddTodoDialog(),
          );
          if (result != null) {
            _addTodoItem(result);
          }
        },
        tooltip: 'Add Todo Item',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _AddTodoDialog extends StatefulWidget {
  const _AddTodoDialog({Key? key}) : super(key: key);

  @override
  _AddTodoDialogState createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<_AddTodoDialog> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Todo Item'),
      content: TextField(
        controller: _textController,
        autofocus: true,
        decoration: const InputDecoration(
          hintText: 'Enter a todo item',
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context, _textController.text);
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
