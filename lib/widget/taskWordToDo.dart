// ignore: file_names
import 'package:flutter/material.dart';

class taskWordToDo extends StatelessWidget {
  taskWordToDo({
    super.key,
    this.item,
    required this.handleDelete,
  });
  dynamic item;
  final Function handleDelete;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.brown),
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
              onTap: () {
                handleDelete(item.id);
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
