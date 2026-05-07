import 'package:flutter/material.dart';
import 'screens/setup_screen.dart';

void main() {
  runApp(const ImposterApp());
}

class ImposterApp extends StatelessWidget {
  const ImposterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Imposter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFB91C1C),
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF111111),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontWeight: FontWeight.w800),
          headlineMedium: TextStyle(fontWeight: FontWeight.w700),
          titleLarge: TextStyle(fontWeight: FontWeight.w600),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(56),
            textStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
      ),
      home: const SetupScreen(),
    );
  }
}
