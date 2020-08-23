import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_todo_app/models/todo.dart';

class TodoController extends GetxController {
  var todos = List<Todo>().obs;

  @override
  void onInit() {
    List storedTodos = GetStorage().read<List>('todos');

    // if (!storedTodos.isEmpty) {
    //   todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
    // }
    // ever(todos, (_) {
    //   GetStorage().write('todos', todos.toList());
    // });
    super.onInit();
  }
}
