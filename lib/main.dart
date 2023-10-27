import 'package:flutter/material.dart';

import 'contacts_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home:ContactsList(),
      theme: ThemeData(primarySwatch: Colors.blue,)
    );
  }
}
