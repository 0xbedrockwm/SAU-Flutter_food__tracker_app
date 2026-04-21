import 'package:flutter/material.dart';
import 'package:flutter_task_app/views/splash_screen_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  //----------กำหนดค่าการติดต่อกับ Project supabase ที่ทำงานด้วย------------------
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
      url: 'https://bnpgoiaxfznbbqdixcve.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJucGdvaWF4ZnpuYmJxZGl4Y3ZlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzUyMDkyMzYsImV4cCI6MjA5MDc4NTIzNn0.cg_edJ0xFNSL5wqxMdGkDNtl_9TyqcxdDhIWhphKask');
  //------------------------------------------------------------------------
  runApp(
    FlutterFoodTrackerApp(),
  );
}

//--------------------------------------------------------------------------
class FlutterFoodTrackerApp extends StatelessWidget {
  const FlutterFoodTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Tracker App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.promptTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const SplashScreenUi(),
    );
  }
}
