import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/controllers/TodoController.dart';
import 'package:getx_todo_app/models/todo.dart';

class TodoScreen extends StatelessWidget {
  final TodoController todoController = Get.find();
  final int index;

  TodoScreen({this.index});

  /// Build this widget.
  @override
  Widget build(BuildContext context) {
    String text = '';
    if (!this.index.isNull) {
      text = todoController.todos[index].text;
    }

    TextEditingController textEditingController =
        TextEditingController(text: text);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
                child: TextField(
              controller: textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                  hintText: 'What do you want to accomplish?',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none),
              style: TextStyle(fontSize: 25),
              keyboardType: TextInputType.multiline,
              maxLines: 999,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                    child: Text("Cancel"),
                    color: Colors.red,
                    onPressed: () {
                      Get.back();
                    }),
                RaisedButton(
                    child: this.index.isNull ? Text("Add") : Text("Edit"),
                    color: Colors.green,
                    onPressed: () {
                      if (this.index.isNull) {
                        todoController.todos
                            .add(Todo(text: textEditingController.text));
                      } else {
                        var editing = todoController.todos[index];
                        editing.text = textEditingController.text;
                        todoController.todos[index] = editing;
                      }
                      Get.back();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
