import 'package:flutter/material.dart';

import 'screens/input_page.dart';

void main() {
  runApp(const BmiApp());
}

class BmiApp extends StatelessWidget {
  const BmiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        textTheme: TextTheme(
          bodySmall: TextStyle(
            color:Colors.white
          ),
          bodyMedium: TextStyle(
              color:Colors.white
          ),
          bodyLarge: TextStyle(
              color:Colors.white
          ),
        )
      ),
      home: InputPage()
    );
  }
}







