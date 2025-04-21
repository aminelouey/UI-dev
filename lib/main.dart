// fichier Modifier

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:window_manager/window_manager.dart';
import 'home_screen.dart';
import 'theme_service.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  // La taille  de la fenêtre
  await Future.delayed(Duration(milliseconds: 200));
  await windowManager.setSize(const Size(1300, 800));
  await windowManager.setMinimumSize(const Size(1000, 800));
  await windowManager.setResizable(true);
  // await windowManager.maximize();
  // await windowManager.setResizable(true);
  // await windowManager.setMinimumSize(const Size(1000, 800));

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _PatientManagementAppState();
}

class _PatientManagementAppState extends State<MyApp> {
  final ThemeService _themeService = ThemeService();

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);

    return AnimatedBuilder(
      animation: _themeService,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gestion des Patients',
          theme: themeService.themeData,
          home: HomeScreen(themeService: _themeService),
        );
      },
    );
  }
}
