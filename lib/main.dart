import 'package:flutter/material.dart';
import 'home.dart';



void main() {
  //this line is the root of the web app, it tells the compiler to run our code
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key}); 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TAU Virtual Tour',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const HomeWidget(),
    );
  }
}

