import 'package:flutter/material.dart';
import 'package:plant_species/home.dart';
import 'package:plant_species/navigation.dart';
import 'package:plant_species/dashboard.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plants Species Detection',
      home: Home(),
    );
  }
}
