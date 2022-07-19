import 'package:chat_app_clone/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.red,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: const Color(0xFFFEF9EB))),
      home: const HomeScreen(),
    );
  }
}
