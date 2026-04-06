import 'package:flutter/material.dart';
import 'package:flutter_application_2/navbar.dart';
import 'package:flutter_application_2/splash_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: "https://audupdxanecytckwhopl.supabase.co",
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF1ZHVwZHhhbmVjeXRja3dob3BsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjI2NTMzNzQsImV4cCI6MjA3ODIyOTM3NH0.ujtuUp6DuaL2-CCdbxIKw-acJNtl0XI6wSg_GkF7Kdg",
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Hello World',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return NavBar();
  }
}
