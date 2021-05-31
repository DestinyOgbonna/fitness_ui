import 'package:fitness_ui/ui/profilescreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Fitnessui());
}
class Fitnessui extends StatelessWidget {
  const Fitnessui({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner : false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: profileScreen(),
    );
  }
}


