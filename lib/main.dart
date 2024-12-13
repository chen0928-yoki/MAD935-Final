import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_night/screens/welcome_screen.dart';

void main() {
  runApp(const MovieNightApp());
}

class MovieNightApp extends StatelessWidget {
  const MovieNightApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Night',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue, // Replace with your desired primary color
          brightness: Brightness.light,
        ),
        textTheme: TextTheme(
          displayLarge:
              GoogleFonts.roboto(fontSize: 36, fontWeight: FontWeight.bold),
          bodyMedium: GoogleFonts.roboto(fontSize: 16),
        ),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
    );
  }
}
