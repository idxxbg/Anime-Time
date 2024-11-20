import 'package:anime_world_tutorial/config/theme/app_theme.dart';
import 'package:anime_world_tutorial/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(systemNavigationBarColor: Colors.transparent),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(
        body: Center(
          child: HomeScreen(),
        ),
      ),
      // thene: AppTheme.lightTheme;
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,

      // ThemeData(
      // colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
      // primaryColor: Colors.pinkAccent,
      // useMaterial3: true,
      // ),
      debugShowCheckedModeBanner: false,
    );
  }
}
