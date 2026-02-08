import 'package:flutter/material.dart';
import 'package:my_app/screens/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/screens/theme/apptheme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

Future<void> main() async {
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    debugPrint("Error loading .env file: $e");
  }

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_API_KEY']!,
  );
  // API key for Gemini initialization

  await Gemini.init(
    apiKey: dotenv.env['GEMINI_API_KEY']!, 
    enableDebugging: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifeDashboard',
      theme: appTheme,
      home: const MyHomePage(title: 'Dashboard'),
    );
  }
}

