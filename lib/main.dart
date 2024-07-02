import 'package:flutter/material.dart';
import 'login_page.dart'; // Remove this line
import 'registration_page.dart';
import 'explore.dart';
import 'category.dart';
import 'country.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => LoginPage(),
        '/signup': (BuildContext context) => RegistrationPage(),
        '/explore': (BuildContext context) => ExplorePage(),
        '/category': (BuildContext context) => CategoryPage(),
      },
    );
  }
}
