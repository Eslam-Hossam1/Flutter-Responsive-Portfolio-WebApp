import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class EnvConfig {
  static String get supabaseUrl => dotenv.env['Supabase_Url']!;
  static String get supabaseAnonKey => dotenv.env['Supabase_Anon_Key']!;
}
