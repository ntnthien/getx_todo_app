import 'package:flutter/material.dart';
import 'package:getx_todo_app/controllers/TodoController.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/screens/TodoScreen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TodoController todoController = Get.put(TodoController());
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(TodoScreen());
        },
      ),
      body: Container(
        child: Obx(() => ListView.separated(
              itemBuilder: (context, index) => Dismissible(
                key: UniqueKey(),
                onDismissed: (_) {
                  var removed = todoController.todos[index];
                  todoController.todos.removeAt(index);
                  Get.snackbar(
                      "Task removed", "The task ${removed.text} is removed!",
                      mainButton: FlatButton(
                          onPressed: () {
                            todoController.todos.insert(index, removed);
                          },
                          child: Text("Undo")));
                },
                child: ListTile(
                  title: Text(
                    todoController.todos[index].text,
                    style: todoController.todos[index].done
                        ? TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough)
                        : TextStyle(
                            color: Theme.of(context).textTheme.bodyText1.color),
                  ),
                  leading: Checkbox(
                    value: todoController.todos[index].done,
                    onChanged: (value) {
                      var changed = todoController.todos[index];
                      changed.done = value;
                      todoController.todos[index] = changed;
                    },
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Get.to(TodoScreen(
                      index: index,
                    ));
                  },
                ),
              ),
              separatorBuilder: (_, __) => Divider(),
              itemCount: todoController.todos.length,
            )),
      ),
    );
  }
}
