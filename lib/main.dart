import 'package:bmi_calculator_flutter/input_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme(
          primary: Color.fromARGB(255, 121, 62, 142),
          onPrimary: Colors.white,
          secondary: Color.fromARGB(255, 6, 6, 7),
          onSecondary: Colors.white,
          error: Color(0xFF0A0E21),
          onError: Colors.white,
          surfaceContainerHighest: Colors.white,
          surface: Color.fromARGB(255, 121, 62, 142),
          onSurface: Color.fromARGB(255, 0, 0, 0),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      ),
      home: const InputPage(),
    );
  }
}
