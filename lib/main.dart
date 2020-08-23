import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_todo_app/screens/HomeScreen.dart';
import 'package:getx_todo_app/screens/HomeScreen.dart';

void main() async {
  await GetStorage.init();

  runApp(GetMaterialApp(
    home: HomeScreen(),
    debugShowCheckedModeBanner: false,
  ));
}
