// ignore: file_names
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class taskWordToDo extends StatelessWidget {
  taskWordToDo({
    super.key,
    this.item,
    required this.index,
    required this.handleDelete,
  });
  dynamic item;
  var index;
  final Function handleDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: index % 2 == 0 ? Colors.brown : Colors.grey),
      width: double.infinity,
      height: 70,
      margin: const EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  return handleDelete(item.id);
                }
                return;
              },
              child: const Icon(
                Icons.delete_forever,
                size: 30,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
