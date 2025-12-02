import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:couldai_user_app/pages/home_page.dart';

void main() {
  runApp(const XboxLauncherApp());
}

class XboxLauncherApp extends StatelessWidget {
  const XboxLauncherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xbox Style Launcher',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF101010), // Xbox Dark Grey
        primaryColor: const Color(0xFF107C10), // Xbox Green
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF107C10),
          secondary: Color(0xFF2D2D2D),
          surface: Color(0xFF1F1F1F),
          background: Color(0xFF101010),
        ),
        useMaterial3: true,
        fontFamily: 'Segoe UI', // Common on Xbox/Windows, falls back if not available
      ),
      home: const HomePage(),
    );
  }
}
