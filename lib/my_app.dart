import 'package:flutter/material.dart';
import 'package:task_solid_software/app/presentation/home_screen.dart';

/// The main application widget.
class MyApp extends StatelessWidget {
  /// Creates a new instance of [MyApp]
  const MyApp({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }    
}
