import 'package:bmi_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'screens/home_screen.dart';

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
      primaryColor: AppColors.bGColor,
      // accentColor: Colors.blueGrey,
      scaffoldBackgroundColor: AppColors.bGColor,
      ),
  
    
      home: HomeScreen(),
    );
  }
}

