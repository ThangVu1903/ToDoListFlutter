import 'package:flutter/material.dart';

class modelBottomAddTask extends StatelessWidget {
  modelBottomAddTask({
    super.key,
    required this.addTask,
  });
  final Function addTask;
  TextEditingController controller = TextEditingController();
  void handleOnClick(BuildContext context) {
    final name = controller.text; // sau khi click nhận được giá trị name
    if (name.isEmpty) {
      return;
    }
    addTask(
        name); //truyền bên name nhận được vào biến function addTask rồi truyền qua main.dart
    Navigator.pop(context); // trả về màn hình trước đó
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        height: 200,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: ('Your word'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                  onPressed: () => handleOnClick(context), // truyền vào context
                  //(ct ở đây để đánh dấu vị trí trang) để ẩn textfield dau khi nhập và ấn add task
                  child: const Text(
                    'Add Task',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
