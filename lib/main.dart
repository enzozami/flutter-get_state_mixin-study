import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_state_mixin/pages/home_bindings.dart';
import 'package:get_state_mixin/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Get State Mixin',
      theme: ThemeData(primaryColor: Colors.blue),
      getPages: [
        GetPage(
          name: '/',
          binding: HomeBindings(),
          page: () => HomePage(),
        ),
      ],
    );
  }
}
