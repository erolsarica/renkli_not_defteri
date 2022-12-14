import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp_yellow/homepage.dart';

void main() async{

  // Hive başlat
  await Hive.initFlutter();

  // open a box
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
          textTheme: TextTheme(bodyMedium: GoogleFonts.zillaSlab(fontWeight: FontWeight.bold, fontSize: 18)),
          primarySwatch: Colors.yellow),

    );
  }
}