import 'package:flutter/material.dart';
import 'package:to_do_list/model/task.dart';

import 'widget/modelBottomAddTask.dart';
import 'widget/taskWordToDo.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<taskWord> list_task = [];

  void _handleDeleteTap(String id) {
    setState(() {
      list_task.removeWhere((element) => element.id == id);
    });
  }

  void _handleAddTask(String name) {
    final newTask = taskWord(DateTime.now().toString(), name);

    setState(() {
      list_task.add(newTask); // thông báo cho flutter là có dữ liệu thay đổi
    });
  }

  //sau khi ấn nút add task thì nhận được function này và nhận được giá trị name
  @override
  Widget build(BuildContext context) {
    print("đã thay đổi data");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'TO DO LIST',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 167, 238),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
            children: list_task
                .map((item) => taskWordToDo(
                    item: item,
                    handleDelete: _handleDeleteTap,
                    index: list_task.indexOf(item)))
                .toList()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            isScrollControlled: true,
            context: context,
            builder: (BuildContext content) {
              return modelBottomAddTask(addTask: _handleAddTask);
            },
          );
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
