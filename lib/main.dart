import 'package:flutter/material.dart';
import 'package:ict_hub_session/pages/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://mbpadqmjzirzxibjstoe.supabase.co';
const supabaseKey = String.fromEnvironment('SUPABASE_KEY');
Future<void> main() async {
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
