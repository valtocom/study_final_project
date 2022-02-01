import 'package:flutter/material.dart';
import 'package:study_final_project/screens/auth_screen.dart';
import 'package:study_final_project/screens/users_screen.dart';

void main () {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Study Final Project',
        initialRoute: '/',
        routes: {
          '/': (context) => const AuthScreen(),
          '/users': (context) => const UsersScreen(),
        }
    );
  }
}
