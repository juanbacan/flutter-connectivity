import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba2/pages/aut_checker_page.dart';
import 'package:prueba2/pages/home_page.dart';
import 'package:prueba2/pages/login_page.dart';
import 'package:prueba2/pages/register_page.dart';
import 'package:prueba2/pages/splash_screen.dart';
import 'package:prueba2/services/auth_service.dart';
import 'package:prueba2/services/connectivity_service.dart';
import 'package:prueba2/services/data_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ConnectivityService()),
        ChangeNotifierProvider(create: (context) => AuthService(Provider.of<ConnectivityService>(context, listen: false))),
        ChangeNotifierProvider(create: (context) => DataService(Provider.of<ConnectivityService>(context, listen: false))),
      ],
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
      home: const AuthCheckerPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/splash': (context) => const SplashPage(), // Agregamos la ruta '/splash' para que sea accesible desde cualquier lugar
        '/register': (context) => RegisterPage(),
      },
    );
  }
}






