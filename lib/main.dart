import 'package:florida_rental_car/app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  String supabaseUrl = dotenv.env['SUPABASE_URL'] ?? '';
  String supabaseKey = dotenv.env['SUPABASE_KEY'] ?? '';
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );
  
  runApp(const MyApp());
}

