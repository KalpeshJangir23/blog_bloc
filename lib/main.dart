import 'package:blog_app/core/config/api/supa.dart';
import 'package:blog_app/core/config/theme/theme.dart';
import 'package:blog_app/presentation/auth/pages/signIn_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: Supa.supeUrl, anonKey: Supa.supeAnon);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Blog App',
        theme: AppTheme.darkThemeMode,
        home: const SignINPage());
  }
}
