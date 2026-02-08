import 'package:flutter/material.dart';
import 'package:my_app/screens/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/screens/theme/apptheme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    debugPrint("Error loading .env file: $e");
  }

  final supabaseUrl = dotenv.env['SUPABASE_URL'];
  final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY']; // or SUPABASE_ANON_KEY

  if (supabaseUrl == null || supabaseUrl.isEmpty) {
    debugPrint("Missing SUPABASE_URL. Check .env and pubspec.yaml assets.");
    return;
  }

  if (supabaseAnonKey == null || supabaseAnonKey.isEmpty) {
    debugPrint("Missing SUPABASE_API_KEY. Check .env and pubspec.yaml assets.");
    return;
  }

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifeDashboard',
      theme: appTheme,
      home: const MyHomePage(title: 'Dashboard'),
    );
  }
}
