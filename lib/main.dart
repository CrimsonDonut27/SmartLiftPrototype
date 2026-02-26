import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';


void main() async {
  // initialize hive
  await Hive.initFlutter();
 // open a box
  await Hive.openBox('myBox');



  runApp(MyApp());
}





class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );

  }
}
