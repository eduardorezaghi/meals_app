import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/widgets/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(
    const TextTheme(
      headlineLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      headlineSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
      titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  ),
);

void main() {
  // Wrap the app with ProviderScope.
  // This will allow the app to access the providers.
  runApp(const ProviderScope(child: App()));
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const Tabs()
    );
  }
}
