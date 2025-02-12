import 'package:flutter/material.dart';
import 'package:ict_hub_session/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://mbpadqmjzirzxibjstoe.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1icGFkcW1qemlyenhpYmpzdG9lIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzkxMjkyMjgsImV4cCI6MjA1NDcwNTIyOH0.HCVvrW5h8RWPsQuN4sDq4OHDjwKpS5F_u_kp8hiKEbY';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
