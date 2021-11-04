import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith( 
      primaryColor: Color(0xff0b0e21),
      // accentColor: Colors.blueGrey,
      scaffoldBackgroundColor: Color(0xff0b0e21),
      ),
  
    
      home: HomeView(),
    );
  }
}

