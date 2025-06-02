// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/cart_provider.dart';
import './screens/main_screen.dart'; // Vamos criar este arquivo a seguir

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => CartProvider(), // Disponibiliza o CartProvider na árvore de widgets
      child: MaterialApp(
        title: 'Mercado Halloween Cabuloso',
        theme: ThemeData(
          primarySwatch: Colors.orange, // Um tema que combine com Halloween
          hintColor: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          brightness: Brightness.dark, // Tema escuro pode ser legal!
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black87,
            titleTextStyle: TextStyle(color: Colors.orange, fontSize: 20, fontWeight: FontWeight.bold),
            iconTheme: IconThemeData(color: Colors.orange),
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Colors.orange,
            unselectedItemColor: Colors.grey,
            backgroundColor: Colors.black54,
          ),
        ),
        home: const MainScreen(), // Tela principal que gerenciará as Tabs
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}