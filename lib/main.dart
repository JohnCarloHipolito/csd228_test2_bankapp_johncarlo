import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'splash.dart';
import 'login.dart';
import 'user_data.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFFEA7024),
          ),
        ),
        cardTheme: CardTheme(
          elevation: 1,
          margin: const EdgeInsets.all(8),
          color: Colors.white,
          surfaceTintColor: const Color(0xFFEA7024),
        ),

      ),
      home: const SplashScreen(nextPage: LoginPage()),
    );
  }
}